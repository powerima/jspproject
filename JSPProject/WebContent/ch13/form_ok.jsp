<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.sql.*" %>
<%@ include file="top.jsp" %>

<%
	String tab = (String)session.getAttribute("tab");
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
			sql = "insert into tbl_ch13_grade01";
			sql += "(custno, custname, kor, eng) ";
			sql += "values(seq_tbl_ch13_grade01.nextval,?,?,?)";
		}
		else if(tab.equals("2")){
			sql = "insert into tbl_ch13_grade02";
			sql += "(custno, custname, kor, eng) ";
			sql += "values(seq_tbl_ch13_grade02.nextval,?,?,?)";
		}
		else if(tab.equals("3")){
			sql = "insert into tbl_ch13_grade03";
			sql += "(custno, custname, kor, eng) ";
			sql += "values(seq_tbl_ch13_grade03.nextval,?,?,?)";
		}
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, custname);
		pstmt.setString(2, kor);
		pstmt.setString(3, eng);
		pstmt.executeUpdate();
			
		out.println(custname);
		response.sendRedirect("grade_list.jsp");
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		if(pstmt != null) try{ pstmt.close(); }catch(Exception ex){}
		if(conn != null) try{ conn.close(); }catch(Exception ex){}
	}
%>
<section>
</section>
<%@ include file="bottom.jsp" %>