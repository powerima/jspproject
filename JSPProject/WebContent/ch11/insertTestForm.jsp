<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레코드 추가</title>
</head>
<body>
	<h2>member_tbl_01 테이블에 추가</h2>
	<form method="post" action="insertTestPro.jsp">
		<table border="1">
		<tr>
			<td>아이디</td>
			<td><input type="text" name="id" maxlengt="50"></td>			
		</tr>
		<tr>
			<td>패스워드</td>
			<td><input type="password" name="passwd" maxlengt="16"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" maxlengt="10"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="가입"></td>
		</tr>
		</table>
	</form>
</body>
</html>