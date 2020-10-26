<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>
<section>
	<br>
	<form name="f1" action="form_ok.jsp" onSubmit="return functionK();"
		method="GET">
		<div align="center">
			<h2>학생 성적 입력</h2>
		</div>
		<table border="1" align=center width=350 heignt=100>
			<tr>
				<td align=center>학&emsp;번</td>
				<td><input type=number name=sno></td>
			</tr>
			<tr>
				<td align=center>성&emsp;명</td>
				<td><input type=text name=sname></td>
			</tr>
			<tr>
				<td align=center>국&emsp;어</td>
				<td><input type=number name=kor></td>
			</tr>
			<tr>
				<td align=center>영&emsp;어</td>
				<td><input type=number name=eng></td>
			</tr>
			<tr>
				<td align=center>수&emsp;학</td>
				<td><input type=number name=math></td>
			</tr>
			<tr>
				<td align=center>역&emsp;사</td>
				<td><input type=number name=hist></td>
			</tr>
			<tr>
				<td align=center colspan=2><input type=submit value="성적저장">
				</td>
			</tr>
		</table>
	</form>
</section>
<%@ include file="bottom.jsp"%>