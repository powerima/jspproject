<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/JSPProject/mvc02/basic.css" type="text/css">
<script src="./js/script.js"></script>
</head>
<body>
<div id=whole>
	<header>
		<a class="head" href="/JSPProject/mvc02/index.jsp"><h2>쇼핑몰 회원관리 (MVC)</h2></a>	
	</header>
	<nav>
		<div id=index>
			<a href="/JSPProject/mvc02/member_form.jsp">회원등록</a>&emsp;&emsp;
			<a href="/JSPProject/MemberController?flag=r">회원목록 조회/수정</a>&emsp;&emsp;
			<a href="/JSPProject/MemberController?flag=m">회원 매출 조회</a>&emsp;&emsp;
			<a href="/JSPProject/mvc02/product_form.jsp">상품등록</a>&emsp;&emsp;
			<a href="/JSPProject/ProductController?flag=ps">상품목록</a>&emsp;&emsp;
			<a href="/JSPProject/mvc02/index.jsp">홈으로</a>	
		</div>
	</nav> 

