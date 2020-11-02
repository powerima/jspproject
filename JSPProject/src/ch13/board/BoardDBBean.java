package ch13.board;

import java.sql.*;
import java.util.*;

public class BoardDBBean {
	private static BoardDBBean instance 
					= new BoardDBBean();
	// .jsp 페이지에서 DB 연동빈인 BoardDBBean 클래스의 메소드 접근시 필요
	public static BoardDBBean getInstance() {
		return instance;
	}
	
	private BoardDBBean() {}
	
	// 커넥션 풀로부터 Connection 객체를 얻어냄
	private Connection getConnection() throws Exception {
		Connection conn;
		
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(
				"oracle:jdbc:thin:@//localhost:1521/xe", "system", "1234");
				
		return conn;		
	}
	
	// board 테이블에 글을 추가(insert 문) <- writePro.jsp 에서 사용
	public void insertArticle(BoardDataBean article) 
						throws Exception{
		
	}
	
	// board 테이블에 저장된 전체 글의 수를 얻어냄(select 문) <- list.jsp 에서 사용
	public int getArticleCount() throws Exception {
		int x = 0;
		
		return x;
	}
	
	// 글의 목록(복수 개의 글)을 가져욤(select 문) <- list.jsp 에서 사용
	public List<BoardDataBean> getArticles(int start, int end)
				throws Exception{
		List<BoardDataBean> articleList = null;
		
		return articleList;
	}
	
	// 글의 내영을 보기(1개의 글)(select 문) <- content.jsp 에서 사용
	public BoardDataBean getArticle(int num)
				throws Exception{
		BoardDataBean article = null;
		return article;
	}
	
	// 글 수정 폼에서 사용할 글의 내용(1개의 글)(select 문) <- updateForm.jsp 에서 사용
	public BoardDataBean updateGetArticle(int num)
				throws Exception{
		BoardDataBean article = null;
		return article;
	}
	
	// 글 수정 처리에서 사용(update 문) <- updatePro.jsp 에서 사용
	public int updateArticle(BoardDataBean article)
				throws Exception{
		
		int x = -1;
		
		return x;
	}
	
	// 글삭제 처리시 사용(delete 문) <- deletePro.jsp 에서 사용
	public int deleteArticle(int num, String passwd) 
				throws Exception{
		int x = -1;
		
		return x;
	}
}
