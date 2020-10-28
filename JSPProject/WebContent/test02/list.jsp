<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String ch1 = "";
	String ch2 = "";
	String pageNum = "";
	
	ch1 = request.getParameter("ch1");
	ch2 = request.getParameter("ch2");
	pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}
		
	String jdbc = "jdbc:oracle:thin:@//localhost:1521/xe";
	String id = "system";
	String pwd = "1234";
	String sql = "";
	
	
	
	int currentPage = Integer.parseInt(pageNum);
	int pageSize = 10;
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = (currentPage * pageSize);
	int count = 0;
	int number = 0;
	
	
	
	
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(jdbc, id, pwd);
				
		// 검색어가 있는 경우
		if(ch1 != null){
			// 전체 레코드 수 구하기
			sql = "select count(*) as count from tbl_test02 where " + ch1 + 
					" like %" + ch2 + "%";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				count = rs.getInt("count");		
			}
			
			
			
			// 레코드 불러오기		
			sql = "select rownum, p.* " +
					"from (select rownum as rnum, k.* " +
					"from (select  * from tbl_test02 where " + ch1 + 
					" like %" + ch2 +"% order by custname desc) k "+
					"where rownum <= ?	)p " +
					"where rnum >= ?";
		}
		//검색어가 없는 경우
		else{
			sql = "select count(*) as count from tbl_test02";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				count = rs.getInt("count");
			}
			
			sql = "select rownum, p.* ";
			sql += "from (select rownum as rnum, k.* ";
			sql += "from (select * from tbl_test02 order by custname desc) k ";
			sql += "where rownum <= ? )p where rnum >= >";
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
		
	
	<table border="1" align="center" width="700">
		<tr align="center">
			<td>RowNum</td>
			<td>RNum</td>
			<td>번호</td>
			<td>이름</td>
			<td>번호</td>
			<td>주소</td>
			<td>가입날자</td>
		</tr>
	<%	while(rs.next()){ %>
		<tr align="center">
			<td><%=rs.getString("RowNum") %></td>
			<td><%=rs.getString("RNum") %></td>
			<td><%=rs.getString("custno") %></td>
			<td><%=rs.getString("custname") %></td>
			<td><%=rs.getString("phone") %></td>
			<td><%=rs.getString("address") %></td>
			<td><%=rs.getString("joindate").substring(0, 10) %></td>
		</tr>
	<%	} %>
	</table>
	<form method="get" action="list.jsp">
		<select name="ch1">
			<option value="name">이름</option>
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