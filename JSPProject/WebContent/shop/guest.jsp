<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ex.CD" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="dbconn.jsp" %>



<%	

	Date date = new Date();
	SimpleDateFormat format = new SimpleDateFormat("YYYYMMdd");
	
	
	sql = "insert into guest " +
		"(custno, custname, phone, address, joindate) " +
		"values (s_guest.nextval,?,?,?,?)";

	try{
	pstmt = conn.prepareStatement(sql);

	
	for(int i= 0; i<241; i++){		
		pstmt.setString(1, CD.getName());
		pstmt.setString(2, CD.getPhone());
		pstmt.setString(3, CD.getAddress());
		pstmt.setString(4, format.format(date));
		
		pstmt.executeUpdate();		
	}
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		if(conn != null) try{ conn.close(); }catch(Exception ex){}
		if(pstmt != null) try{ pstmt.close(); }catch(Exception ex){}		
	}
	

%>
