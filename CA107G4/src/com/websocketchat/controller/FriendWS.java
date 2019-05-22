package com.websocketchat.controller;


import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.Collection;
import java.util.List;
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
import com.websocketchat.jedis.JedisHandleMessage;
import com.websocketchat.model.State;

import com.websocketchat.model.ChatMessage;


@ServerEndpoint("/FriendWS/{userName}")
public class FriendWS {
	private static Map<String, Session> sessionsMap = new ConcurrentHashMap<>();
	Gson gson = new Gson();

	@OnOpen
	public void onOpen(@PathParam("userName") String userName, Session userSession) throws IOException {
		/* save the new user in the map */

		int maxBufferSize = 500 * 1024;
		userSession.setMaxTextMessageBufferSize(maxBufferSize);
		userSession.setMaxBinaryMessageBufferSize(maxBufferSize);
		sessionsMap.put(userName, userSession);
		/* Sends all the connected users to the new user */
		Set<String> userNames = sessionsMap.keySet();
		State stateMessage = new State("open", userName, userNames);
		String stateMessageJson = gson.toJson(stateMessage);
		Collection<Session> sessions = sessionsMap.values();
		for (Session session : sessions) {
			if(session != null && session.isOpen()) {
				session.getBasicRemote().sendText(stateMessageJson);
			}
		}

		String text = String.format("Session ID = %s, connected; userName = %s%nusers: %s", userSession.getId(),
				userName, userNames);
		System.out.println(text);
	}

	@OnMessage
	public void onMessage(Session userSession, String message) throws Throwable {
		ChatMessage chatMessage = gson.fromJson(message, ChatMessage.class);
		String sender = chatMessage.getSender();
		String receiver = chatMessage.getReceiver();
		System.out.println("有觸發");

		if ("history".equals(chatMessage.getType())) {
			List<String> historyData = JedisHandleMessage.getHistoryMsg(sender, receiver);// get the old info from redis
			if (userSession != null && userSession.isOpen()) {
//				for(String str : historyData) {
////					try {
////						Thread.sleep(2);
////					} catch (InterruptedException e2) {
////						e2.printStackTrace();
////					};
//					ChatMessage cm = gson.fromJson(str, ChatMessage.class);
//					if("image".equals(cm.gettOrm()))
//						try {
//						System.out.println(str);
//							userSession.getBasicRemote().sendBinary(ByteBuffer.wrap(str.getBytes()));
//						} catch (IOException e1) {
//							e1.printStackTrace();
//						}
//					else
//						try {
//							System.out.println(str);
//							userSession.getBasicRemote().sendText(str);
//						} catch (IOException e) {
//							e.printStackTrace();
//						}
				
//				}
				
			userSession.getBasicRemote().sendBinary(ByteBuffer.wrap(gson.toJson(historyData).getBytes("utf-8")));
			
			System.out.println(gson.toJson(historyData));
				return;
			}
		}

		if ("chat".equals(chatMessage.getType())) {
			String msg = chatMessage.getMessage();
			String base64tag="data:image/png;base64,";
			int start=base64tag.length();
			
			if(msg.contains(base64tag)) {
				msg = msg.substring(start, msg.length());
				chatMessage.setMessage(msg);
			}
			
			JedisHandleMessage.saveChatMessage(sender, receiver, gson.toJson(chatMessage));

			// send to session which receiver belongs to
			Session receiverSession = sessionsMap.get(receiver);
			Session senderSession = sessionsMap.get(sender);
			
			if("image".equals(chatMessage.gettOrm())) {
				if (senderSession != null && senderSession.isOpen()) {
					senderSession.getBasicRemote().sendBinary(ByteBuffer.wrap(gson.toJson(chatMessage).getBytes("utf-8")));
				}
				if (receiverSession != null && receiverSession.isOpen()) {
					receiverSession.getBasicRemote().sendBinary(ByteBuffer.wrap(gson.toJson(chatMessage).getBytes("utf-8")));
				}		
			}else {
				if (senderSession != null && senderSession.isOpen()) {
					senderSession.getBasicRemote().sendText(message);
				}
				if (receiverSession != null && receiverSession.isOpen()) {
					receiverSession.getBasicRemote().sendText(message);
				}
			}
			
		}
		System.out.println("Message received: " + message);
	}

	@OnError
	public void onError(Session userSession, Throwable e) {
		System.out.println("Error: " + e.toString());
	}

	@OnClose
	public void onClose(Session userSession, CloseReason reason) throws Throwable {
		String userNameClose = null;
		Set<String> userNames = sessionsMap.keySet();
		for (String userName : userNames) {
			if (sessionsMap.get(userName).equals(userSession)) {
				userNameClose = userName;
				sessionsMap.remove(userName);
				break;
			}
		}

		if (userNameClose != null) {
			State stateMessage = new State("close", userNameClose, userNames);
			String stateMessageJson = gson.toJson(stateMessage);
			Collection<Session> sessions = sessionsMap.values();
			for (Session session : sessions) {
				session.getBasicRemote().sendText(stateMessageJson);
			}
		}

		String text = String.format("session ID = %s, disconnected; close code = %d%nusers: %s", userSession.getId(),
				reason.getCloseCode().getCode(), userNames);
		System.out.println(text);
	}
}
