<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="ex.CD" %>

<%
	request.setCharacterEncoding("UTF-8");
%>

<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String jdbc = "jdbc:oracle:thin:@//localhost:1521/xe";
	String id = "system";
	String pwd = "1234";
	String sql = "";
	
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(jdbc, id, pwd);
		
		sql = "insert into tbl_test02(custno, custname, address, phone, joindate) ";
		sql += "values(stbl_test02.nextval, ?,?,?,?)";
		
		for(int i=0; i<250; i++){		
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, CD.getName());
	pstmt.setString(2, CD.getAddress());
	pstmt.setString(3, CD.getPhone());
	pstmt.setString(4, CD.getDate());
	pstmt.executeUpdate();
		}
	
	
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		if(pstmt != null )try{ pstmt.close(); }catch(Exception ex){}
		if(conn != null) try{ conn.close(); }catch(Exception ex){}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>