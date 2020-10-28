<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<%@ include file="dbconn.jsp" %>

<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	sql = "select * from member_tbl_shop where id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	
	rs = pstmt.executeQuery();
	
	if(rs.next()){
		if(passwd.equals(rs.getString("passwd"))){
			session.setAttribute("id", id);
		%>
			<script>
				alert("로그인 성공");
				location.href="index.jsp";
			</script>
		<%
		}
		else{
		%>
			<script>
				alert("패스워드를 확인해 주세요");
				location.href="login.jsp";
			</script>
		<%
		}
	}
	else{
	%>
		<script>
			alert("동일한 아이디가 존재하지 않습니다.");
			location.href="login.jsp";
		</script>
	<%
	}
%>
<section>
	<div id="title">
		<h3>로그인</h3>
	</div>
	
</section>
<%@ include file="bottom.jsp" %>