/*
 * 	2020. 10. 30
 * 
 * 	mvc 패턴 
 * 
 * 	DAO 클래스
 * 
 *  WebContent - mvc 폴더
 * 	Java Resource - mvc - JoinController.java
 * 	
 * 	
 * 
 */

package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import conn.DBConnect;
import model.Member;

public class JoinDaoImpl {
	
	Connection conn;
	PreparedStatement pstmt;
	String sql;
	
	public void insert(Member m) {
		try {
			conn = DBConnect.getConnection();
			sql = "insert into member_tbl_mvc values(?,?,?,?)";		
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getId());
			pstmt.setString(2, m.getPwd());
			pstmt.setString(3, m.getName());
			pstmt.setString(4, m.getEmail());			
			pstmt.executeUpdate();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			DBConnect.close(pstmt, conn);
		}
	}
}
