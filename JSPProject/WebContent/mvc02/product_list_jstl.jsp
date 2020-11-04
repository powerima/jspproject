<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
		<c:forEach var="p" items="${list }">
			<tr align="center">
				<td>${p.pcode }</td>
				<td>${p.pname }</td>
				<td>${p.pdate }</td>
				<td><img src="/JSPProject/mvc02/file/${p.pimg }" height="40"/></td>
			</tr>
		</c:forEach>
	</table>
</section>
<%@ include file="bottom.jsp" %>