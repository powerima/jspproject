package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import conn.DBConn;
import dto.MemberVo;

public class MemberDeleteDaoImpl implements MemberDeleteDao{
	private DBConn db;
	private Connection conn;
	private PreparedStatement pstmt;
	private String sql;
	
	public MemberDeleteDaoImpl() {
		db = DBConn.getInstance();
		conn = db.getConnection();
	}
	public void delete(MemberVo m) {
		try {
			sql = "delete from member_tbl_mvc02 ";
			sql += "where custno = ?";
					
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m.getCustno());
			pstmt.executeUpdate();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(pstmt != null) try { pstmt.close(); }catch(Exception ex) {}
			if(conn != null) try { conn.close(); }catch(Exception ex) {}
		}
	}

}
