<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>
<%
	String sid = (String)session.getAttribute("id");
	if(sid == null){
		sid = "";
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
body{
	margin:0;
	padding:0;
	background:lightskyblue;
}
header{
	color:darkslategrey;
	background:lightskyblue;
	text-align:center;
	margin:10;
	padding:10;
}
nav{
	background:steelblue;	
	padding:10px;
	font-size:14px;
}
log_nav{			
	font-size:12px;
}
section{
	background:lightcyan;
	padding:10px;
	padding-bottom:30px;
}
footer{
	color:lightcyan;
	background:steelblue;
	padding:10px;
	text-align:center;
	font-size:12px;
}

#title{
	text-align:center;
}
#sub{
	text-align:center;	
}
a:link{color:steelblue;text-decoration:none;}
a:visited{color:steelblue;text-decoration:none;}
a:active{color:steelblue;text-decoration:none;}
a:hover{color:black;text-decoration:underline;}


.navlink:link{color:lightcyan;text-decoration:none;}
.navlink:visited{color:lightcyan;text-decoration:none;}
.navlink:active{color:lightcyan;text-decoration:none;}
.navlink:hover{color:#000000;text-decoration:underline;}

</style>
<title>elementry school community</title>
</head>
<body>
	<header id="title">
		<h2>Elementary school</h2>
	</header>
	<nav>
		<div id="index">			
			&emsp;<a class=navlink href="index.jsp">처음으로</a>
			&emsp;<a class=navlink href="grade_list.jsp?tab=1">1학년</a>
			&emsp;<a class=navlink href="grade_list.jsp?tab=2">2학년</a>
			&emsp;<a class=navlink href="grade_list.jsp?tab=3">3학년</a>
			&emsp;<a class=navlink href="vote.jsp">투표</a>
			
		</div>
	</nav>
	<log_nav>
		
	<%	
	
	//request url 로그인 처리
	Enumeration param = request.getParameterNames();
	String strParam = "";
	while(param.hasMoreElements()){
		String name = (String)param.nextElement();
		String value = request.getParameter(name);
		strParam += name + "=" + value + "&";
	}
	
	String url = request.getRequestURI() + "?" + strParam;
	
	if(request.getParameter("tab") != null){
		url += 	"?tab="+request.getParameter("tab");
	}
		
	if(sid.equals("")){			
	%>
		<form method="post" action="login_ok.jsp">		
			&emsp;id <input type="text" name="id">
			pw <input type="password" name="passwd">
			<input type="hidden" name="url" value=<%=url %>>
			<input type="submit" value="로그인">
		</form>
	<%	}else{ %>
		&emsp;<%=sid %> 님 로그인 되었습니다. 
		&emsp;[<a href="logout.jsp">로그아웃</a>]
	<%	} %>
		
	</log_nav2>