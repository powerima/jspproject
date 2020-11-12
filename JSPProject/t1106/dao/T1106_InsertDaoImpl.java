package dao;

import java.sql.*;

import conn.DBConn;
import model.T1106_TestVo;

public class T1106_InsertDaoImpl {
	private DBConn db;
	private Connection conn;
	private PreparedStatement pstmt;
	private String sql;
	
	public T1106_InsertDaoImpl() {
		db = DBConn.getInstance();
	}

	public void insert(T1106_TestVo t) {
		try {
						
			sql = "insert into T1105(num,name, age, email) ";
			sql += "values(st1105.nextval, ?,?,?)";
			conn = db.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, t.getName());
			pstmt.setString(2, t.getAge());
			pstmt.setString(3, t.getEmail());
			pstmt.executeUpdate();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
	}
	
	
}
