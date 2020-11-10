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
	<div align="center">
		<a href="/JSPProject/t1110/index.jsp">처음으로	</a>
		<br>
	</div>
	<table border="1" align="center" width="500">
		<tr align="center">
			<td>학번</td>
			<td>이름</td>
			<td>학과</td>
			<td>영어</td>
			<td>수학</td>
			<td>총점</td>
			<td>평균</td>			
		</tr>
		<c:forEach var="s" items="${list }">
			<tr align="center">
				<td>${s.sno }</td>
				<td>${s.sname }</td>
				<td>${s.deptname }</td>
				<td>${s.eng }</td>
				<td>${s.math }</td>
				<td>${s.eng + s.math }</td>
				<td>${(s.eng+s.math)/2 }</td>				
			</tr>
		</c:forEach>
	</table>
</body>
</html>