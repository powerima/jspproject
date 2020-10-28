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
	String id = "";
	if(request.getParameter("id") != null){
		id = request.getParameter("id");
	}

%>
	<form method="post" action="login_ok.jsp">
		아이디: <input type="text" name="id" value=<%=id %>>
		비밀번호: <input type="password" name="passwd">
		<input type="submit" value="로그인">
	</form>
</body>
</html>