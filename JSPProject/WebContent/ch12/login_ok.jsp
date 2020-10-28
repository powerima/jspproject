<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");

	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection(
			"jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	
	String sql = "select * from tbl_member_ch12 " +
			"where id = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);	
	
	ResultSet rs = pstmt.executeQuery();

	if(rs.next()){
		if(passwd.equals(rs.getString("passwd"))){
			session.setAttribute("id", id);
		%>	
			<script>
				alert("로그인 성공");
				location.href="list.jsp";
			</script>
		<%
		}
		else{
		%>
			<script>
				alert("패스워드를 확인해 주세요");
				location.href="login.jsp?id=<%=id%>";
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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>