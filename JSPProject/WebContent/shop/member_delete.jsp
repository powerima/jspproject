<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>

<%
	String custno = request.getParameter("custno");

	sql = "delete from member_tbl_02 " +
			" where custno = ?";
	
	try{
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, custno);
		pstmt.executeUpdate();
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		if(conn != null) try{ conn.close(); }catch(Exception ex){}
		if(pstmt != null) try{ pstmt.close(); } catch(Exception ex){}
	}
	
	response.sendRedirect("member_list.jsp");
	
			
%>