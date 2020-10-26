<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ include file="dbconn.jsp" %>

<%
	String pcode = request.getParameter("pcode");
	String saveFolder = "shop/file/";
	
	ServletContext context = getServletContext();
	String realFolder = context.getRealPath(saveFolder);
	


	
	
	try{
		// 파일 삭제
		sql = "select pimg from product where pcode = ?";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, pcode);
		rs = pstmt.executeQuery();		
		rs.next();
	
		String pimg = rs.getString("pimg");		
		
		if(pimg != null){	
			File f = new File(realFolder + pimg);
			f.delete();		
		}
		
		
		// 데이터 베이스에서 상품 정보 삭제
		sql = "delete from product where pcode = ?";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, pcode);
		pstmt.executeUpdate();
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		if(conn != null) try{ conn.close(); }catch(Exception ex){}
		if(pstmt != null) try{ pstmt.close(); }catch(Exception ex){}
		if(rs != null) try{ rs.close(); }catch(Exception ex){}
	}

	response.sendRedirect("product_list.jsp");
%>
