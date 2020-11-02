package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import conn.DBConn;
import dto.MemberVo;

public class FormDaoImpl implements FormDao{
	private DBConn db;
	private Connection conn;
	private PreparedStatement pstmt;
	private String sql;
	
	public FormDaoImpl() {
		db = DBConn.getInstance();
		conn = db.getConnection();
	}
	public void insert(MemberVo m) {
		try {
			sql = "insert into member_tbl_mvc02";
			sql += "(custno, custname, phone, address, joindate, grade, city) ";
			sql += "values (?,?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m.getCustno());
			pstmt.setString(2, m.getCustname());
			pstmt.setString(3, m.getPhone());
			pstmt.setString(4, m.getAddress());
			pstmt.setString(5, m.getJoindate());
			pstmt.setString(6, m.getGrade());
			pstmt.setString(7, m.getCity());
			pstmt.executeUpdate();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(pstmt != null) try { pstmt.close(); }catch(Exception ex) {}
			if(conn != null) try { conn.close(); }catch(Exception ex) {}
		}
	}

}
