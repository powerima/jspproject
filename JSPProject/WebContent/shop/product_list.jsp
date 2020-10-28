<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<%@ include file="dbconn.jsp" %>

<%
	if(sid.equals("")){
		response.sendRedirect("login.jsp");
	}
	try{
		sql = "select pcode, pname, " +
			"TO_CHAR(pdate, 'YYYY-MM-DD') as pdate, " +
			"pimg from product";
		
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();		
	
%>
<section>
	<div id="title">
		<h3>쇼핑몰 상품 목록/수정</h3>
	</div>
	<table border="1" align="center" width="600">
		<tr align="center">
			<td>상품코드</td>
			<td>상품이름</td>
			<td>상품등록날짜</td>
			<td>상품이미지</td>
		</tr>
	<% while(rs.next()){ %>
		<tr align="center">
			<td><a href='product_edit.jsp?pcode=<%=rs.getString("pcode") %>'>
				<%=rs.getString("pcode") %></a></td>
			<td><%=rs.getString("pname") %></td>
			<td><%=rs.getString("pdate") %></td>
			<td><img src='file/<%=rs.getString("pimg")%>'
				height=40 /></td>
		</tr>
	<% } %>
	</table>
</section>
<%
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		if(conn != null) try{ conn.close(); }catch(Exception ex){}
		if(rs != null) try{ rs.close(); }catch(Exception ex){}
		if(pstmt != null) try{ pstmt.close(); }catch(Exception ex){}
	}
%>
<%@ include file="bottom.jsp" %>