<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="top.jsp" %>
<%
	String tab = (String)session.getAttribute("tab");
	String custno = request.getParameter("custno");
	String custname = "";
	String kor = "";
	String eng = "";
	
	String jdbc = "jdbc:oracle:thin:@//localhost:1521/xe";
	String dbid = "system";
	String dbpwd = "1234";
	String sql = "";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		Class.forName("oracle.jdbc.OracleDriver")	;
		conn = DriverManager.getConnection(jdbc, dbid, dbpwd);
		
		if(tab.equals("1")){
			sql = "select * from tbl_ch13_grade01 ";
			sql += "where custno = ?";
		}
		else if(tab.equals("2")){
			sql = "select * from tbl_ch13_grade02 ";
			sql += "where custno = ?";
		}
		else if(tab.equals("3")){
			sql = "select * from tbl_ch13_grade03 ";
			sql += "where custno = ?";
		}
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, custno);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			custname = rs.getString("custname");
			kor = rs.getString("kor");
			eng = rs.getString("eng");
		}
		
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		if(rs != null) try{rs.close();}catch(Exception ex){}
		if(pstmt != null) try{pstmt.close();} catch(Exception ex){}
		if(conn != null) try{conn.close();}catch(Exception ex){}
	}

%>
<section>
	<div id="title">
		<h3>학생성적 수정</h3>
	</div>
	<form method="post" action="edit_ok.jsp">
		<table border="1" width="250" align="center">
			<tr>
				<td>번호</td>
				<td><input type="hidden" 
					name="custno" value="<%=custno %>">
					<%=custno %></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" 
					name="custname" value="<%=custname %>"></td>					
			</tr>
			<tr>
				<td>국어</td>
				<td><input type="text"
					name="kor" value="<%=kor %>"></td>					
			</tr>
			<tr>
				<td>영어</td>
				<td><input type="text"
					name="eng" value="<%=eng %>"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정하기">
					<input type="button" value="삭제하기" 
						onclick="location.href='delete.jsp?custno=<%=custno %>'">
				</td>
			</tr>	
		</table>
	</form>
</section>
<%@ include file="bottom.jsp" %>