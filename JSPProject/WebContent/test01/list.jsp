<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="top.jsp" %>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String jdbc = "jdbc:oracle:thin:@//localhost:1521/xe";
	String id = "system";
	String pwd = "1234";
	String sql = "";
	
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(jdbc, id, pwd);
		
		sql = "select * from tbl_test01";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();	
%>
<section>
	<div id="title">
		<h3>학생성적 목록</h3>
	</div>
	<table border="1" align="center" width="400">
		<tr align="center">
			<td>번호</td>
			<td>이름</td>
			<td>국어</td>
			<td>영어</td>			
		</tr>
	<%	while(rs.next()){ %>
		<tr align="center">
			<td><a href='delete.jsp?custno=<%=rs.getString("custno") %>'/>
				<%=rs.getString("custno") %></td>
			<td><%=rs.getString("custname") %></td>
			<td><%=rs.getString("kor") %></td>
			<td><%=rs.getString("eng") %></td>
		</tr>
	<%	} %>
	</table>
</section>
</body>
</html>
<%
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		if(rs != null) try{ rs.close(); }catch(Exception ex){}
		if(pstmt != null) try{ pstmt.close(); }catch(Exception ex){}
		if(rs != null) try{ rs.close(); }catch(Exception ex){}
	}

%>