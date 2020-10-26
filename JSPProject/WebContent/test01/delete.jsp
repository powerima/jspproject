<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String custno = request.getParameter("custno");
	String jdbc = "jdbc:oracle:thin:@//localhost:1521/xe";
	String id = "system";
	String pwd = "1234";
	String sql = "";
	
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection(jdbc, id, pwd);
	
	sql = "delete from tbl_test01 where custno = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, custno);
	pstmt.executeUpdate();
	
	response.sendRedirect("list.jsp");
	
%>