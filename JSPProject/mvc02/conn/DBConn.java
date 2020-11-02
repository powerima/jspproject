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
import java.sql.DriverManager;

public class DBConn {
	private static DBConn db = new DBConn();
	
	private DBConn() {}

	public static DBConn getInstance() {
		return db;
	}
	
	public Connection getConnection() {
		Connection conn = null;
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(
				"jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return conn;
	}
}
