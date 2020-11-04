package dao;

import java.sql.*;
import java.util.*;

import conn.DBConn;
import dto.ProductVo;

public class ProductDaoImpl implements ProductDao {
	private DBConn db;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private String sql;
	
	public ProductDaoImpl() {
		db = DBConn.getInstance();
		conn = db.getConnection();
	}
	
	
	// select count
	public int productCount() {
		int count = 0;
		
		try {
			sql = "select count(pcode) from product";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(rs != null) try { rs.close(); } catch(Exception ex) {}
			if(pstmt != null) try { pstmt.close(); } catch(Exception ex) {}
			if(conn != null) try { conn.close(); } catch(Exception ex) {}
		}
		return count;
	}
	
	// select
	public ProductVo productSelect(String pcode) {
		ProductVo p = null;
		
		try {
			sql = "select * from product where pcode=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pcode);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				p = new ProductVo();				
				p.setPcode(rs.getString("pcode"));
				p.setPname(rs.getString("pname"));
				p.setPetc(rs.getString("petc"));
				p.setPimg(rs.getString("pimg"));
				p.setPdate(rs.getString("pdate"));
			}
			
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(rs != null) try { rs.close(); }catch(Exception ex) {}
			if(pstmt != null) try { pstmt.close(); }catch(Exception ex) {}
			if(conn != null) try { conn.close(); }catch(Exception ex) {}
		}
		return p;		
	}
	
	// insert - product_form.jsp
	public void productInsert(ProductVo p) {
		try {
			
			sql = "insert into product (pcode, pname, pimg, petc, pdate) " +
				" values(?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p.getPcode());
			pstmt.setString(2, p.getPname());
			pstmt.setString(3, p.getPimg());
			pstmt.setString(4, p.getPetc());
			pstmt.setString(5, p.getPdate());
			pstmt.executeUpdate();
				
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			if(conn != null) try{ conn.close(); }catch(Exception ex){}
			if(pstmt != null) try{ conn.close(); }catch(Exception ex){}
		}
	
	}
	
	// delete - product_delete.jsp
	public void productDelete(ProductVo p) {
		try {
			sql = "delete from product where pcode = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p.getPcode());
			pstmt.executeUpdate();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(pstmt != null) try { pstmt.close(); }catch(Exception ex) {}
			if(conn != null) try { conn.close(); }catch(Exception ex) {}
		}
	}
	
	// select - product_list_jstl.jsp
	public List<ProductVo> productSelectAll(){
		List<ProductVo> list = null;
		ProductVo p = null;
		
		try {
			sql = "select * from product";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			list = new ArrayList<ProductVo>();
			while(rs.next()) {
				p = new ProductVo();
				
				p.setPcode(rs.getString("pcode"));
				p.setPname(rs.getString("pname"));
				p.setPimg(rs.getString("pimg"));
				p.setPetc(rs.getString("petc"));
				p.setPdate(rs.getString("pdate").substring(0, 10));
				
				list.add(p);
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
}
