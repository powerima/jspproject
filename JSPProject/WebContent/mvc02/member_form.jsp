<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>

<section>
	<div id=title>	
		<h3>쇼핑몰 회원 등록</h3>
	</div>
	<form name=f1 action="/JSPProject/MemberFormController">
		<table border="1" align="center" width="600">
			<tr>
				<td align="center">회원번호</td>
				<td><input type="text" name="custno" ></td>
			</tr>
			<tr>
				<td align="center">회원성명</td>
				<td><input type="text" name="custname"></td>
			</tr>
			<tr>
				<td align="center">회원전화</td>
				<td><input type="text" name="phone"></td>
			</tr>
			<tr>
				<td align="center">회원주소</td>
				<td><input type="text" name="address" size=50></td>
			</tr>
			<tr>
				<td align="center">가입일자</td>
				<td><input type="text" name="joindate" ></td>
			</tr>
			<tr>
				<td align="center">고객등급 [A:VIP, B:일반, C:직원]</td>
				<td><input type="text" name="grade"></td>
			</tr>
			<tr>
				<td align="center">도시코드</td>
				<td><input type="text" name="city"></td>
			</tr>
			<tr align="center">
				<td colspan="2">
					<input type="submit" value="등록">
					<input type="button" value="조회" onclick=location.href="/JSPProject/MemberSelectController">
				</td>
			</tr>
		</table>
	</form>
</section>
<%@ include file="bottom.jsp" %>