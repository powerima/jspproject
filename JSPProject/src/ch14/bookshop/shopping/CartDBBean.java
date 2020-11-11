package ch14.bookshop.shopping;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.List;

public class CartDBBean {
	private static CartDBBean instance =
			new CartDBBean();
	
	public static CartDBBean getInstance() {
		return instance;
	}
	
	private CartDBBean() {}
	
	private Connection getConnection() throws Exception{
		Connection conn = null;
		
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(
				"jdbc:oracle:thin:@//localhost:1521/xe",
				"system","1234");
		
		return conn;
	}
	
	// [장바구니에 담기]를 클릭하면 
	// 수행되는 것으로 cart 테이블에 새로운 레코드 추가
	public void insertCart(CartDataBean cart) 
			throws Exception {
				
	}
	
	// id 에 해당하는 레코드의 수를 얻어내는 메소드
	public int getListCount(String id)
			throws Exception {
		int x = 0;
		return x;
	}
	
	// id에 해당하는 레코드의 목록을 얻어내는 메소드
	public List<CartDataBean> getCart(String id)
			throws Exception {
		
		return null;
	}
	
	// 장바구니에서 수량을 수정시 실행되는 메소드
	public void updateCount(int cart_id, byte count)
			throws Exception {
		
	}
	
	// 장바구니에서 cart_id에 대한 레코드를 삭제하는 메소드
	public void deleteList(int cart_id)
			throws Exception {
		
	}
	
	// id에 해당하는 모든 레코드를 삭제하는 메소드로
	// [장바구니 비우기] 단추를 클릭시 실행된다.
	public void deleteAll(String id)
			throws Exception {
		
	}
}
