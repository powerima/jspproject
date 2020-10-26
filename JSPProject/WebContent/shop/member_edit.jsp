<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<%@ include file="dbconn.jsp" %>

<%
	String custno = request.getParameter("custno");
	String custname = "";
	String phone = "";
	String address = "";
	String joindate = "";
	String grade = "";
	String city = "";

	sql = "select custname, phone, address,"+
	"TO_CHAR(joindate,'YYYYMMDD') as joindate, grade, city "+
	"from member_tbl_02 " +
	"where custno = ?";

	
	try{
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,custno);
		
		rs = pstmt.executeQuery();
		rs.next();
			
		if(rs.getString("custname") != null) custname = rs.getString("custname");
		if(rs.getString("phone") != null) phone = rs.getString("phone");
		if(rs.getString("address") != null) address = rs.getString("address");
		if(rs.getString("joindate") != null) joindate = rs.getString("joindate");
		if(rs.getString("grade") != null) grade = rs.getString("grade");
		if(rs.getString("city") != null) city = rs.getString("city");	
		
	}catch(Exception ex){
		ex.printStackTrace();	
	}finally{
		if(conn != null) try{ conn.close(); }catch(Exception ex){}
		if(rs != null) try{ rs.close(); }catch(Exception ex){}
		if(pstmt != null) try{pstmt.close(); }catch(Exception ex){}
	}
		
				
		
%>
<section>
	<div id=title>
		<h3>홈쇼핑 회원정보 수정</h3>
	</div>
	<form name="f1" action="member_ok.jsp">
		<table border="1" align="center" width=600>
			<tr>
				<td align="center">회원번호</td>
				<td><input type="text" name="custno" value=<%=custno %>></td>
			</tr>
			<tr>
				<td align="center">회원성명</td>
				<td><input type="text" name="custname" value="<%=custname %>"></td>			
			</tr>
			<tr>
				<td align="center">회원전화</td>
				<td><input type="text" name="phone" value="<%=phone %>"></td>
			</tr>
			<tr>
				<td align="center">회원주소</td>
				<td><input type="text" name="address" size=50 maxlengt="40" value="<%=address %>"></td>
			</tr>
			<tr>
				<td align="center">가입일자</td>
				<td><input type="text" name="joindate" value="<%=joindate %>"></td>			
			</tr>
			<tr>
				<td align="center">고객등급 [A:VIP, B:일반, C:직원]</td>
				<td><input type="text" name="grade" value="<%=grade %>"></td>			
			</tr>
			<tr>
				<td align="center">도시코드</td>
				<td><input type="text" name="city" value="<%=city %>"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정">
					<input type="button" value="삭제" 
						onclick=location.href="member_delete.jsp?custno=<%=custno %>">
				</td>
			</tr>
		</table>
	</form>
</section>
<%@ include file="bottom.jsp" %>