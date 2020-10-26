<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="top.jsp" %>
    
<% request.setCharacterEncoding("utf-8"); %>
<%
	String custno = request.getParameter("custno");
	String custname = request.getParameter("custname");
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int sum = kor + eng;
	double avg = sum/2.0;

	
	Connection conn = null;
	PreparedStatement pstmt= null;

	String sql = "";
	
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(
				"jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		
		sql = "insert into t1026(custno, custname, kor, eng) ";
		sql += "values(?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, custno);
		pstmt.setString(2, custname);
		pstmt.setInt(3, kor);
		pstmt.setInt(4, eng);
		pstmt.executeUpdate();
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		if(pstmt != null) try{ pstmt.close(); }catch(Exception ex){}
		if(conn != null) try{ conn.close(); }catch(Exception ex){}		
	}
	
 %>
<section>
	<div id="title">
		<h3>학생성적 입력</h3>		
	</div>
	<table border="1" align="center" width="300">
		<tr>
			<td align="center">번호</td>
			<td><%=custno %></td>
		</tr>
		<tr>
			<td align="center">이름</td>
			<td><%=custname %></td>
		</tr>
		<tr>
			<td align="center">국어</td>
			<td><%=kor %></td>
		</tr>
		<tr>
			<td align="center">영어</td>
			<td><%=eng %></td>
		</tr>
		<tr>		
			<td align="center">총점</td>
			<td><%=sum %></td>
		</tr>
		<tr>
			<td align="center">평균</td>
			<td><%=avg %></td>
		</tr>
	</table>
</section>
</body>
</html>