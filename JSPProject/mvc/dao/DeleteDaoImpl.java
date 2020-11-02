/*
 * 	2020. 10. 30
 * 
 * 	mvc 패턴 
 * 
 * 	DAO 클래스
 * 
 *  WebContent - mvc 폴더
 * 	Java Resource - mvc - DeleteController.java
 * 
 */

package dao;

import java.sql.*;

import conn.DBConnect;
import model.Member;

public class DeleteDaoImpl {
	DBConnect db = DBConnect.getInstance();
	Connection conn;
	PreparedStatement pstmt;
	String sql;
	
	public void delete(Member m ) {
		sql = "delete from member_tbl_mvc where id = ?";
		
		try {
			conn = db.getConnection();		
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getId());
			pstmt.executeUpdate();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
	}
	
}
