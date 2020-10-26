<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>
<%
	String sno = request.getParameter("sno");
%>
<section>
	<br>
	<form name="f1" action="member_delete.jsp" method="GET">
		<div align="center">
			<h2>암호 확인</h2>
		</div>
		<table border="1" align=center width=350 heignt=120>
			<tr>
				<td align=center>번&emsp;호</td>
				<td><input type=hidden name=sno value=<%=sno%>><%=sno%></td>
			</tr>
			<tr>
				<td align=center>암&emsp;호</td>
				<td><input type=password name=pwd></td>
			</tr>
			<tr>
				<td align=center colspan=2><input type=submit value="암호확인">
				</td>
			</tr>
		</table>
	</form>
</section>
<%@ include file="bottom.jsp"%>
​