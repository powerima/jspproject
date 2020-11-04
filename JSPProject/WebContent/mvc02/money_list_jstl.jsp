<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<section>
	<div id=title>
		<h3>회원 매출 조회</h3>
	</div>
	<table border="1" align="center" width="400">
		<tr align="center" style="font-weight:bold">
			<td>회원번호</td>
			<td>회원성명</td>
			<td>고객등급</td>
			<td>매출</td>			
		</tr>
		<c:forEach var="m" items="${list }">
			<tr align="center">
				<td>${m.custno }</td>
				<td>${m.custname }</td>
				<td>
					<c:choose>
						<c:when test="${m.grade eq 'A' }">
							VIP	</c:when>
						<c:when test="${m.grade eq 'B' }">
							일반	</c:when>
						<c:when test="${m.grade eq 'C' }">
							직원 </c:when>
					</c:choose>
				</td>
				<td>${m.pricesum }</td>
			</tr>
		</c:forEach>
	</table>
</section>
<%@ include file="bottom.jsp" %>