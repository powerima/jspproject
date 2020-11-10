package ch14.bookshop.master;

import java.sql.*;
import java.util.*;


public class ShopBookDBBean {

	private static ShopBookDBBean instance =
			new ShopBookDBBean();
	
	public static ShopBookDBBean getInstance() {
		return instance;
	}
	
	private ShopBookDBBean() {}
	
	// 커넥션 풀로부터 커넥션 객체를 얻어내는 메소드
	private Connection getConnection() throws Exception{
		Connection conn = null;
		
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(
				"jdbc:oracle:thin:@//localhost:1521/xe",
				"system","1234");
		
		return conn;
	}
	
	
	// 관리자 인증 메소드
	public int managerCheck(String id, String passwd){
		
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbPasswd = "";
		int x = -1;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select managerPasswd from " +
					"manager_tbl_ch14 where managerId = ?");
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dbPasswd = rs.getString("managerPasswd");
				if(dbPasswd.equals(passwd)) {
					x = 1;	// 인증 성공
				} else {
					x = 0;	// 비밀번호 틀림 
				}
			} else {
				x = -1;		// 해당 아이디 없음 
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally{
			if(rs != null) try { rs.close(); } catch (Exception ex) {}
			if(pstmt != null) try { pstmt.close(); } catch(Exception ex) {}
			if(conn != null) try { conn.close(); } catch(Exception ex) {}
		}

		return x;
	}
	
	// 책 등록 메소드
	public void insertBook(ShopBookDataBean book) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"insert into book_tbl_ch14 " +
					"values(sbook_id_book_tbl_ch14.nextval,?,?,?,?,?,?,?,?,?,?,?)");
			
			pstmt.setString(1, book.getBook_kind());
			pstmt.setString(2, book.getBook_title());
			pstmt.setInt(3, book.getBook_price());
			pstmt.setInt(4, book.getBook_count());
			pstmt.setString(5, book.getAuthor());
			pstmt.setString(6, book.getPublishing_com());
			pstmt.setString(7, book.getPublishing_date());
			pstmt.setString(8, book.getBook_image());
			pstmt.setString(9, book.getBook_content());
			pstmt.setInt(10, book.getDiscount_rate());
			pstmt.setTimestamp(11, book.getReg_date());
			
			pstmt.executeUpdate();			
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally{
			if(pstmt != null) try { pstmt.close(); } catch(Exception ex) {}
			if(conn != null) try { conn.close(); } catch(Exception ex) {}
		}

	}
	
	// 전체등록된 책의 수를 얻어내는 메소드
	public int getBookCount() {
		int x = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement(
					"select count(*) from book_tbl_ch14");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				x = rs.getInt(1);
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally{
			if(rs != null) try { rs.close(); } catch (Exception ex) {}
			if(pstmt != null) try { pstmt.close(); } catch(Exception ex) {}
			if(conn != null) try { conn.close(); } catch(Exception ex) {}
		}

		return x;
	}
	
	// 분류별 또는 전체 등록된 책의 정보를 얻어내는 메소드
	public List<ShopBookDataBean> getBooks(String book_kind){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<ShopBookDataBean> bookList = null;
		
		try {
			conn = getConnection();
			
			String sql1 = "select * from book_tbl_ch14";
			String sql2 = "select * from book_tbl_ch14 ";
			sql2 += "where book_kind = ? order by reg_date desc";
			
			if(book_kind.equals("all")) {
				pstmt = conn.prepareStatement(sql1);
			} else {
				pstmt = conn.prepareStatement(sql2);
				pstmt.setString(1, book_kind);
			}
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bookList = new ArrayList<ShopBookDataBean>();
				do {
					ShopBookDataBean book = new ShopBookDataBean();
					
					book.setBook_id(rs.getInt("book_id"));
					book.setBook_kind(rs.getString("book_kind"));
					book.setBook_title(rs.getString("book_title"));
					book.setBook_price(rs.getInt("book_price"));
					book.setBook_count(rs.getShort("book_count"));
					book.setAuthor(rs.getString("author"));
					book.setPublishing_com(rs.getString("publishing_com"));
					book.setPublishing_date(rs.getString("publishing_date"));
					book.setBook_image(rs.getString("book_image"));
					book.setDiscount_rate(rs.getByte("discount_rate"));
					book.setReg_date(rs.getTimestamp("reg_date"));
					
					bookList.add(book);
				}while(rs.next());
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally{
			if(rs != null) try { rs.close(); } catch (Exception ex) {}
			if(pstmt != null) try { pstmt.close(); } catch(Exception ex) {}
			if(conn != null) try { conn.close(); } catch(Exception ex) {}
		}

		return bookList;
	}
	
	// 쇼핑몰 메인에 표시하기 위해서 사용하는 분류별 신간책 목록을 얻어내는 메소드
	public ShopBookDataBean[] getBooks(String book_kind, int count) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ShopBookDataBean bookList[] = null;
		int i = 0;
		try {
			conn = getConnection();
			
			String sql = "select rownum, p.* from  " 
					+ " (select rownum as rnum, k.* from "
					+ "    (select * from book_tbl_ch14 ) k "
					+ "    where rownum <= ?	)p  where rnum >= ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, book_kind);
			pstmt.setInt(2, 1);
			pstmt.setInt(3, count);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bookList = new ShopBookDataBean[count];
				do {
					ShopBookDataBean book = new ShopBookDataBean();
					book.setBook_id(rs.getInt("book_id"));
					book.setBook_kind(rs.getString("book_kind"));
					book.setBook_title(rs.getString("book_title"));
					book.setBook_price(rs.getInt("book_price"));
					book.setBook_count(rs.getShort("book_count"));
					book.setAuthor(rs.getString("author"));
					book.setPublishing_com(rs.getString("publishing_com"));
					book.setPublishing_date(rs.getString("publishing_date"));
					book.setBook_image(rs.getString("book_image"));
					book.setDiscount_rate(rs.getByte("discount_rate"));
					book.setReg_date(rs.getTimestamp("reg_date"));
					
					bookList[i] = book;
					i++;
				}while(rs.next());
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally{
			if(rs != null) try { rs.close(); } catch (Exception ex) {}
			if(pstmt != null) try { pstmt.close(); } catch(Exception ex) {}
			if(conn != null) try { conn.close(); } catch(Exception ex) {}
		}

		
		return bookList;
	}
	
	// bookid 에 해당하는 책의 정보를 얻어내는 메소드로
	// 등록된 책을 수정하기 위해 수정폼으로 읽어들이기 위한 메소드
	public ShopBookDataBean getBook(int bookId) { 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ShopBookDataBean book = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select * from book_tbl_ch14 where book_id = ?");
			pstmt.setInt(1, bookId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				book = new ShopBookDataBean();
				book.setBook_kind(rs.getString("book_kind"));
				book.setBook_title(rs.getString("book_title"));
				book.setBook_price(rs.getInt("book_price"));
				book.setBook_count(rs.getShort("book_count"));
				book.setAuthor(rs.getString("author"));
				book.setPublishing_com(rs.getString("publishing_com"));
				book.setPublishing_date(rs.getString("publishing_date"));
				book.setBook_image(rs.getString("book_image"));
				book.setBook_content(rs.getString("book_content"));
				book.setDiscount_rate(rs.getByte("discount_rate"));
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally{
			if(rs != null) try { rs.close(); } catch (Exception ex) {}
			if(pstmt != null) try { pstmt.close(); } catch(Exception ex) {}
			if(conn != null) try { conn.close(); } catch(Exception ex) {}
		}

		return book;
	}
	
	// 등록된 책의 정보를 수정시 사용하는 메소드 
	public void updateBook(ShopBookDataBean book, int bookId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			conn = getConnection();
			
			sql = "update book_tbl_ch14 set book_kind = ?, book_title = ?, ";
			sql += "book_price = ?, book_count = ?, author = ?, ";
			sql += " publishing_com = ?, publishing_date = ?, book_image = ?, ";
			sql += "book_content = ?, discount_rate = ? where book_id = ?";
	
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, book.getBook_kind());
			pstmt.setString(2, book.getBook_title());
			pstmt.setInt(3, book.getBook_price());
			pstmt.setInt(4, book.getBook_count());
			pstmt.setString(5, book.getAuthor());
			pstmt.setString(6, book.getPublishing_com());
			pstmt.setString(7, book.getPublishing_date());
			pstmt.setString(8, book.getBook_image());
			pstmt.setString(9, book.getBook_content());
			pstmt.setInt(10, book.getDiscount_rate());
			pstmt.setInt(11, bookId);

			pstmt.executeUpdate();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally{
			if(rs != null) try { rs.close(); } catch(Exception ex) {}
			if(pstmt != null) try { pstmt.close(); } catch(Exception ex) {}
			if(conn != null) try { conn.close(); } catch(Exception ex) {}
		}


		
	}
	
	// bookId에 해당하는 책의 정보를 삭제시 사용하는 메소드
	public void deleteBook(int bookId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"delet from book_tbl_ch14 where book_id = ?");
			pstmt.setInt(1, bookId);
			pstmt.executeUpdate();			
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally{
			if(rs != null) try { rs.close(); } catch (Exception ex) {}
			if(pstmt != null) try { pstmt.close(); } catch(Exception ex) {}
			if(conn != null) try { conn.close(); } catch(Exception ex) {}
		}
	}
}
