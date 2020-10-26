<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ include file="top.jsp" %>
<%@ include file="dbconn.jsp" %>

<%
	
 	int custno = 0;		
	String joindate = "";
		
	try {		
		sql = "select max(custno) + 1 as " +
				"custno from member_tbl_02";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		// 회원번호 자동 입력
		rs.next();
		custno = rs.getInt("custno");
		if(custno == 0){
			custno = 100001;			
		}
		
		// 가입날짜 자동입력		
		joindate = new SimpleDateFormat("YYYYMMdd").format(new Date());
			
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		if (conn != null) try{ conn.close(); }catch(Exception ex){}
		if (rs != null) try{ rs.close(); }catch(Exception ex){}
		if (pstmt != null) try{ pstmt.close(); }catch(Exception ex){}
	}
%>
<section>
	<div id=title>	
		<h3>쇼핑몰 회원 등록</h3>
	</div>
	<form name=f1 action="form_ok.jsp">
		<table border="1" align="center" width="600">
			<tr>
				<td align="center">회원번호(자동발생)</td>
				<td><input type="text" name="custno" value=<%=custno %>></td>
			</tr>
			<tr>
				<td align="center">회원성명</td>
				<td><input type="text" name="custname"></td>
			</tr>
			<tr>
				<td align="center">회원전화</td>
				<td><input type="text" name="phone"></td>
			</tr>
			<tr>
				<td align="center">회원주소</td>
				<td><input type="text" name="address" size=50></td>
			</tr>
			<tr>
				<td align="center">가입일자</td>
				<td><input type="text" name="joindate" value=<%=joindate %>></td>
			</tr>
			<tr>
				<td align="center">고객등급 [A:VIP, B:일반, C:직원]</td>
				<td><input type="text" name="grade"></td>
			</tr>
			<tr>
				<td align="center">도시코드</td>
				<td><input type="text" name="city"></td>
			</tr>
			<tr align="center">
				<td colspan="2">
					<input type="submit" value="등록">
					<input type="button" value="조회" onclick=location.href="member_list.jsp">
				</td>
			</tr>
		</table>
	</form>
</section>
<%@ include file="bottom.jsp" %>