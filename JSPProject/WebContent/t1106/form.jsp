<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="/JSPProject/T1106_InsertController">
		<table border="1" align="center" >
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
			</tr>				
			<tr>
				<td>나이</td>
				<td><input type="text" name="age"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email"></td>
			</tr>
			<tr align="center">
				<td colspan="2">
					<input type="submit" value="등록">
					<input type="button" value="조회"
						 onclick="location.href='/JSPProject/T1106_SelectController'">
				</td>
			</tr>
		</table>
	</form>	
</body>
</html>