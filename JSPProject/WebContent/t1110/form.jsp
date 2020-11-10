<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<a href="/JSPProject/t1110/index.jsp">처음으로	</a>
		<br>
	</div>
	<form name="studentform"  method="post"
		action="/JSPProject/T1110_StudentController?flag=i">
		<table border="1" align="center" width="300">
			<tr>
				<td align="center">학번</td>
				<td><input type="hidden" name="sno" value="${sno }">
					${sno }</td>
			</tr>
			<tr>
				<td align="center">이름</td>
				<td><input type="text" name="sname"></td>				
			</tr>
			<tr>
				<td align="center">학과</td>
				<td><input type="text" name="deptname"></td>
			</tr>
			<tr>
				<td align="center">영어</td>
				<td><input type="text" name="eng"></td>
			</tr>
			<tr>
				<td align="center">수학</td>
				<td><input type="text" name="math"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="등록">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>