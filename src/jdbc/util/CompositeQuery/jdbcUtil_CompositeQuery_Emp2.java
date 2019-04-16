/*
 *  1. 萬用複合查詢-可由客戶端隨意增減任何想查詢的欄位
 *  2. 為了避免影響效能:
 *        所以動態產生萬用SQL的部份,本範例無意採用MetaData的方式,也只針對個別的Table自行視需要而個別製作之
 * */


package jdbc.util.CompositeQuery;

import java.util.*;

public class jdbcUtil_CompositeQuery_Emp2 {

	public static String get_aCondition_For_Oracle(String columnName, String value) {

		String aCondition = null;

		if ("inscId".equals(columnName) || "teacherId".equals(columnName) || "courseId".equals(columnName) || "insctype".equals(columnName)|| "inscPeople".equals(columnName)|| "inscPrice".equals(columnName)|| "inscStatus".equals(columnName)) // 用於其他
			
			aCondition = columnName + "=" + value;
		else if ("inscLoc".equals(columnName) || "inscLang".equals(columnName)|| "inscCourser".equals(columnName)) // 用於varchar
			aCondition = columnName + " LIKE '%" + value + "%'";
		return aCondition + " ";
	}

	public static String get_WhereCondition(Map<String, String[]> map) {
		Set<String> keys = map.keySet();
		StringBuffer whereCondition = new StringBuffer();
		int count = 0;
		for (String key : keys) {
			String value = map.get(key)[0];
			if (value != null && value.trim().length() != 0	&& !"action".equals(key)) {
				count++;
				String aCondition = get_aCondition_For_Oracle(key, value.trim());

				if (count == 1)
					whereCondition.append(" WHERE " + aCondition);
				else
					whereCondition.append(" AND " + aCondition);

				System.out.println("有送出查詢資料的欄位數Count = " + count);
			}
		}
		
		return whereCondition.toString();
	}

	public static void main(String argv[]) {

		// 配合 req.getParameterMap()方法 回傳 java.util.Map<java.lang.String,java.lang.String[]> 之測試
		Map<String, String[]> map = new TreeMap<String, String[]>();
		map.put("inscId", new String[] { "IC00001" });
		map.put("teacherId", new String[] { "TC00001" });
		map.put("courseId", new String[] { "0005" });
		map.put("inscLoc", new String[] { "桃園市" });
		map.put("inscType", new String[] { "0" });
		map.put("inscLang", new String[] { "中文" });
		map.put("inscPeople", new String[] { "中文" });
		map.put("inscPrice", new String[] { "600" });
		map.put("inscCourser", new String[] { "Java" });
		map.put("inscStatus", new String[] { "0" });
		map.put("action", new String[] { "getXXX" }); // 注意Map裡面會含有action的key

		String finalSQL = "SELECT * FROM INSCOURSE "
				          + jdbcUtil_CompositeQuery_Emp2.get_WhereCondition(map)
				          + "ORDER BY inscId";
		System.out.println("●●FinalSQL = " + finalSQL);

	}
}
