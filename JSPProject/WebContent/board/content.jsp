<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="top.jsp"%>
<%@ include file="dbconn.jsp"%>
<%
	// 학생 성적 조회
	String sno = request.getParameter("sno");

	String sql = "select sno, sname, kor, eng, math, hist, " + " kor + eng + math + hist as sum, "
			+ " (kor + eng + math + hist)/4 as avg" + " from examtbl where sno=?";

	pstmt = con.prepareStatement(sql);

	pstmt.setString(1, sno);
	rs = pstmt.executeQuery();
	rs.next();
%>
<section>
	<br>	
	<form name="f1" action="content_ok.jsp" onSubmit="return functionK();"
		method="GET">
		<div align="center">
			<h2>학생 성적 조회</h2>
		</div>
		<table border="1" align=center width=350 heignt=100>
			<tr>
				<td align=center>학&emsp;번</td>
				<td><input type=hidden name=sno value=<%=rs.getString("sno")%>><%=rs.getString("sno")%></td>
			</tr>
			<tr>
				<td align=center>성&emsp;명</td>
				<td><input type=text name=sname
					value=<%=rs.getString("sname")%>></td>
			</tr>
			<tr>
				<td align=center>국&emsp;어</td>
				<td><input type=number name=kor value=<%=rs.getString("kor")%>></td>
			</tr>
			<tr>
				<td align=center>영&emsp;어</td>
				<td><input type=number name=eng value=<%=rs.getString("eng")%>></td>
			</tr>
			<tr>
				<td align=center>수&emsp;학</td>
				<td><input type=number name=math
					value=<%=rs.getString("math")%>></td>
			</tr>
			<tr>
				<td align=center>역&emsp;사</td>
				<td><input type=number name=hist
					value=<%=rs.getString("hist")%>></td>
			</tr>
			<tr>
				<td align=center>합&emsp;계</td>
				<td><%=rs.getString("sum")%></td>
			</tr>
			<tr>
				<td align=center>평&emsp;균</td>
				<td><%=rs.getString("avg")%></td>
			</tr>
			<tr>
				<td align=center colspan=2><input type=submit value="성적저장">
				</td>
			</tr>
		</table>
	</form>
	<br>
	<hr width=80% />
	<div align=center>
		[<a href='form.jsp'>글쓰기</a>] 
		[<a href='list.jsp'>목록보기</a>] 
		[<a	href='pwd.jsp?sno=<%=rs.getString("sno")%>'>삭제하기</a>]
	</div>
</section>
<%
	if(con != null) try { con.close(); } catch(Exception e){}
	if(rs != null) try { rs.close(); } catch(Exception e){}
	if(pstmt != null) try { pstmt.close(); } catch(Exception e){}
%>
<%@ include file="bottom.jsp"%>