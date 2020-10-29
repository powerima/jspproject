<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="top.jsp" %>
<%
	String tab = (String)session.getAttribute("tab");
	String custno = request.getParameter("custno");

	String jdbc = "jdbc:oracle:thin:@//localhost:1521/xe";
	String dbid = "system";
	String dbpwd = "1234";
	String sql = "";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
			
	
	
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(jdbc, dbid, dbpwd);
		
		sql = "delete from tbl_ch13_grade0" + tab;
		sql += " where custno = ?";

		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, custno);
		pstmt.executeUpdate();
		
		response.sendRedirect("grade_list.jsp");
				
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		if(pstmt != null)try{pstmt.close(); } catch(Exception ex){}
		if(conn != null)try{conn.close(); } catch(Exception ex){}
	}
	
%>
<section>

</section>
<%@ include file="bottom.jsp" %>