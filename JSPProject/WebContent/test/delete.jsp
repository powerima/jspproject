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
	
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(jdbc, id, pwd);
		
		sql = "delete from t1026 where custno = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, custno);
		pstmt.executeUpdate();
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		if(pstmt != null) try{ pstmt.close(); }catch(Exception ex){}
		if(conn != null) try{ conn.close(); }catch(Exception ex){}
	}
	
	response.sendRedirect("list.jsp");
%>
