package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import conn.DBConn;
import model.T1106_TestVo;

public class T1106_SelectDaoImpl {
	private DBConn db;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private String sql;
	
	public T1106_SelectDaoImpl() {
		db = DBConn.getInstance();
	}
		
	public List<T1106_TestVo> select(){
		List<T1106_TestVo> list = null;
		try {			
			conn = db.getConnection();
			sql = "select * from t1105";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			list = new ArrayList<T1106_TestVo>();
			T1106_TestVo t;
			while(rs.next()) {				
				t = new T1106_TestVo();				
				t.setNum(rs.getString("num"));
				t.setName(rs.getString("name"));
				t.setAge(rs.getString("age"));
				t.setEmail(rs.getString("email"));
				
				list.add(t);
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return list;		
	}
}
