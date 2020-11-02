<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section>
	<div id="title">
		<h3>회원목록 조회/수정</h3>
	</div>
	<table border="1" align="center" width="800">
		<tr align="center">
			<td>회원번호</td>
			<td>회원성명</td>
			<td>전화번호</td>
			<td>주  소</td>
			<td>가입일자</td>
			<td>고객등급</td>
			<td>지역코드</td>			
		</tr>
		<c:forEach var='m' items='${list }'>
			<tr align="center">
				<td>${m.custno }</td>
				<td>${m.custname }</td>
				<td>${m.phone }</td>
				<td>${m.address }</td>
				<td>${m.joindate }</td>
				<td>${m.grade }</td>
				<td><a href="MemberDeleteController?custno=${m.custno}">
					${m.city }</a></td>
			</tr>
		</c:forEach>
	</table>
</section>
<%@ include file="bottom.jsp" %>