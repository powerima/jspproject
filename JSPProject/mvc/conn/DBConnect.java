/*
 * 	2020. 10. 30
 * 
 * 	mvc 패턴 DBConnection
 * 
 *  WebContent - mvc 폴더
 * 	Java Resource - mvc 소스폴더 
 * 
 * 
 */
package conn;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	
	public static DBConnect db = new DBConnect();
	private DBConnect() {}
	public static DBConnect getInstance() {
		return db;
	}
	
	public Connection getConnection() {
		Connection conn = null;
		try {						
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return conn;
	}
}
