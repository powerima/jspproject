package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import conn.DBConn;
import dto.MemberVo;

public class MemberSelectDaoImpl implements MemberSelectDao{
	private DBConn db;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private String sql;
	
	public MemberSelectDaoImpl(){
		db = DBConn.getInstance();
		conn = db.getConnection();
	}
	public List<MemberVo> selectAll(){
		List<MemberVo> list = null;
		
		try {
			sql = "select * from member_tbl_mvc02";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			list = new ArrayList<MemberVo>();
			while(rs.next()) {
				list.add(new MemberVo(rs.getInt("custno"), rs.getString("custname"), rs.getString("phone"), 
						rs.getString("address"), rs.getString("joindate").substring(0,10),
						rs.getString("grade"), rs.getString("city")));
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(rs != null) try { rs.close(); }catch(Exception ex) {}
			if(pstmt != null) try { pstmt.close(); }catch(Exception ex){}
			if(conn != null) try { conn.close(); }catch(Exception ex) {}
		}
		
		return list;				
	}
	
	public List<MemberVo> selectAll(MemberVo m){
		List<MemberVo> list = null;
		
		String ch1 = m.getCh1();
		String ch2 = m.getCh2();
		
		try {
			if(ch2 == null) {
				sql = "select * from member_tbl_mvc02";
			}else {
				sql = "select * from member_tbl_mvc02 ";
				sql += "where " + ch1 + " like '%";
				sql += ch2 + "%' "; 
			}
				
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			list = new ArrayList<MemberVo>();
			while(rs.next()) {
				list.add(new MemberVo(rs.getInt("custno"), rs.getString("custname"), rs.getString("phone"), 
						rs.getString("address"), rs.getString("joindate").substring(0, 10),
						rs.getString("grade"), rs.getString("city")));
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(rs != null) try { rs.close(); }catch(Exception ex) {}
			if(pstmt != null) try { pstmt.close(); }catch(Exception ex){}
			if(conn != null) try { conn.close(); }catch(Exception ex) {}
		}

		return list;
	}
}
