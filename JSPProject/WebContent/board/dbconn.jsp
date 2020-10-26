<%@ page import="java.sql.*"%>
<%
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String jdbc = "jdbc:oracle:thin:@//localhost:1521/xe";
	String id = "system";
	String passwd = "1234";

	Class.forName("oracle.jdbc.OracleDriver");
	con = DriverManager.getConnection(jdbc, id, passwd);
	
%>