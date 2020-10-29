<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>

<section>
	<div id="title">
		<h3>성적 입력</h3>
	</div>
	<form method="post" action="form_ok.jsp">
		<table border="1" width="250" align="center">
			<tr>
				<td>이름</td>
				<td><input type="text" name="custname"></td>				
			</tr>
			<tr>
				<td>국어</td>
				<td><input type="text" name="kor"></td>
			</tr>
			<tr>
				<td>영어</td>
				<td><input type="text" name="eng"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="저장하기">	</td>
			</tr>			
		</table>
	</form>
</section>
<%@ include file="bottom.jsp" %>