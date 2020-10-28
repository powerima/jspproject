<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<section>
	<div id="title">
		<h3>로그인</h3>
	</div>
	<form method="post" action="login_ok.jsp">
		<table border="1" align="center" width="400">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="password" name="passwd"></td>				
			</tr>
			<tr align="center">
				<td colspan="2">
					<input type="submit" value="로그인">
					<input type="button" value="회원가입"></td>
			</tr>
		</table>		
	</form>
</section>
<%@ include file="bottom.jsp" %>