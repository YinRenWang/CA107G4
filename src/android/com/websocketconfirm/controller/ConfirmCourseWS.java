package android.com.websocketconfirm.controller;

import java.io.IOException;
import java.util.Calendar;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

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
	private static Map<String, Session> sessionsMap = new ConcurrentHashMap<>();
	Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd hh:mm:ss").create();

	@OnOpen
	public void onOpen(@PathParam("userName") String userName, Session userSession) throws IOException {
		sessionsMap.put(userName, userSession);
		String text = String.format("Session ID = %s, connected; userName = %s", userSession.getId(), userName);
		 System.out.println("ConfirmCourseWS "+text);
	}

	@OnMessage
	public void onMessage(Session userSession, String message) {
		CourseReservationVO crVO = gson.fromJson(message, CourseReservationVO.class);
		TeacherService techSvc = new TeacherService();
		String memId = valueGetKey(userSession);
		String teacherId = techSvc.findByMemId(memId).getTeacherId();
		Session studentSess = sessionsMap.get(crVO.getMemId());

		Long now = Calendar.getInstance().getTimeInMillis();
		Long courseStart = crVO.getCrvMFD().getTime() - 15 * 60 * 1000;
		if (now - courseStart < 0) {
			userSession.getAsyncRemote().sendText("not_yet");
			studentSess.getAsyncRemote().sendText("not_yet");
		} else {
			// 驗證上課
			if (memId.equals(crVO.getMemId()) || teacherId.equals(crVO.getTeacherId())) {
				CourseReservationService crvSvc = new CourseReservationService();
				crvSvc.ConfirmCourse(crVO.getCrvId());
				userSession.getAsyncRemote().sendText("success");
				studentSess.getAsyncRemote().sendText("success");
			} else {
				userSession.getAsyncRemote().sendText("fail");
				studentSess.getAsyncRemote().sendText("fail");
			}
		}

		 System.out.println("Message received: " + message);
	}

//	@OnError
//	public void onError(Session userSession, Throwable e) {
//		// System.out.println("Error: " + e.toString());
//	}

	@OnClose
	public void onClose(Session userSession, CloseReason reason) {
		Set<String> userNames = sessionsMap.keySet();
		for (String userName : userNames) {
			if (sessionsMap.get(userName).equals(userSession)) {
				sessionsMap.remove(userName);
				break;
			}
		}

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