<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<h3>EL 표현식 목록보기</h3>
	</div>
	
	<table border="1" >
		<tr>	
			<td>아이디</td>
			<td>암호</td>
			<td>이름</td>
			<td>이메일</td>
		</tr>
		<c:forEach var='m' items="${list }">
			<tr>
				<td><a href="/JSPProject2/DeleteController?id=${m.id }">${m.id }</a></td>
				<td>${m.pwd }</td>
				<td><a href="/JSPProject2/EditController?id=%{m.id}">${m.name }</a></td>
				<td>${m.email }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>