<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="top.jsp" %>
<%
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
	
		sql = "select * from vote_tbl_ch13";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
	
%>
<section>
	<div id="title">
		<h3>투표 결과보기</h3>
	</div>
	<table border="1" width="300" align="center">
		<tr align="center">
			<td>기업</td>
			<td>투표수</td>
		</tr>
	<%	while(rs.next()){ %>
		<tr align="center">
			<td><%=rs.getString("company") %></td>
			<td><%=rs.getString("vote_cnt") %></td>
		</tr>		
	<%	} %>
	</table>
</section>
<%
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		if(rs != null)try{ rs.close(); }catch(Exception ex){}
		if(pstmt != null)try{ pstmt.close(); }catch(Exception ex){}
		if(conn != null)try{ conn.close(); }catch(Exception ex){}
	}
%>
<%@ include file="bottom.jsp" %>