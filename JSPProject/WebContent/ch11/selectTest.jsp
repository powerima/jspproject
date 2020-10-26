<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>member_tbl_01 테이블의 레코드 표시</h2>
	<table border="1">
		<tr>
			<td width="100">아이디</td>
			<td width="100">패스워드</td>
			<td width="100">이름</td>
			<td width="250">가입일자</td>
		</tr>
		
	<%
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			String jdbc = "jdbc:oracle:thin:@//localhost:1521/xe";
			String dbid = "system";
			String dbpwd = "1234";
			
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(jdbc,dbid,dbpwd);
			
			String sql = "select * from member_tbl_01";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				String id = rs.getString("id");
				String passwd = rs.getString("passwd");
				String name = rs.getString("name");
				Timestamp register = rs.getTimestamp("reg_date");						
	%>
		<tr>
			<td width="100"><%=id %></td>
			<td width="100"><%=passwd %></td>
			<td width="100"><%=name %></td>
			<td width="250"><%=register.toString() %></td>
		</tr>
	<% 
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			if(rs != null) try{ rs.close(); } catch(Exception ex){}
			if(pstmt != null) try{ pstmt.close(); } catch(Exception ex){}
			if(conn != null) try{ conn.close(); } catch(Exception ex){}
		}
	%>
	</table>
</body>
</html>