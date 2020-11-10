package dao;

import java.sql.*;
import java.util.*;

import conn.DBConn;
import model.*;

public class T1110_StudentDaoImpl {
	private DBConn db;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private String sql;
	
	public T1110_StudentDaoImpl() {
		db = DBConn.getInstance();
	}
	
	// 학생 다음 번호 얻어오기 - form.jsp
	public int getSno() {
		int sno = 10001;
		try {
			conn = db.getConnection(); 
			sql = "select sno from student_tbl_t1110";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				sno = rs.getInt(1) + 1;
			}
			
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if(rs != null) try { rs.close(); } catch(Exception ex) {}
			if(pstmt != null) try { pstmt.close(); } catch(Exception ex) {}
			if(conn != null) try { conn.close(); } catch(Exception ex) {}
		}
		return sno;
	}
	
	// 학생 목록 얻어오기 - student_list_jstl.jsp
	public List<T1110_StudentVo> selectAll(){
		List<T1110_StudentVo> list = null;
		try {
			T1110_StudentVo s = null;
			
			conn = db.getConnection();
			
			sql = "select * from student_tbl_t1110";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			list = new ArrayList<T1110_StudentVo>();
			while(rs.next()) {
				s = new T1110_StudentVo();
				
				s.setSno(rs.getInt("sno"));
				s.setSname(rs.getString("sname"));
				s.setDeptname(rs.getString("deptname"));
				s.setEng(rs.getInt("eng"));
				s.setMath(rs.getInt("math"));
				
				list.add(s);
			}
			
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if(rs != null) try { rs.close(); } catch(Exception ex) {}
			if(pstmt != null) try { pstmt.close(); } catch(Exception ex) {}
			if(conn != null) try { conn.close(); } catch(Exception ex) {}
		}
		return list;
	}
	
	// 학생 정보 입력하기 - form.jsp
	public void insert(T1110_StudentVo s) {
		try {
			conn = db.getConnection();
			
			sql = "insert into student_tbl_t1110";
			sql += "(sno, sname, deptname, eng, math) ";
			sql += "values(s_student_tbl_t1110.nextval, ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, s.getSname());
			pstmt.setString(2, s.getDeptname());
			pstmt.setInt(3, s.getEng());
			pstmt.setInt(4, s.getMath());
			pstmt.executeUpdate();			

		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if(pstmt != null) try { pstmt.close(); } catch(Exception ex) {}
			if(conn != null) try { conn.close(); } catch(Exception ex) {}
		}
	}
}
