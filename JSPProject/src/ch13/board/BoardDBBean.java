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
				"jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
				
		return conn;		
	}
	
	// board 테이블에 글을 추가(insert 문) <- writePro.jsp 에서 사용
	public void insertArticle(BoardDataBean article) 
						throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int num = article.getNum();
		int ref = article.getRef();
		int re_step = article.getRe_step();
		int re_level = article.getRe_level();
		int number = 0;
		String sql = "";
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select max(num) from board");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				number = rs.getInt(1)+1;
			} else {
				number = 1;
			}
			
			if(num != 0) {
				sql = "update board set re_step=re_step+1 ";
				sql += "where ref=? and re_step > ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, re_step);
				pstmt.executeUpdate();
				
				re_step = re_step + 1;
				re_level = re_level + 1;
				
			} else {
				ref = number;
				re_step = 0;
				re_level = 0;
			}
			
			
			// 쿼리를 작성
			sql = "insert into board(writer, email, subject,";
			sql += "passwd, reg_date, ref, re_step, re_level,";
			sql += "content, ip) values(?,?,?,?,?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getWriter());
			pstmt.setString(2, article.getEmail());
			pstmt.setString(3, article.getSubject());
			pstmt.setString(4, article.getPasswd());
			pstmt.setTimestamp(5, article.getReg_date());
			pstmt.setInt(6, ref);
			pstmt.setInt(7, re_step);
			pstmt.setInt(8, re_level);
			pstmt.setString(9, article.getContent());
			pstmt.setString(10, article.getIp());
			
			pstmt.executeUpdate();
		}catch(Exception ex) {
			
		}finally {
			if(rs != null) try {rs.close();}catch(SQLException ex) {}
			if(pstmt != null) try {pstmt.close();}catch(SQLException ex) {}
			if(conn != null) try {conn.close();}catch(SQLException ex) {}
		}
	}
	
	// board 테이블에 저장된 전체 글의 수를 얻어냄(select 문) <- list.jsp 에서 사용
	public int getArticleCount() throws Exception {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int x = 0;
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement(
					"select count(*) from board");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				x = rs.getInt(1);						
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(rs != null) try {rs.close();}catch(SQLException ex) {}
			if(pstmt != null) try {pstmt.close();}catch(SQLException ex) {}
			if(conn != null) try {conn.close();}catch(SQLException ex) {}
		}
		return x;
	}
	
	// 글의 목록(복수 개의 글)을 가져욤(select 문) <- list.jsp 에서 사용
	public List<BoardDataBean> getArticles(int start, int end)
				throws Exception{
		List<BoardDataBean> articleList = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			conn = getConnection();
			
			String sql = "select rownum , P.* "
					+ "from ( select rownum as rnum, K.* "
					+ "from (select * "
					+ "from guest order by custname desc ) K "
					+ "where rownum <=? ) where rnum >= ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, end);
			pstmt.setInt(2, start-1);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				articleList = new ArrayList<BoardDataBean>(end);
				do {
					BoardDataBean article = new BoardDataBean();
					article.setNum(rs.getInt("num"));
					article.setWriter(rs.getString("writer"));
					article.setEmail(rs.getString("email"));
					article.setSubject(rs.getString("subject"));
					article.setPasswd(rs.getString("passwd"));
					article.setReg_date(rs.getTimestamp("reg_date"));
					article.setReadcount(rs.getInt("readcount"));
					article.setRef(rs.getInt("ref"));
					article.setRe_step(rs.getInt("re_step"));
					article.setRe_level(rs.getInt("re_level"));
					article.setContent(rs.getString("content"));
					article.setIp(rs.getString("ip"));
					
					articleList.add(article);
					
				}while(rs.next());
			}
					
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(rs != null) try {rs.close();}catch(SQLException ex) {}
			if(pstmt != null) try {pstmt.close();}catch(SQLException ex) {}
			if(conn != null) try {conn.close();}catch(SQLException ex) {}
		}
		
		return articleList;
	}
	
	// 글의 내영을 보기(1개의 글)(select 문) <- content.jsp 에서 사용
	public BoardDataBean getArticle(int num)
				throws Exception{
		BoardDataBean article = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			String sql = "update board set "
					+ "readcount = readcount+1 where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement(
					"select * from board where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setEmail(rs.getString("email"));
				article.setSubject(rs.getString("subject"));
				article.setPasswd(rs.getString("passwd"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
				article.setRef(rs.getInt("ref"));
				article.setRe_step(rs.getInt("re_step"));
				article.setRe_level(rs.getInt("re_level"));
				article.setContent(rs.getString("content"));
				article.setIp(rs.getString("ip"));
			}
					
					
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(rs != null) try {rs.close();}catch(SQLException ex) {}
			if(pstmt != null) try {pstmt.close();}catch(SQLException ex) {}
			if(conn != null) try {conn.close();}catch(SQLException ex) {}
		}
		return article;
	}
	
	// 글 수정 폼에서 사용할 글의 내용(1개의 글)(select 문) <- updateForm.jsp 에서 사용
	public BoardDataBean updateGetArticle(int num)
				throws Exception{
		BoardDataBean article = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement(
					"select * from board where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setEmail(rs.getString("email"));
				article.setSubject(rs.getString("subject"));
				article.setPasswd(rs.getString("passwd"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
				article.setRef(rs.getInt("ref"));
				article.setRe_step(rs.getInt("re_step"));
				article.setRe_level(rs.getInt("re_level"));
				article.setContent(rs.getString("content"));
				article.setIp(rs.getString("ip"));
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(rs != null) try {rs.close();}catch(SQLException ex) {}
			if(pstmt != null) try {pstmt.close();}catch(SQLException ex) {}
			if(conn != null) try {conn.close();}catch(SQLException ex) {}
		}
		return article;
	}
	
	// 글 수정 처리에서 사용(update 문) <- updatePro.jsp 에서 사용
	public int updateArticle(BoardDataBean article)
				throws Exception{
		

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String dbpasswd = "";
		String sql = "";
		int x = -1;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select passwd from board where num = ?");
			pstmt.setInt(1, article.getNum());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dbpasswd = rs.getString("passwd");
				if(dbpasswd.equals(article.getPasswd())) {
					sql = "update board set writer=?, email=?,";
					sql += "subject=?, passwd=?, content=? ";
					sql += "where num=?";
					
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setString(1, article.getWriter());
					pstmt.setString(2, article.getEmail());
					pstmt.setString(3, article.getSubject());
					pstmt.setString(4, article.getPasswd());
					pstmt.setString(5, article.getContent());
					pstmt.setInt(6, article.getNum());
					pstmt.executeUpdate();
					x = 1;
				} else {
					x = 0;
				}
			}
		
		}finally {
			if(rs != null) try {rs.close();}catch(SQLException ex) {}
			if(pstmt != null) try {pstmt.close();}catch(SQLException ex) {}
			if(conn != null) try {conn.close();}catch(SQLException ex) {}
		}
		return x;
	}
	
	// 글삭제 처리시 사용(delete 문) <- deletePro.jsp 에서 사용
	public int deleteArticle(int num, String passwd) 
				throws Exception{
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		int x = -1;
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement(
					"select passwd from board where num=?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dbpasswd = rs.getString("passwd");
				if(dbpasswd.equals(passwd)) {
					pstmt = conn.prepareStatement(
							"delete from board where num=?");
					pstmt.setInt(1, num);
					pstmt.executeUpdate();
					x = 1;	// 글삭제 성공
				} else {
					x = 0;	// 비밀번호 틀림
				}						
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(rs != null) try {rs.close();}catch(SQLException ex) {}
			if(pstmt != null) try {pstmt.close();}catch(SQLException ex) {}
			if(conn != null) try {conn.close();}catch(SQLException ex) {}
		}
		return x;
	}
}
