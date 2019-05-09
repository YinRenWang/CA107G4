//以下被註解的第9行、15行、28行為原Hibernate3-4的做法

package generator;

import java.io.*;
import java.sql.*;

import org.hibernate.HibernateException;
//import org.hibernate.engine.SessionImplementor;
import org.hibernate.engine.spi.SharedSessionContractImplementor;
import org.hibernate.id.IdentifierGenerator;

public class LiveStreamGenerator implements IdentifierGenerator {

//	public Serializable generate(SessionImplementor session, Object object)
	public Serializable generate(SharedSessionContractImplementor session, Object object)
			throws HibernateException {

		String prefix = "LV0000";
		String empno = null;
		Connection con = session.connection();
		try {
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT LiveStream_seq.NEXTVAL as nextval FROM DUAL");
			rs.next();
			int nextval = rs.getInt("nextval");
			empno = prefix + nextval;
//			con.close();   //於Hibernate 5 不可關閉連線
		} catch (SQLException e) {
			throw new HibernateException("Unable to generate Sequence");
		}
		return empno;
	}
}