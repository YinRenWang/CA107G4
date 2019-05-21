package android.com.websocketconfirm.controller;

import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.websocket.CloseReason;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import android.com.coursereservation.model.CourseReservationService;
import android.com.coursereservation.model.CourseReservationVO;
import android.com.teacher.model.TeacherService;

@ServerEndpoint("/ConfirmCourseWS/{userName}")
public class ConfirmCourseWS {
	private static Map<String, Session> sessionsMap = new HashMap<>();
	Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd hh:mm:ss").create();

	@OnOpen
	public void onOpen(@PathParam("userName") String userName, Session userSession) throws IOException {
		sessionsMap.put(userName, userSession);
		String text = String.format("Session ID = %s, connected; userName = %s", userSession.getId(), userName);
		System.out.println("ConfirmCourseWS " + text);
	}

	@OnMessage
	public void onMessage(Session userSession, String message) {
		
		CourseReservationVO crVO = gson.fromJson(message, CourseReservationVO.class);
		TeacherService techSvc = new TeacherService();
		
		String memId = valueGetKey(userSession);
		
		Session studentSess;
		Session teacherSess; 
		
		
		if(memId.equals(crVO.getMemId())) {
			//學生進來
			studentSess = userSession;
			teacherSess = sessionsMap.get(techSvc.findOneById(crVO.getTeacherId()).getMemId());
		}else {
			//老師進來
			studentSess = sessionsMap.get(crVO.getMemId());
			teacherSess = userSession;
		}
		
		
				
		Long now = Calendar.getInstance().getTimeInMillis();
		Long courseStart = crVO.getCrvMFD().getTime() - 60 * 60 * 1000*24*7;
		try {
			if (now - courseStart < 0) {
				teacherSess.getBasicRemote().sendText("not_yet");
				studentSess.getBasicRemote().sendText("not_yet");
				return;
			} else {
				// 驗證上課
				if (memId.equals(techSvc.findOneById(crVO.getTeacherId()).getMemId()) || memId.equals(crVO.getMemId())) {
					CourseReservationService crvSvc = new CourseReservationService();
					try {
						int classStatus = crvSvc.findByPrimaryKey(crVO.getCrvId()).get(0).getClassStatus();
						if(classStatus == 0) {
							crvSvc.ConfirmCourse(crVO.getCrvId());
							
						}else {
							userSession.getBasicRemote().sendText("had_success");
							return;
						}
						
					} catch (Exception e) {
						userSession.getBasicRemote().sendText("had_success");
						return;
					}
					teacherSess.getBasicRemote().sendText("success");
					studentSess.getBasicRemote().sendText("success");
					return;
				} else {
					teacherSess.getBasicRemote().sendText("fail");
					studentSess.getBasicRemote().sendText("fail");
					return;
				}
			}
		} catch (Exception r) {
			System.out.println("00" + r);
		}
		
		System.out.println("Message received: " + message);
	}

	@OnError
	public void onError(Session userSession, Throwable e) {
		e.printStackTrace();
	}

	@OnClose
	public void onClose(Session userSession, CloseReason reason) {
		
		String userNames = valueGetKey(userSession);
		sessionsMap.remove(userNames);
		

		String text = String.format("session ID = %s, disconnected; close code = %d%nusers: %s", userSession.getId(),
				reason.getCloseCode().getCode(), userNames);
		System.out.println(text);
	}

	private String valueGetKey(Session userSession) {
		Set set = sessionsMap.entrySet();
		Iterator it = set.iterator();
		while (it.hasNext()) {
			Map.Entry entry = (Map.Entry) it.next();
			if (entry.getValue().equals(userSession)) {
				String s = (String) entry.getKey();
				return s;
			}
		}
		return "";
	}
}