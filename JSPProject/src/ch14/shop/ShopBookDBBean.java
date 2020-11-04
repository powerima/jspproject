package ch14.shop;

import java.sql.*;
import java.util.List;

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
		
		Class.forName("oracle:jdbc:OracleDriver");
		conn = DriverManager.getConnection(
				"jdbc:oracle:thin:@//localhost:1521/xe",
				"system","1234");
		
		return conn;
	}
	
	
	// 관리자 인증 메소드
	public int managerCheck(String id, String passwd)
			throws Exception{
		int x = -1;
		
		return x;
	}
	
	// 책 등록 메소드
	public void insertBook(ShopBookDataBean book)
			throws Exception {
		
	}
	
	// 전체등록된 책의 수를 얻어내는 메소드
	public int getBookCount() throws Exception {
		int x = 0;
		return x;
	}
	
	// 분류별 또는 전체 등록된 책의 정보를 얻어내는 메소드
	public List<ShopBookDataBean> getBooks(String book_kind)
			throws Exception {
		return null;
	}
	
	// 쇼핑몰 메인에 표시하기 위해서 사용하는 분류별 신간책 목록을 어더내는 메소드
	public ShopBookDataBean[] getBooks(String book_kind, int count)
			throws Exception {
		
		return null;
	}
	
	// bookid 에 해당하는 책의 정보를 얻어내는 메소드로
	// 등록된 책을 수정하기 위해 수정폼으로 읽어들이기 위한 메소드
	public ShopBookDataBean getBook(int bookId) 
			throws Exception {
		return null;
	}
	
	// 등록된 책의 정보를 수정시 사용하는 메소드 
	public void updateBook(ShopBookDataBean book, int bookId) 
			throws Exception {
		
	}
	
	// bookId에 해당하는 책의 정보를 삭제시 사용하는 메소드
	public void deleteBook(int bookId) 
			throws Exception {
			
	}
	
	
}
