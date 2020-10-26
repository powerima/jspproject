<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("utf-8"); %>
<%
	String k = request.getParameter("n1");
		
	if (k.equals("우리")){
		out.println("우리를 입력하였습니다.");
	}
	else{
		out.println("우리를 입력하지 않았습니다.");
	}
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>