<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ include file="top.jsp" %>
<%!
	
%>
<%
	String jdbc = "jdbc:oracle:thin:@//localhost:1521/xe";
	String dbid = "system";
	String dbpwd = "1234";
	String sql = "";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	int sum = 0;
	
	ArrayList<String[]> list = new ArrayList<String[]>();
	
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(jdbc, dbid, dbpwd);
	
		sql = "select * from vote_tbl_ch13";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		
		while(rs.next()){			
			String[] str = {rs.getString("company"),rs.getString("vote_cnt")};
			
			sum += Integer.parseInt(str[1]);			
			list.add(str);
		}
		
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		if(rs != null)try{ rs.close(); }catch(Exception ex){}
		if(pstmt != null)try{ pstmt.close(); }catch(Exception ex){}
		if(conn != null)try{ conn.close(); }catch(Exception ex){}
	}
%>
<section>
	<div id="title">
		<h3>투표 결과보기</h3>
	</div>
	<table border="1" width="300" align="center">
		<tr align="center">
			<td>기업</td>
			<td>투표수</td>
			<td>투표율</td>
		</tr>		
	<%	for(int i=0; i<list.size();i++){ %>	
	<% 		int cnt = Integer.parseInt(list.get(i)[1]); %>
	<%		double vr = Math.round((double)cnt/sum*10000)/100.0; %>
		<tr align="center">
			<td><%=list.get(i)[0] %></td>
			<td><%=cnt %></td>
			<td><%=vr %>%</td>
		</tr>		
	<%	} %>
	</table>
</section>
<%@ include file="bottom.jsp" %>