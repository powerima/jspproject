<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="top.jsp"%>
<%@ include file="dbconn.jsp"%>
<%

	
	String sql;	// 쿼리문	
	int count=0;
	
	try{
		sql = "select * from member";		
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
%>

<section>
	<br>
	<div align="center">
		<h2>학생 회원 목록보기</h2>
	</div>
	<table align=center width=500 border=1>
		<tr align=center>
			<td>순번</td>
			<td>학번</td>
			<td>이름</td>
			<td>전화</td>
			<td>메일</td>	
			<td>사진</td>
		</tr>
		
	<%	while (rs.next()) {	%>
		
		<tr align=center>			
			<td><a href='member_content.jsp?sno=<%=rs.getString("sno")%>'>
				<%=rs.getString("idx")%></a></td>
			<td><%=rs.getString("sno")%></td>
			<td><%=rs.getString("sname")%></td>
			<td><%=rs.getString("tel")%></td>
			<td><%=rs.getString("email")%></td>
			<td>
			<% if(rs.getString("fileT") != null){ %>
				<img src='./file/<%=rs.getString("fileT")%>'height=25>
			<% } else { %>
				<img src='./file/no.png' height=25>
			<% } %>
			</td>
		</tr>
	<%
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try{ rs.close(); } catch(Exception e){}
			if(pstmt != null) try{ pstmt.close(); } catch(Exception e){}
			if(con != null) try{ con.close(); } catch(Exception e){}
		}
	%>
	</table>	
</section>
<%@ include file="bottom.jsp"%>
