<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.sql.*" %>
<%@ include file="top.jsp" %>
<%
	String tab = (String)session.getAttribute("tab");
	String custno = request.getParameter("custno");
	String custname = request.getParameter("custname");
	String kor = request.getParameter("kor");
	String eng = request.getParameter("eng");
	
	String jdbc = "jdbc:oracle:thin:@//localhost:1521/xe";
	String dbid = "system";
	String dbpwd = "1234";
	String sql = "";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(jdbc, dbid, dbpwd);
		
		if(tab.equals("1")){
			sql = "update tbl_ch13_grade01 set ";
			sql += "custname = ?, kor = ?, eng = ? ";
			sql += "where custno = ?";
		}
		else if(tab.equals("2")){
			sql = "update tbl_ch13_grade02 set ";
			sql += "custname = ?, kor = ?, eng = ? ";
			sql += "where custno = ?";
		}
		else if(tab.equals("3")){
			sql = "update tbl_ch13_grade03 set ";
			sql += "custname = ?, kor = ?, eng = ? ";
			sql += "where custno = ? ";
		}
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, custname);
		pstmt.setString(2, kor);
		pstmt.setString(3, eng);
		pstmt.setString(4, custno);
		pstmt.executeUpdate();
		
		response.sendRedirect("grade_list.jsp");
		
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		if(pstmt != null) try{pstmt.close();}catch(Exception ex){}
		if(conn != null) try{ conn.close(); }catch(Exception ex){}
	}
%>
<section>
	
</section>
<%@ include file="bottom.jsp" %>