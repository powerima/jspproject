<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<%@ include file="dbconn.jsp" %>

<%
	if(sid.equals("")){
		response.sendRedirect("login.jsp");
	}
	String pageNum = request.getParameter("pageNum");	
	if(pageNum == null){
		pageNum = "1";
	}
	
	int currentPage = Integer.parseInt(pageNum);
	int pageSize = 10;	
	int startRow = (currentPage - 1) * pageSize +1;		
	int endRow = (currentPage * pageSize);
	int count = 0;
	int number = 0;
	
	
	
	try{
		
		// 전체 레코드 수를 구하기
		sql = "select count(*) as rs from guest";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		rs.next();
		
		if(rs.getString("rs") != null){
			count = Integer.parseInt(rs.getString("rs"));
		}
		
		// 페이지 나누기를 위한 쿼리문
		sql = "select rownum, p.* " +
			"from (select rownum as rnum, k.* " +
			"from (select custno, custname, phone, address, " +
			"to_char(joindate, 'yyyy-mm-dd') as joindate " +
			"from guest order by custname desc) k "+
			"where rownum <= ?	)p " +
			"where rnum >= ?";
		
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, startRow + pageSize -1);
		pstmt.setInt(2, startRow);
		
		rs = pstmt.executeQuery();
	
	
%>
<section>
	
	<div id="title">
		<h3>방명록 리스트</h3>
	</div>
	<table border="1" align="center" width="600">
		<tr align="center">
			<td>글번호</td>
			<td>이름</td>
			<td>전화번호</td>
			<td>주소</td>
			<td>작성일</td>			
		</tr>
	<% 	while(rs.next()){ %>
		<tr align="center">
			<td><%=rs.getString("rnum") %></td>
			<td><%=rs.getString("custname") %></td>
			<td><%=rs.getString("phone") %></td>
			<td><%=rs.getString("address") %></td>
			<td><%=rs.getString("joindate") %></td>
		</tr>
	<%	} %>
	</table>
	<div align="center">
	<%
	// 페이지 나타내기
	if(count > 0){
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = 1;
		
		if(currentPage % 10 != 0){
			startPage = (int)(currentPage/pageSize)*pageSize + 1;			
		}
		else{
			startPage = ((int)(currentPage/pageSize)-1)*pageSize + 1;			
		}
		
		int pageBlock = 10;
		int endPage = startPage + pageBlock - 1;
		
		if(endPage > pageCount) endPage = pageCount;
		
		if(startPage > 10){	%>
			<a href="guest_list.jsp?pageNum=<%=startPage-10%>">[이전]</a>
	<%	}
		
		for(int i=startPage; i<=endPage; i++){ %>
			<a href="guest_list.jsp?pageNum=<%=i%>">[<%=i%>]</a>
	<% 	}
		
		if (endPage < pageCount) { %>
			<a href="guest_list.jsp?pageNum=<%=startPage+10%>">[다음]</a>
	<% 
		}
	}
	
	%>
	</div>
</section>
<%
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		if(conn != null) try{ conn.close(); }catch(Exception ex){}
		if(rs != null) try{ rs.close(); }catch(Exception ex){}
		if(pstmt != null) try{ pstmt.close(); }catch(Exception ex){}	
	}
%>
<%@ include file="bottom.jsp" %>