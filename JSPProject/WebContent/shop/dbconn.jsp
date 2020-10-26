<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	String jdbc = "jdbc:oracle:thin:@//localhost:1521/xe";
	String id = "system";
	String pwd = "1234";
	String sql = "";
	
	Connection conn = null;
	ResultSet rs = null;
	PreparedStatement pstmt = null;


	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection(jdbc, id, pwd);
%>
