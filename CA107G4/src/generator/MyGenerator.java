//以下被註解的第9行、15行、28行為原Hibernate3-4的做法

package generator;

import java.io.*;
import java.sql.*;

import org.hibernate.HibernateException;
//import org.hibernate.engine.SessionImplementor;
import org.hibernate.engine.spi.SharedSessionContractImplementor;
import org.hibernate.id.IdentifierGenerator;

import android.com.goodsorder.model.GoodsOrderVO;

public class MyGenerator implements IdentifierGenerator {

//	public Serializable generate(SessionImplementor session, Object object)
	public Serializable generate(SharedSessionContractImplementor session, Object object)
			throws HibernateException {

		String prefix = GeneratorsType.prefix.get(object.getClass().toGenericString());
		
		
		String VOname = object.getClass().getSimpleName();
		String sequenceName = VOname.substring(0, VOname.length()-2);
		
		
		String Id = null;
		Connection con = session.connection();
		try {
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT "+sequenceName+"_seq.NEXTVAL as nextval FROM DUAL");
			rs.next();
			int nextval = rs.getInt("nextval");
			
		
			ResultSet rsTable = stmt.executeQuery("SELECT * FROM "+sequenceName);
			int stringLength = rsTable.getMetaData().getColumnDisplaySize(1);
			
			
			Id = addZero(prefix, nextval, stringLength);
			
//			con.close();   //於Hibernate 5 不可關閉連線
		} catch (SQLException e) {
			throw new HibernateException("Unable to generate Sequence");
		}
		return Id;
	}
	
	
	private String addZero(String prefix, int nextval, int stringLength) {
		int ZeroCount = stringLength - (prefix+nextval).length();
		
		String Zeros = "";
		for(int i=0; i<ZeroCount; i++) {
			Zeros += "0";
		}
		return prefix+Zeros+nextval;
		
	}
	
	
	
}



