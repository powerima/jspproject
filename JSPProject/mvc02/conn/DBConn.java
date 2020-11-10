/*
 *	2020. 11. 02
 *
 *	DBConnection class - oracle jdbc
 * 
 * 	Java Resource - mvc02
 *  Webcontent - mvc02
 *  
 */
package conn;

import java.sql.Connection;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBConn {
	private static DBConn db = new DBConn();
	
	private DBConn() {}

	public static DBConn getInstance() {
		return db;
	}
	
	public Connection getConnection() throws Exception  {
		Connection conn = null;
		
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/orcl");
		conn = ds.getConnection();
	
	
		return conn;
	}
}
