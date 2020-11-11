package ch14.bookshop.shopping;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.List;

public class BuyDBBean {
	private static BuyDBBean instance =
			new BuyDBBean();
	public static BuyDBBean getInstance() {
		return instance;
	}
	
	private BuyDBBean() {}
	
	private Connection getConnection() throws Exception{
		Connection conn = null;
		
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(
				"jdbc:oracle:thin:@//localhost:1521/xe",
				"system","1234");
		
		return conn;
	}
	
	// bank 테이블에 있는 전체 레코드를 얻어내는 메소드
	public List<String> getAccount(){
		return null;
	}
	
	// 구매 테이블인 buy에 구매목록 등록
	public void insertBuy(List<CartDataBean> lists,
			String id, String account, String deleveryName,
			String deliveryTel, String deliveryAddress)
			throws Exception {
		
	}
	
	
	// id에 해당하는 buy 테이블의 레코드 수를 얻어내는 메소드
	public int getListCount(String id) 
			throws Exception{
		int x = 0;
		
		return x;
	}
	
	// buy 테이블의 전체 레코드 수를 얻어내는 메소드
	public int getListCount()
			throws Exception {
		int x = 0;
		return x;
	}
	
	// id에 해당하는 buy 테이블의 구매목록을 얻어내는 메소드
	public List<BuyDataBean> getBuyList(String id)
			throws Exception {
		
		return null;
	}
	
	// buy 테이블의 전체 목록을 얻어내는 메소드
	public List<BuyDataBean> getBuyList()
			throws Exception {
		return null;
	}
}
