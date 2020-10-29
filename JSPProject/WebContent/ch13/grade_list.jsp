<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="top.jsp" %>
<%
	String tab = request.getParameter("tab");
	if(tab != null){
		session.setAttribute("tab", tab);
	}

	String table = (String)session.getAttribute("tab");
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
		
		sql = "select * from tbl_ch13_grade0" + table;
		sql += " order by custno";
			
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
%>
<section>
	<div id="title">
		<h3><%=table %>학년 게시판</h3>	
	</div>
	<div id="sub">
		[<a href="form.jsp?tab=<%=tab%>">성적입력</a>]		
	</div>
	<table border="1" align="center" width="400">
		<tr align="center">
			<td>번호</td>
			<td>이름</td>
			<td>국어</td>
			<td>영어</td>
		</tr>
	<%	while(rs.next()){ %>
		<tr align="center">
			<td><a href='edit.jsp?custno=<%=rs.getString("custno")%>'>
			<%=rs.getString("custno") %></a></td>
			<td><a href='delete.jsp?custno=<%=rs.getString("custno")%>'>
			<%=rs.getString("custname") %></a></td>
			<td><%=rs.getString("kor") %></td>
			<td><%=rs.getString("eng") %></td>
		</tr>
	<%	} %>
	</table>
</section>
<%
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		if(rs != null) try{ rs.close(); }catch(Exception ex){}
		if(pstmt != null) try{ pstmt.close(); }catch(Exception ex){}
		if(conn != null) try{ conn.close(); }catch(Exception ex){}
	}
%>
<%@ include file="bottom.jsp" %>