package dao;

import java.sql.*;
import java.util.*;
import conn.DBConn;
import model.T1106_GuestVo;

public class T1106_BigListDaoImpl {
	private DBConn db;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private String sql;
	
	public T1106_BigListDaoImpl() {
		db = DBConn.getInstance();
	}
	
	public List<T1106_GuestVo> selectAll(int startRow, int endRow){
		List<T1106_GuestVo> list = null;
		
		try{
			T1106_GuestVo g = null;
			sql = "select rownum, p.* " +
					"from (select rownum as rnum, k.* " +
					"from (select custno, custname, phone, address, " +
					"to_char(joindate, 'yyyy-mm-dd') as joindate " +
					"from guest order by custname desc) k "+
					"where rownum <= ?	)p " +
					"where rnum >= ?";
			
			conn = db.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);
			
			rs = pstmt.executeQuery();
			list = new ArrayList<T1106_GuestVo>();
			
			while(rs.next()) {
				g = new T1106_GuestVo();
				g.setCustno(rs.getInt("custno"));
				g.setCustname(rs.getString("custname"));
				g.setPhone(rs.getString("phone"));
				g.setAddress(rs.getString("address"));
				g.setJoindate(rs.getString("joindate"));
				g.setRownum(rs.getInt("rownum"));
				g.setRnum(rs.getInt("rnum"));
		
				list.add(g);				
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
	
	
	// 전체 레코드 개수를 읽어오는 함수
	public int getCount() {
		int count = 0;
		try {
			sql = "select count(*) from guest";
			conn = db.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(rs != null) try { rs.close(); }catch(Exception ex) {}
			if(pstmt != null) try { pstmt.close(); }catch(Exception ex) {}
			if(conn != null) try { conn.close(); }catch(Exception ex) {}
		}
		return count;
	}
}
