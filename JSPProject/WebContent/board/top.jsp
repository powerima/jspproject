<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 성적 관리</title>
<style>
body {
	background-color:#6699ff;
	margin:0;
	padding:0;
}
header {
	background-color: blue;
	text-align: center;
	height: 45px;
	font-size: 18px;
	color: #ffffff;
	line-height: 45px;
	vertical-align: middle;
}

nav {	
	height: 30px;
	width: 100%;
	font-size: 13px;
	display: table;
	text-align: left;
}

section {
	background-color: #cccccc;	
	font-size: 12px;
	width: 100%;
	padding-bottom:50px;	
}

footer {
	background-color: #6699ff;
	text-align: center;
	height: 35px;
	font-size: 12px;
	color: #ffffff;
	line-height: 35px;
}

table {	
	border-collapse: collapse;
}

td {
	border: 1px solid #555555;	
}

#span1 {
	background-color: #6699ff;
	width: 300px;
	display: table-cell;
	vertical-align: middle;
}

A:link {
	color: #555555;
	text-decoration: none;
}

A:visited {
	color: #555555;
	text-decoration: none;
}

A:active {
	color: #555555;
	text-decoration: none;
}

A:hover {
	color: #000000;
	text-decoration: underline;
}
</style>
<script src="./js/form.js"></script>
</head>
<body>
	<header>
		<h2>학생 성적 관리 프로그램</h2>
	</header>
	<nav>
		<span id="span1"> 
			&emsp;&emsp;<a href=member.jsp>회원가입</a>
			&emsp;<a href=member_list.jsp>회원목록</a>
			&emsp;<a href=form.jsp>성적입력</a>
		 	&emsp;<a href=list.jsp>성적조회</a> 
		 	&emsp;<a href=index.jsp>홈으로</a>
		</span>
	</nav>
	