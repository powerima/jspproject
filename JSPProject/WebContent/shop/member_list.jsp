<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<%@ include file="dbconn.jsp" %>

<% request.setCharacterEncoding("UTF-8"); %>

<%
	try{
		sql = "select custno, custname, phone, address, " +
			" to_char(joindate, 'YYYY-MM-DD') as joindate, grade, city" +
			" from member_tbl_02 order by custno"; 
		
		pstmt = conn.prepareStatement(sql);		
		rs = pstmt.executeQuery();					
%>
<section>
	<div id=title>	
		<h3>회원목록조회/수정</h3>
	</div>
	<table id="listtable" align="center" border="1" width="700" >
		<tr align="center" style="font-weight:bold">		
			<td>회원번호</td>
			<td>회원성명</td>
			<td>전화번호</td>
			<td>주소</td>
			<td>가입일자</td>
			<td>고객등급</td>
			<td>거주지역</td>					
		</tr>
	<%
		while(rs.next()){
			
			String grade = rs.getString("grade");
			
			if(grade != null && grade.equals("A")) grade="VIP";
			else if(grade != null && grade.equals("B")) grade="일반";
			else if(grade != null && grade.equals("C")) grade="직원";
			else if(grade != null) grade = "관리자";
	
	%>
		<tr align="center">
			<td><a href='member_edit.jsp?custno=<%=rs.getString("custno")%>'>				
				<%=rs.getString("custno")%></a></td>
			<td>
				<%
					if(rs.getString("custno") == null) out.println("111");
					else out.println(rs.getString("custname"));
				%>
			</td>
			<td><%=rs.getString("phone") %></td>
			<td><%=rs.getString("address") %></td>
			<td><%=rs.getString("joindate") %></td>
			<td><%=grade %></td>
			<td><%=rs.getString("city") %></td>
		</tr>				
	<%	}	%>
	
	</table>
</section>
<%
	}catch(Exception ex){		
		ex.printStackTrace();
	}finally{
		if(rs != null) try{ rs.close(); }catch(Exception ex){}
		if(conn != null) try{ conn.close(); }catch(Exception ex){}
		if(pstmt != null) try{ pstmt.close(); }catch(Exception ex){}		
	}	
%>
<%@ include file="bottom.jsp" %>