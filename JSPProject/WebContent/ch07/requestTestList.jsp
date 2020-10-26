<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="requestTestTop.jsp" %>
    
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
		
		sql = "select * from student_tbl_ch07";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		
	
%>

<section>
	<table border="1" width="400">
		<tr>
			<td>학번</td>
			<td>이름</td>
			<td>학년</td>
			<td>선택과목</td>
		</tr>
	<%	while(rs.next()){ %>
			<tr>
				<td><%=rs.getString("num") %></td>
				<td><%=rs.getString("name") %></td>
				<td><%=rs.getString("grade") %></td>
				<td><%=rs.getString("subject") %></td>
			</tr>
	<%	} %>
	</table>
</section>
<%
	}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			if(rs != null) try{ rs.close(); }catch(Exception ex){}
			if(pstmt != null) try{ pstmt.close(); }catch(Exception ex){}
			if(conn != null) try{ conn.close(); }catch(Exception es){}
	}
 %>
 
 <%@ include file="requestTestBottom.jsp" %>
 