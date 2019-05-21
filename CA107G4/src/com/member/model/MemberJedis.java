package com.member.model;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

import redis.clients.jedis.BitOP;
import redis.clients.jedis.Jedis;

public class MemberJedis {
	
	public void insertVerifyCode(String memId,String verifyCode) {
		//建立連線輸入密碼
		Jedis jedis = new Jedis("localhost", 6379);
		jedis.auth("123456");
		
		//放入驗證碼
		jedis.set(memId,verifyCode);
	}
	
	public boolean checkVerifyCode(String userMemId,String userVerifyCode) {
		//建立連線輸入密碼
		Jedis jedis = new Jedis("localhost", 6379);
		jedis.auth("123456");
		
		//檢查驗證碼
		String verifyCode =jedis.get(userMemId);
		if(userVerifyCode.equals(verifyCode)) {
			return true;
		}
		return false;
	}
	public static void main(String[] args) {Jedis jedis = new Jedis("localhost", 6379);
	jedis.auth("123456");
		jedis.set("weshare08","dzdvimmf7uXCu5S");
	}
	

}
