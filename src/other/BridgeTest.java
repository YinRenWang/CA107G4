package other;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class BridgeTest {

	public static void main(String args[]) {
		DateFormat df = new SimpleDateFormat("yyyyMM");
		//获取Calendar实例
		Calendar currentTime = Calendar.getInstance();
		Calendar compareTime = Calendar.getInstance();
	    try {
	    	//把字符串转成日期类型
			currentTime.setTime(df.parse("201406"));
			compareTime.setTime(df.parse("201506"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    //利用Calendar的方法比较大小
	    if (currentTime.compareTo(compareTime) > 0) {
	    	System.out.println("前者時間大");
		}else{
			System.out.println("後面時間大");
		}
	    //转成数字后比较大小
		int startTime = Integer.parseInt("201406");
		int endTime = Integer.parseInt("201506");
		System.out.println(endTime-startTime);
	}

	public static boolean compareToTime(String start,String End) {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		//获取Calendar实例
		Calendar currentTime = Calendar.getInstance();
		Calendar compareTime = Calendar.getInstance();

	    try {
	    	//把字符串转成日期类型
			currentTime.setTime(df.parse(start));
			compareTime.setTime(df.parse(End));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    //利用Calendar的方法比较大小
	    if (currentTime.compareTo(compareTime) > 0) {
	    	return true;
	    	
		}else{
			return false;
		}
	  
	}
	

}
