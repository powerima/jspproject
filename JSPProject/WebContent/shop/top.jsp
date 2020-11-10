<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sid = (String)session.getAttribute("id");
	if(sid == null || sid.equals("")){
		sid = "";
	}

%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="basic.css" type="text/css">
<script src="./js/script.js"></script>
</head>
<body>
	<header>
		<a class="head" href="index.jsp"><h2>쇼핑몰 회원관리</h2></a>
		<div id="login" align="right">
	<%	if(sid.equals("")){ %>
		
			<a href="login.jsp">로그인</a>&nbsp; |&nbsp; 
			<a href="signin.jsp">회원가입</a>
	<%	}else{	%>
			<a href="logout.jsp">로그아웃</a>
	<%	} %>
		</div>
	</header>
	<nav>
		<div id=index>
			<a href=form.jsp>회원등록</a>&emsp;&emsp;
			<a href=member_list.jsp>회원목록 조회/수정</a>&emsp;&emsp;
			
	<% if(!(sid.equals(""))){ %>				
			<a href=money_list.jsp>회원 매출 조회</a>&emsp;&emsp;		
			<a href=product.jsp>상품 등록</a>&emsp;&emsp;
			<a href=product_list.jsp>상품 목록</a>&emsp;&emsp;
			<a href=guest_list.jsp>방문자 목록</a>&emsp;&emsp;
	<%	} %>
			<a href=index.jsp>홈으로</a>	
		</div>
	</nav> 

