
import java.io.*;
import java.util.*;

import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import javax.websocket.Session;
import javax.websocket.OnOpen;
import javax.websocket.OnMessage;
import javax.websocket.OnError;
import javax.websocket.OnClose;
import javax.websocket.CloseReason;

@ServerEndpoint("/MyEchoServer/{teacherID}")
public class MyEchoServer {
	
private static final Set<Session> allSessions = Collections.synchronizedSet(new HashSet<Session>());
private static final HashMap<String,Integer> map = new<String,Integer>HashMap();	
	@OnOpen
	public void onOpen(@PathParam("teacherID") String teacherID,Session userSession) throws IOException {
		allSessions.add(userSession);
		if(map.containsKey(teacherID.toLowerCase())) {
			Integer count=map.get(teacherID.toLowerCase());
			count++;
			map.put(teacherID, count);

		}else {
			map.put(teacherID.toLowerCase(), new Integer(0));

			
		}

	}

	
	@OnMessage
	public void onMessage(Session userSession, String message) {
		for (Session session : allSessions) {
			if (session.isOpen())
				session.getAsyncRemote().sendText(message);
			
		}
		System.out.println("Message received: " + message);
	}
	
	@OnError
	public void onError(Session userSession, Throwable e){

	}
	
	@OnClose
	public void onClose(Session userSession, CloseReason reason,@PathParam("teacherID") String teacherID) {
		allSessions.remove(userSession);
		
		if(map.containsKey(teacherID.toLowerCase())) {
			Integer count=map.get(teacherID.toLowerCase());
			count--;
			map.put(teacherID, count);
			if(count<=0) {
				map.remove(teacherID.toLowerCase());
			}

			
		}
	
		
	}

 
}
