package dao;

import java.sql.*;
import java.util.*;

import conn.DBConn;
import dto.MemberVo;

public class MemberDaoImpl implements MemberDao{
	private DBConn db;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private String sql;	
	
	public MemberDaoImpl() {
		db = DBConn.getInstance();
		conn = db.getConnection();
	}
	
	
	// MemberDeleteController, member_list_jstl.jsp 에서 사용
	public void delete(MemberVo m) {
		try {			
			sql = "delete from member_tbl_mvc02 where custno = ?";
			
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
	
	
	// MemberEditController, member_edit.jsp 에서 사용
	public MemberVo edit(int custno) {
		MemberVo m = null;
		try {
			sql = "select * from member_tbl_mvc02 where custno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, custno);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				m = new MemberVo();
				m.setCustno(rs.getInt("custno"));
				m.setCustname(rs.getString("custname"));
				m.setPhone(rs.getString("phone"));
				m.setAddress(rs.getString("address"));
				m.setJoindate(rs.getString("joindate").substring(0, 10));
				m.setGrade(rs.getString("grade"));
				m.setCity(rs.getString("city"));
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(rs != null) try { rs.close(); }catch(Exception ex) {}
			if(pstmt != null) try { pstmt.close(); }catch(Exception ex) {}
			if(conn != null) try { conn.close(); }catch(Exception ex) {}
		}
		return m;
	}	
	
	
	// MemberFormController, member_form.jsp 에서 사용
	public void insert(MemberVo m) {
		try {
			conn = db.getConnection();
			PreparedStatement pstmt;
			
			sql = "insert into member_tbl_mvc02";
			sql += "(custno, custname, phone, address, joindate, grade, city) ";
			sql += "values(?,?,?,?,?,?,?)";
		
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
			if(pstmt != null) try{ pstmt.close(); }catch(Exception ex) {}
			if(conn != null) try { conn.close(); }catch(Exception ex) {}
		}
		
	}
	
	
	// MemberSelectController, member_list_jstl.jsp 에서 사용
	public List<MemberVo> selectAll(MemberVo m){
		String ch1 = m.getCh1();
		String ch2 = m.getCh2();
		
		List<MemberVo> list = null;
		
		try {
			if(m.getCh2() == null) {				
				sql = "select * from member_tbl_mvc02";
				pstmt = conn.prepareStatement(sql);
			} else {
				if(m.getCh1().equals("custname")) {
					sql = "select * from member_tbl_mvc02 where custname like '%'||?||'%'";
				} else {
					sql = "select * from member_tbl_mvc02 where custno like '%'||?||'%'";
				}
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, m.getCh2());
			}
			
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
			if(pstmt != null) try { pstmt.close(); }catch(Exception ex) {}
			if(conn != null) try { conn.close(); }catch(Exception ex) {}
		}
		return list;
	}
	
	
	// MemberUpdateController, member_edit.jsp 에서 사용
	public void update(MemberVo m) {
		try {
			sql = "update member_tbl_mvc02 set custname = ?, phone = ?, address = ?, joindate = ?, grade = ?, city = ? where custno = ?";			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getCustname());
			pstmt.setString(2, m.getPhone());
			pstmt.setString(3, m.getAddress());
			pstmt.setString(4, m.getJoindate());
			pstmt.setString(5, m.getGrade());
			pstmt.setString(6, m.getCity());
			pstmt.setInt(7, m.getCustno());			
			pstmt.executeUpdate();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(pstmt != null) try { pstmt.close(); }catch(Exception ex) {}
			if(conn != null) try { conn.close(); }catch(Exception ex) {}
		}
	}
}
