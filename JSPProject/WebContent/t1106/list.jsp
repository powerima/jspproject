<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" align="center">
		<tr>
			<td>번호</td>
			<td>이름</td>
			<td>나이</td>
			<td>이메일</td>
		</tr>
		<c:forEach var='t' items="${list }">
			<tr>
				<td>${t.num }</td>
				<td>${t.name }</td>
				<td>${t.age }</td>
				<td>${t.email }</td>
			</tr>			
		</c:forEach>
	</table>
</body>
</html>