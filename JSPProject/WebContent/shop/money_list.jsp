<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ include file="top.jsp" %>
<%@ include file="dbconn.jsp" %>
<%
	sql = "select m.custno, custname, grade, sum(pcost*amount) as sales " +
		" from member_tbl_02 m join money_tbl_02 n on m.custno = n.custno " + 
		" group by m.custno, custname, grade order by sum(pcost*amount) desc";

	try{
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
%>
<section>
	<div id=title>
		<h3>회원 매출 조회</h3>
	</div>
	<table border="1" align="center" width="400">
		<tr align="center" style="font-weight:bold">
			<td>회원번호</td>
			<td>회원성명</td>
			<td>고객등급</td>
			<td>매출</td>			
		</tr>
	<%
		while(rs.next()){			
			DecimalFormat df = new DecimalFormat("###,###,###");
			String sales = new DecimalFormat("###,####,###").format(rs.getInt("sales"));	
			
			String grade = rs.getString("grade");
			if(grade.equals("A")) grade = "VIP";
			else if(grade.equals("B")) grade = "일반";
			else if(grade.equals("C")) grade = "직원";
			
	%>
		<tr align="center">
			<td><%=rs.getString("custno") %></td>
			<td><%=rs.getString("custname") %></td>
			<td><%=grade %></td>
			<td><%=sales %></td>
		</tr>
	<%} %>
	</table>
</section>
<%
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		if(conn != null) try{ conn.close(); }catch(Exception ex){}
		if(rs != null) try{ rs.close(); }catch(Exception ex){}
		if(pstmt != null)try{ rs.close(); }catch(Exception ex){}
	}
%>
<%@ include file="bottom.jsp" %>