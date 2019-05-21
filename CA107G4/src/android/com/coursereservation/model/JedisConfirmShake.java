package android.com.coursereservation.model;


import redis.clients.jedis.Jedis;

public class JedisConfirmShake {
	

	public void setNewConfirm(String crvId, String memId) {
		Jedis jedis = new Jedis("localhost", 6379);
		jedis.auth("123456");
		jedis.set(crvId, memId);
		jedis.close();
	}

	public String checkIfWait(String crvId, String memId ) {
		// 對雙方來說，都要各存著歷史聊天記錄
		Jedis jedis = new Jedis("localhost", 6379);
		jedis.auth("123456");
		String memIdFromRedis = jedis.get(crvId);
		if(memId.equals(memIdFromRedis)) {
			jedis.close();
			return "hadCome";
		}else if(memIdFromRedis == null){
			jedis.close();
			return "noData";
		}else {
			jedis.close();
			return "success";
		}
		
		
		
		
	}
	
}
