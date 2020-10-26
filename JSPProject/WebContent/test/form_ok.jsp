<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("utf-8"); %>
<%
	String custno = request.getParameter("custno");
	String custname = request.getParameter("custname");
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	
	
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#title{
	text-align:center;
}
</style>
</head>
<body>
	<div id="title">
		<h3>학생성적 입력</h3>		
	</div>
	<table border="1" align="center" width="300">
		<tr>
			<td align="center">번호</td>
			<td><%=custno %></td>
		</tr>
		<tr>
			<td align="center">이름</td>
			<td><%=custname %></td>
		</tr>
		<tr>
			<td align="center">국어</td>
			<td><%=kor %></td>
		</tr>
		<tr>
			<td align="center">영어</td>
			<td><%=eng %></td>
		</tr>
		<tr>		
			<td align="center">총점</td>
			<td><%=kor+eng %></td>
		</tr>
	</table>
</body>
</html>