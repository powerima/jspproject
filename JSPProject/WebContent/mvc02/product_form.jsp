<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<section>
	<div id=title>
		<h3>쇼핑몰 상품 등록</h3>
	</div>
	<form name="productForm" action="/JSPProject/ProductController?flag=pi" onSubmit="return functionK();" 
		method="post" enctype="multipart/form-data">
		<table border="1" align="center" width="400">
			<input type="hidden" name="flag" value="i">
			
			<tr>
				<td align="center">상품번호</td>
				<td><input type="text" name="pcode" size="6"></td>
			</tr>
			<tr>
				<td align="center">상품이름</td>
				<td><input type="text" name="pname" size="20"></td>
			</tr>
			<tr>			
				<td align="center">상품사진</td>
				<td><input type="file" name="pimg">
			</tr>
			<tr>
				<td align="center">상품설명</td>
				<td><textarea rows="5" cols="30" name="petc"></textarea></td>				
			</tr>
			<tr>			
				<td align="center">상품입고일</td>
				<td><input type="text" name="pdate"></td>
			</tr>
			<tr align="center">
				<td colspan="2">
					<input type="submit" value="등록">
					<input type="button" value="조회" onclick="location.href='/JSPProject/ProductController?flag=ps'">
				</td>
			</tr>			
		</table>
	</form>
</section>
<%@ include file="bottom.jsp" %>