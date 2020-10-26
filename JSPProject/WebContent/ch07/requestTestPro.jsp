<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="requestTestTop.jsp" %>

<% request.setCharacterEncoding("utf-8"); %>
    
<%	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String num = request.getParameter("num");
	String name = request.getParameter("name");
	String grade = request.getParameter("grade");
	String subject = request.getParameter("subject");
	
	String jdbc = "jdbc:oracle:thin:@//localhost:1521/xe";
	String id = "system";
	String pwd = "1234";
	String sql = "";
	
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(jdbc, id, pwd);
		
		sql = "insert into student_tbl_ch07(num, name, grade, subject) ";
		sql += "values(?,?,?,?)";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, num);
		pstmt.setString(2, name);
		pstmt.setString(3, grade);
		pstmt.setString(4, subject);		
		pstmt.executeQuery();
		
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		if(conn != null) try{ conn.close(); }catch(Exception ex){}
		if(pstmt != null) try{ pstmt.close(); }catch(Exception es){}
	}
	
%>
<section>
	<h2>학생정보</h2>
	<table border="1" width="300">
		<tr>
			<td>학번</td>
			<td><%=num %></td>			
		</tr>
		<tr>
			<td>이름</td>
			<td><%=name %></td>			
		</tr>
		<tr>
			<td>학년</td>
			<td><%=grade %></td>
		</tr>
		<tr>
			<td>과목</td>
			<td><%=subject %></td>
		</tr>
	</table>
</section>

<%@ include file="requestTestBottom.jsp" %>