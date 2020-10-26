<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<%@ include file="dbconn.jsp" %>

<%
	String pcode = request.getParameter("pcode");
	String pname = "";
	String pdate = "";
	String pimg = "";
	String petc = "";
	
	sql = "select TO_CHAR(pdate, 'YYYYMMDD') as pdate, " +
		" pname, pimg, petc from product where pcode = ?";
	
	try{
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pcode);
		
		rs = pstmt.executeQuery();
		rs.next();
	
		if(rs.getString("pname") != null) pname = rs.getString("pname");
		if(rs.getString("pdate") != null) pdate = rs.getString("pdate");
		if(rs.getString("pimg") != null) pimg = rs.getString("pimg");	
		if(rs.getString("petc") != null) petc = rs.getString("petc");
		
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		if(conn != null) try{ conn.close(); }catch(Exception ex){}
		if(pstmt != null) try{ pstmt.close(); }catch(Exception ex){}
		if(rs != null) try{ rs.close(); }catch(Exception ex){}
	}
%>
<section>
	<div id="title">
		<h3>쇼핑몰 상품 수정</h3>
	</div>
	<form name="productEditForm" action="product_edit_ok.jsp"
		method="post" enctype="multipart/form-data">
		<table border="1" align="center" width="400">
			<tr>
				<td align="center">상품번호</td>
				<td><input type="hidden" name="pcode" value='<%=pcode %>'>
					<%=pcode %></td>			
			</tr>
			<tr>
				<td align="center">상품이름</td>
				<td><input type="text" name="pname" value='<%=pname %>'></td>				
			</tr>
			<tr>
				<td align="center">상품사진</td>
				<td><input type="file" name="pimg"></td>				
			</tr>
			<tr>
				<td align="center">상품설명</td>
				<td><textarea rows="5" cols="30" name="petc"><%=petc %></textarea></td>
			</tr>
			<tr>
				<td align="center">상품등록일</td>
				<td><input type="text" name="pdate" value='<%=pdate %>'></td>
			</tr>
			<tr align="center">
				<td colspan="2">
					<input type="submit" value="수정">
					<input type="button" value="삭제" 
						onclick=location.href="product_delete.jsp?pcode=<%=pcode %>">
				</td>
			</tr>
		</table>
	</form>
		
</section>
<%@ include file="bottom.jsp" %>
