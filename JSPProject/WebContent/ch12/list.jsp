<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>



<%
	String id = (String)session.getAttribute("id");
	if(id == "" || id == null){
		response.sendRedirect("login.jsp");
	}

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String ch1 = "";
	String ch2 = "";
	String urlch2 = "";
	String pageNum = "";
	
	if(request.getParameter("ch1") != null){
		ch1 = request.getParameter("ch1");
		ch2 = request.getParameter("ch2");
	}
	pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}
		
	String jdbc = "jdbc:oracle:thin:@//localhost:1521/xe";
	String dbid = "system";
	String dbpwd = "1234";
	String sql = "";
	
	
	
	int currentPage = Integer.parseInt(pageNum);
	int pageSize = 10;
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = (currentPage * pageSize);
	int count = 0;
	int number = 0;
	
	
	
	
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(jdbc, dbid, dbpwd);
		
		// 검색어가 없는 경우
		if(ch2 == null || ch2.equals("")){		
			sql = "select count(*) as count from tbl_test02";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				count = rs.getInt("count");
			}			
			sql = "select rownum, p.* from ";
			sql += "(select rownum as rnum, k.* from ";
			sql += "(select * from tbl_test02 order by custname desc) k ";
			sql += "where rownum <= ? ) p where rnum >= ?";
			
		}
		//검색어가 있는 경우
		else{		
			urlch2 = java.net.URLEncoder.encode(ch2,"utf-8") ;
			
			// 전체 레코드 수 구하기
			sql = "select count(*) as count from tbl_test02 where " + ch1 + 
					" like '%" + ch2 + "%'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				count = rs.getInt("count");		
			}
			
			// 레코드 불러오기		
			sql = "select rownum, p.* " +
					"from (select rownum as rnum, k.* " +
					"from (select  * from tbl_test02 where " + ch1 + 
					" like '%" + ch2 +"%' order by custname desc) k "+
					"where rownum <= ?	)p " +
					"where rnum >= ?";
		}
		
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, endRow);
		pstmt.setInt(2, startRow);
		rs = pstmt.executeQuery();
			
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		
	<a href="logout.jsp">로그아웃</a>
	
	<table border="1" align="center" width="700">
		<tr align="center">
			<td>RowNum</td>
			<td>rNum</td>
			<td>번호</td>
			<td>이름</td>
			<td>번호</td>
			<td>주소</td>
			<td>가입날자</td>
		</tr>
	<%	while(rs.next()){ %>
		<tr align="center">
			<td><%=rs.getString("RowNum") %></td>
			<td><%=rs.getString("rNum") %></td>
			<td><%=rs.getString("custno") %></td>
			<td><%=rs.getString("custname") %></td>
			<td><%=rs.getString("phone") %></td>
			<td><%=rs.getString("address") %></td>
			<td><%=rs.getString("joindate").substring(0, 10) %></td>
		</tr>
	<%	} %>
	</table>
	
	<%
		if(count > 0){
			int pageCount = count / pageSize + (count%pageSize == 0 ? 0 : 1);
			int startPage = 1;
			
			if(currentPage % 10 != 0){
				startPage = (int)(currentPage/pageSize)*pageSize + 1;				
			}
			else{
				startPage = ((int)(currentPage/pageSize) -1 )*pageSize +1;
			}
			
			int pageBlock = 10;
			int endPage = startPage + pageBlock - 1;
			if(endPage > pageCount) endPage = pageCount;
			
			if(startPage > pageBlock) { %>
				<a href="list.jsp?pageNum=<%=startPage-10 %>&ch1=<%=ch1%>&ch2=<%=urlch2%>">[이전]</a>
	<%		}
			
			for(int i=startPage; i <=endPage; i++){ %>
				<a href="list.jsp?pageNum=<%=i %>&ch1=<%=ch1%>&ch2=<%=urlch2%>">[<%=i %>]</a>
	<%		} 
			
			if(endPage < pageCount) { %>
				<a href="list.jsp?pageNum=<%=startPage+10 %>&ch1=<%=ch1%>&ch2=<%=urlch2%>">[다음]</a>
	<%			
			}
		}
	
	%>
	
	<form method="get" action="list3.jsp">
		<select name="ch1">
			<option value="custname">이름</option>
			<option value="phone">전화번호</option>
		</select>
		<input type="text" name="ch2">
		<input type="submit" value="검색">
	</form>	
	</div>
</body>
</html>
<%

}catch(Exception ex){
	ex.printStackTrace();
}finally{
	if(rs!=null)try{ rs.close(); }catch(Exception ex){}
	if(pstmt != null)try{ pstmt.close();}catch(Exception ex){}
	if(conn != null)try{ conn.close(); }catch(Exception ex){}
}
%>