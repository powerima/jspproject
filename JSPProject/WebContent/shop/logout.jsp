<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<section>
	<div id="title">
		<h3>로그아웃</h3>
	</div>
<%
	session.invalidate();
	response.sendRedirect("index.jsp");
%>
</section>
<%@ include file="bottom.jsp" %>