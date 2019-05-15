package generator;

import java.util.HashMap;
import java.util.Map;

import android.com.goods.model.GoodsVO;
import android.com.goodsorder.model.GoodsOrderVO;
import android.com.livestream.model.LiveStreamVO;
import android.com.teacher.model.TeacherVO;

public class GeneratorsType {
	
	public static Map<String, String> prefix = new HashMap<>();
	
	
	
	
	//註冊sequence的 prefix 名稱
	static {
		prefix.put(GoodsVO.class.toGenericString(), "GD");
		prefix.put(GoodsOrderVO.class.toGenericString(), "GO");
		prefix.put(LiveStreamVO.class.toGenericString(), "LV");
		prefix.put(TeacherVO.class.toGenericString(), "TC");
	}
	
}
