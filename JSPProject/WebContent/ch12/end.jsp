<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = (String)session.getAttribute("id");
	if(id.equals("young")){
		out.println("관리자로 로그인 성공");
	}
	else{
		out.println("관리자로 로그인 실패");
	}

%>

</body>
</html>