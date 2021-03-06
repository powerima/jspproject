<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section>
	<div id="title">
		<h3>쇼핑몰 회원 수정하기</h3>
	</div>
	<form name="member_form" action="/JSPProject/MemberController">		  
		<table border="1" align="center" width="600">
		<input type="hidden" name="flag" value="u"> 
			<tr>
				<td align="center">회원번호</td>
				<td><input type="text" 
					name="custno" value="${m.custno }"></td>
			</tr>
			<tr>
				<td align="center">회원성명</td>
				<td><input type="text" 
					name="custname" value="${m.custname }"></td>
			</tr>
			<tr>
				<td align="center">회원전화</td>
				<td><input type="text"
					name="phone" value="${m.phone }"></td>
			</tr>
			<tr>
				<td align="center">회원주소</td>
				<td><input type="text" 
					name="address" size=50 value="${m.address }"></td>
			</tr>
			<tr>
				<td align="center">가입일자</td>
				<td><input type="text" 
					name="joindate" value="${m.joindate }"></td>
			</tr>
			<tr>
				<td align="center">고객등급 [A:VIP, B:일반, C:직원]</td>
				<td><input type="text" 
					name="grade" value="${m.grade }"></td>
			</tr>
			<tr>
				<td >도시코드</td>
				<td><input type="text" 
					name="city" value="${m.city }"></td>
			</tr>
			<tr align="center">
				<td colspan="2">
					<input type="submit" value="등록">
					<input type="button" value="조회" 
						onclick=location.href="/JSPProject/MemberController?flag=r">
				</td>
			</tr>
		</table>
	</form>	
</section>
<%@ include file="bottom.jsp" %>