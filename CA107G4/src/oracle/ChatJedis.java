package oracle;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

import com.google.gson.Gson;
import com.websocketchat.jedis.JedisHandleMessage;

import com.websocketchat.model.ChatMessage;
import redis.clients.jedis.BitOP;
import redis.clients.jedis.Jedis;

public class ChatJedis {
	
	public static void main(String[] args) {
	ChatMessage chat=new ChatMessage("chat","we01","we03","聽說今天是Java的生日", "text");
	Gson gson = new Gson();
	JedisHandleMessage.saveChatMessage("we01","we03",gson.toJson(chat));
	System.out.println("Update the database...");
	System.out.println("Update End!");
	}

}
