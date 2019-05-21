package android.com.websocketconfirm.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Collectors;

import javax.websocket.CloseReason;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.Gson;

import android.com.websocketconfirm.model.MyLocationVO;

@ServerEndpoint("/WhoAroundsWS/{userName}")
public class WhoAroundsWS {
	private static Map<String, Session> sessionsMap = new ConcurrentHashMap<>();
	private static Map<String, MyLocationVO> myLocationMap = new HashMap<>();

	Gson gson = new Gson();

	@OnOpen
	public void onOpen(@PathParam("userName") String userName, Session userSession) throws IOException {

		sessionsMap.put(userName, userSession);

		String text = String.format("Session ID = %s, connected; userName = %s", userSession.getId(), userName);
		System.out.println("WhoAroundsWS "+text);
	}

	@OnMessage
	public void onMessage(Session userSession, String message) {

		MyLocationVO mylocation = gson.fromJson(message, MyLocationVO.class);
		myLocationMap.put(mylocation.getMemberId(), mylocation);
		

		Set<MyLocationVO> whoOnLine = myLocationMap.values().stream().distinct().collect(Collectors.toSet());
		
		
//		userSession.getAsyncRemote().sendText(gson.toJson(whoOnLine));
		//傳給所有人
		sessionsMap.values().stream()
					.forEach(sess -> sess.getAsyncRemote().sendText(gson.toJson(whoOnLine)));

		System.out.println("Message received: " + message);
	}

	@OnError
	public void onError(Session userSession, Throwable e) {
		System.out.println("Error: " + e.toString());
	}

	@OnClose
	public void onClose(Session userSession, CloseReason reason) {
		Set<String> userNames = sessionsMap.keySet();

		for (String userName : userNames) {
			if (sessionsMap.get(userName).equals(userSession)) {
				myLocationMap.remove(userName);
				sessionsMap.remove(userName);
				break;
			}
		}

		String text = String.format("session ID = %s, disconnected; close code = %d%nusers: %s", userSession.getId(),
				reason.getCloseCode().getCode(), userNames);
		System.out.println(text);
	}
}
