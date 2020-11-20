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

import java.sql.*;
import java.sql.DriverManager;

public class DBConnect {

	public static DBConnect db = new DBConnect();

	private DBConnect() {
	}

	public static Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return conn;
	}

	public static void close(PreparedStatement pstmt, Connection conn) {
		if (pstmt != null) {
			try {
				if (!pstmt.isClosed()) {
					pstmt.close();
				}
			} catch (Exception ex) {
				ex.printStackTrace();
			} finally {
				pstmt = null;
			}
		}
		
		if (conn != null) {
			try {
				if (!conn.isClosed()) {
					conn.close();
				}
			} catch (Exception ex) {
				ex.printStackTrace();
			} finally {
				conn = null;
			}
		}
	}
	
	public static void close(
			ResultSet rs, PreparedStatement pstmt, Connection conn) {
		if (rs != null) {
			try {
				if (!rs.isClosed()) {
					rs.close();
				}
			} catch (Exception ex) {
				ex.printStackTrace();
			} finally {
				rs = null;
			}
		}
		
		if (pstmt != null) {
			try {
				if (!pstmt.isClosed()) {
					pstmt.close();
				}
			} catch (Exception ex) {
				ex.printStackTrace();
			} finally {
				pstmt = null;
			}
		}
		
		if (conn != null) {
			try {
				if (!conn.isClosed()) {
					conn.close();
				}
			} catch (Exception ex) {
				ex.printStackTrace();
			} finally {
				conn = null;
			}
		}
	}
}
