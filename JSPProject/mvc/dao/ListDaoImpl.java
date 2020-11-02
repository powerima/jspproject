/*
 * 	2020. 10. 30
 * 
 * 	mvc 패턴 
 * 
 * 	DAO 클래스
 * 
 *  WebContent - mvc 폴더
 * 	Java Resource - mvc - ListController.java
 * 						- ListELController.java
 * 	
 * 	
 * 
 */
package dao;

import java.sql.*;
import java.util.*;

import conn.DBConnect;
import model.Member;

public class ListDaoImpl {
	DBConnect db = DBConnect.getInstance();
	
	public List selectAll() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
				
		String sql = "select * from member_tbl_mvc order by id desc";
		
		ArrayList<Member> list = new ArrayList<Member>();
		
		try {
			conn = db.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new Member(rs.getString(1), 
						rs.getString(2), rs.getString(3), rs.getString(4)));	
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return list;
	}
}
