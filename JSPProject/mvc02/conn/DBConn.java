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
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
