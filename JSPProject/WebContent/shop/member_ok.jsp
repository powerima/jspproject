<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>

<%
	String custno = request.getParameter("custno");
	String custname = request.getParameter("custname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String joindate = request.getParameter("joindate");
	String grade = request.getParameter("grade");
	String city = request.getParameter("city");
	
	sql = "update member_tbl_02 set " +
		"custname = ?, phone = ?, address = ?, joindate = ?," +
		"grade = ?, city = ? where custno = ?";
	
	
	out.println(custno);
	out.println(custname);
	out.println(phone);
	out.println(address);
	out.println(joindate);
	out.println(grade);
	out.println(city);	
	
	try{
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, custname);
		pstmt.setString(2, phone);
		pstmt.setString(3, address);
		pstmt.setString(4, joindate);
		pstmt.setString(5, grade);
		pstmt.setString(6, city);
		pstmt.setString(7, custno);
		
		pstmt.executeUpdate();
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		if(conn != null) try{ conn.close(); }catch(Exception ex){}
		if(pstmt != null) try{ pstmt.close(); }catch(Exception ex){}	
	}
	
	response.sendRedirect("member_list.jsp");
%>