package dao;

import java.sql.*;
import java.util.*;

import conn.DBConn;
import dto.GuestVo;

public class GuestDaoImpl implements GuestDao{
	private DBConn db;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private String sql;
	
	public GuestDaoImpl() {
		db = DBConn.getInstance();
	}
	
	public List<GuestVo> selectAll(int startRow, int endRow, GuestVo g){
		List<GuestVo> list = null;
		
		try {
			String ch2 = g.getCh2();
			conn = db.getConnection();
			
			if(ch2 == null || ch2.equals("")) {				
				sql = "select rownum, p.* " +
						"from (select rownum as rnum, k.* " +
						"from (select * from guest " +
						"order by custname desc) k "+
						"where rownum <= ?	)p " +
						"where rnum >= ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, endRow);
				pstmt.setInt(2, startRow);
				
			}  else {
				String ch1 = g.getCh1();
				sql = "select rownum, p.* " +
						"from (select rownum as rnum, k.* " +
						"from (select * from guest " +
						"where " + ch1 + " like '%'||?||'%' " +
						"order by custname desc) k "+
						"where rownum <= ?	)p " +
						"where rnum >= ?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, g.getCh2());
				pstmt.setInt(2, endRow);
				pstmt.setInt(3, startRow);
			}
			
				
			rs = pstmt.executeQuery();
			
			list = new ArrayList<GuestVo>();
			while(rs.next()) {
				g = new GuestVo();
				
				g = new GuestVo();
				g.setCustno(rs.getInt("custno"));
				g.setCustname(rs.getString("custname"));
				g.setPhone(rs.getString("phone"));
				g.setAddress(rs.getString("address"));
				g.setJoindate(rs.getString("joindate").substring(0, 10));
				g.setRownum(rs.getInt("rownum"));
				g.setRnum(rs.getInt("rnum"));
		
				list.add(g);				
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
	
	public int getCount(GuestVo g) {
		int x = 0;
		
		try {
			conn = db.getConnection();
			String ch2 = g.getCh2();
			
			if(ch2 == null || ch2.equals("")) {				
				sql = "select count(*) from guest";
				pstmt = conn.prepareStatement(sql);
				
			}  else {
				String ch1 = g.getCh1();
				sql = "select count(*) from guest ";
				sql += "where " + ch1 + " like '%'||?||'%' ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, ch2);
			}
			rs = pstmt.executeQuery();
			if(rs.next()) {
				x = rs.getInt(1);
			}
			
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if(rs != null) try { rs.close(); } catch(Exception ex) {}
			if(pstmt != null) try { pstmt.close(); } catch(Exception ex) {}
			if(conn != null) try { conn.close(); } catch(Exception ex) {}
		}
		return x;
	}
}
