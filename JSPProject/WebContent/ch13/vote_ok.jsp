<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	page import="java.sql.*" %>
<%@ include file="top.jsp" %>
<%
	String pool = request.getParameter("pool");
	
	String jdbc = "jdbc:oracle:thin:@//localhost:1521/xe";
	String dbid = "system";
	String dbpwd = "1234";
	String sql = "";
	
	Connection conn = null;
	PreparedStatement pstmt = null;	
	ResultSet rs = null;
	
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(jdbc, dbid, dbpwd);
		
		sql = "update vote_tbl_ch13 set ";
		sql += "vote_cnt = vote_cnt+1 where ccode = ?";
		pstmt = conn.prepareStatement(sql);		
		pstmt.setString(1, pool);
				
		pstmt.executeUpdate();
		
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		if(pstmt != null) try{pstmt.close();}catch(Exception ex){}
		if(conn != null) try{ conn.close();}catch(Exception ex){}
	}
	
%>
<section>

	<script>
		alert('투표하였습니다.');
		location.href="vote_result.jsp";
	</script>
</section>
<%@ include file="bottom.jsp" %>
</html>