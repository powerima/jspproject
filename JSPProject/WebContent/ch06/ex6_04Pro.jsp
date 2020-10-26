<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String str = request.getParameter("num1");
	int num1 = Integer.parseInt(str);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>입력한 숫자만큼 반복수행</h2>
	<table border="1" width="300">
		<tr align="center">
			<td>글번호</td>
			<td>글제목</td>
			<td>글내용</td>
		</tr>
	<%	for(int i=num1; i>0; i--){ %>
		<tr>
			<td><%=i %></td>
			<td>제목 <%=i %></td>
			<td>내용 <%=i %></td>
		</tr>	
	<% 	} %>
	</table>
</body>
</html>