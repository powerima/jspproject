<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="top.jsp"%>
<%@ include file="dbconn.jsp"%>
<%
	// 학생 성적 조회
	String sno = request.getParameter("sno");
	String sql = "select * from member where sno=?";
	String saveFolder = "file/";
	
	ServletContext context = getServletContext();
	String realFolder = context.getRealPath(saveFolder);
	
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, sno);
	rs = pstmt.executeQuery();
	
	rs.next();	// BOF 다음으로 넘겨 첫번째 레코드 사용
	
	
	
	sno = rs.getString("sno");
	String idx = rs.getString("idx");
	String sname = rs.getString("sname");
	String tel = rs.getString("tel");
	String email = rs.getString("email");
	String addr = rs.getString("addr");
	String filename = rs.getString("fileT");			
	
%>
<section>
	<br>	
	<form name="f1" action="member_content_ok.jsp" onSubmit="return functionK();"
		method="POST" enctype="multipart/form-data">
		<div align="center">
			<h2>학생 성적 조회</h2>
		</div>
		<table border="1" align=center width=500 heignt=100>
			<tr>
				<td align=center>순번</td>
				<td><input type=hidden name=sno value=<%=sno %>><%=sno%></td>
			</tr>
			<tr>
				<td align=center>이름</td>
				<td><input type=text name=sname	value=<%=sname%>></td>
			</tr>
			<tr>
				<td align=center>전화</td>
				<td><input type=text name=tel value=<%=tel%>></td>
			</tr>
			<tr>
				<td align=center>이메일</td>
				<td><input type=text name=email	value=<%=email%>></td>
			</tr>
			<tr>
				<td align=center>주소</td>
				<td><input type=text name=addr value="<%=addr%>" maxlength="50" size=50></td>
			</tr>				
			<tr align=center>
				<td rowspan="2">사진</td>
				<td>
					<% if(rs.getString("fileT") != null){ %>
					<img src='./file/<%=rs.getString("fileT")%>'height=100>
					<% } else { %>
						<img src='./file/no.png'height=100>
					<% } %>
				</td>
			</tr>		
			<tr>			
				<td><input type=file name=file></td>
			</tr>						
			<tr>
				<td align=center colspan=2><input type=submit value="회원수정">
				</td>
			</tr>
		</table>
	</form>
	<br>
	<hr width=80% />
	<div align=center>
		[<a href='member.jsp'>글쓰기</a>] 
		[<a href='member_list.jsp'>목록보기</a>] 
		[<a	href='member_pwd.jsp?sno=<%=rs.getString("sno")%>'>삭제하기</a>]
	</div>
</section>
<%
	if(con != null) try { con.close(); } catch(Exception e){}
	if(rs != null) try { rs.close(); } catch(Exception e){}
	if(pstmt != null) try { pstmt.close(); } catch(Exception e){}
%>
<%@ include file="bottom.jsp"%>