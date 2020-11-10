<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
     ul { font-size: 14px }     
</style>
</head>
<body>	 
    <ul type=disc>
        <li><a href="<%=path %>/T1110_StudentController?flag=f">학생 등록</a></li>
        <li><a href="<%=path %>/T1110_StudentController?flag=s">학생 목록</a></li>        
    </ul>	
</body>
</html>