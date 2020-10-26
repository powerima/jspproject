<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<h3>학생성적 처리</h3>
	</div>
	<form method="post" action="form_ok.jsp">
		<table border="1" width="300" align="center">
			<tr>
				<td align="center">번호</td>
				<td><input type="text" name="custno"></td>
			</tr>
			<tr>			
				<td align="center">이름</td>
				<td><input type="text" name="custname"></td>
			</tr>
			<tr>
				<td align="center">국어</td>
				<td><input type="text" name="kor"></td>
			</tr>
			<tr>
				<td align="center">영어</td>
				<td><input type="text" name="eng"></td>
			</tr>
			<tr align="center">
				<td colspan="2">
				<input type="submit" value="저장하기"></td>
			</tr>
		</table>
	
	</form>
</body>
</html>