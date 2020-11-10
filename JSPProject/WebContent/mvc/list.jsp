<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="model.Member" %>
<%	
	Member m = null;
	List<Member> list 
		= (ArrayList<Member>)request.getAttribute("list");	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" width="300">
		<tr align="center">
			<td>아이디</td>
			<td>암호</td>
			<td>이름</td>
			<td>이메일</td>
		</tr>
	<%	for(int i=0; i<list.size();i++){ %>
		<tr align="center">
			<td><%= list.get(i).getId() %></td>
			<td><%= list.get(i).getPwd() %></td>
			<td><%= list.get(i).getName() %></td>
			<td><%= list.get(i).getEmail() %></td>
		</tr>
	<%	} %>		
	</table>
</body>
</html>