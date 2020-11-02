package dao;

import java.sql.*;
import java.util.List;

import conn.DBConnect;
import model.Member;

public class EditDaoImpl {
	DBConnect db = DBConnect.getInstance();
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	String sql;
	
	public void edit(Member m) {
		
		try {
			sql = "update member_tbl_mvc set ";
			sql += "pwd = ?, name = ?, email = ?";
			
			conn = db.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getPwd());
			pstmt.setString(2, m.getName());
			pstmt.setString(3, m.getEmail());
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}		
		return;
	}
	
	
	public Member select(String id) {
		Member m = new Member();
		try {
			
			sql = "select * from member_tbl_mvc where = ?";
			
			conn = db.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				m.setId(rs.getString(1));
				m.setPwd(rs.getString(2));
				m.setName(rs.getString(3));
				m.setEmail(rs.getString(4));				
			}			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return m;
	}
	
	
}
