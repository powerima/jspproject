package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import ex.CD;
import conn.DBConn;

public class T1106_BigInsertDaoImpl {
	private DBConn db;
	private Connection conn;
	private PreparedStatement pstmt;
	private String sql;
	
	public T1106_BigInsertDaoImpl() {
		db = DBConn.getInstance();
	}

	public void insert() {
		try {
			conn = db.getConnection();
			
			sql = "insert into guest(custno, custname, phone, address, joindate) ";
			sql += "values(s_guest.nextval, ?,?,?,?)";
			
			
			pstmt = conn.prepareStatement(sql);
			
			for(int i=0; i<241; i++) {
				pstmt.setString(1, CD.getName());
				pstmt.setString(2, CD.getPhone());
				pstmt.setString(3, CD.getAddress());
				pstmt.setString(4, CD.getDate());
				pstmt.executeUpdate();
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
	}
	
}
