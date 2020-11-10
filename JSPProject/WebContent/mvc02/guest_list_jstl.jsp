<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="top.jsp" %>
<%
	String path = request.getContextPath();
%>
<section>
	<div id="title">
		<h3>방문자 목록</h3>
	</div>
	<table border="1" align="center">
		<tr>
			<td>rownum</td>
			<td>rnum</td>
			<td>번호</td>
			<td>이름</td>
			<td>전화</td>
			<td>주소</td>
			<td>날짜</td>
		</tr>
		<c:forEach var="g" items="${list }">
			<c:if test="${g.rownum % 2 == 0 }">
				<c:set var="color" value="#ffeeaa"/>
			</c:if>
			<c:if test="${g.rownum % 2 == 1 }">
				<c:set var="color" value="#aaeeaa"/>
			</c:if>
			<tr bgcolor="${color }">
				<td>${g.rownum }</td>
				<td>${g.rnum }</td>
				<td>${g.custno }</td>
				<td>${g.custname }</td>
				<td>${g.phone }</td>
				<td>${g.address }</td>
				<td>${g.joindate }</td>
			</tr>
		</c:forEach>
	</table>
	<div align="center">
		<c:if test="${startPage > 1 }">
			<a href="<%=path %>/GuestController?pageNum=${startPage - pageBlock}">[이전 10개]</a>&nbsp;&nbsp;
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
			<c:if test="${i == pageNum }">
				[${i }]
			</c:if>
			<c:if test="${i != pageNum }">
			<a href="<%=path %>/GuestController?pageNum=${i}">[${i }]</a>
			</c:if>
		</c:forEach>
		<c:if test="${endPage < pageCount }">
			<c:if test="${endPage + pageBlock < pageCount }">
				<a href="<%=path %>/GuestController?pageNum=${endPage+pageBlock}">[다음 10개]</a>
			</c:if>
			<c:if test="${endPage + pageBlock >= pageCount }">
				<a href="<%=path %>/GuestController?pageNum=${pageCount}">[다음 10개]</a>
			</c:if>
		</c:if>
		
	</div>
</section>
<%@ include file="bottom.jsp" %>