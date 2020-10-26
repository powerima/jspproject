<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("utf-8"); %>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	Timestamp register = new Timestamp(System.currentTimeMillis());
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String str= "";
	try{
		String jdbc = "jdbc:oracle:thin:@//localhost:1521/xe";
		String dbid = "system";
		String dbpwd = "1234";
		
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(jdbc, dbid, dbpwd);
		
		String sql = "insert into member_tbl_01(id, passwd, name, reg_date)";
			sql += " values(?, ?, ?, ?)";
			
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, passwd);
		pstmt.setString(3, name);
		pstmt.setTimestamp(4, register);
		pstmt.executeUpdate();
		
		str = "member_tbl_01 테이블에 새로운 레코드를 추가했습니다.";
	
	}catch(Exception ex){
		str = "member_tbl_01 테이블에 새로운 레코드 추가를 실패했습니다.";
		ex.printStackTrace();
	}finally{		
		if(pstmt != null) try{ pstmt.close(); } catch(Exception ex){}
		if(conn != null) try{ conn.close(); }catch(Exception ex){}		
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레코드 추가</title>
</head>
<body>
	<%=str %>
</body>
</html>
