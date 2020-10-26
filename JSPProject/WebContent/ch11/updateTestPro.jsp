<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("utf-8"); %>

<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		String jdbc = "jdbc:oracle:thin:@//localhost:1521/xe";
		String dbid = "system";
		String dbpwd = "1234";
		
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(jdbc, dbid, dbpwd);
		
		String sql = "select id, passwd from member_tbl_01 where id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			String rId = rs.getString("id");
			String rPasswd = rs.getString("passwd");
			if(id.equals(rId) && passwd.equals(rPasswd)){
				sql = "update member_tbl_01 set name = ? where id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, id);
				pstmt.executeUpdate();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레코드 수정</title>
</head>
<body>
	member_tbl_01 테이블의 레코드를 수정했습니다.
</body>
</html>
<%
			}
			else{
				out.println("패스워드가 틀렸습니다.");
			}
		}
		else{
			out.println("아이디가 틀렸습니다.");
			out.println(id + " id <br>");		
		}
	}catch(Exception ex){
		ex.printStackTrace();		
	}finally{
		if(rs != null) try{ rs.close(); }catch(Exception ex){}
		if(pstmt != null) try{ pstmt.close(); }catch(Exception ex){}
		if(conn != null) try{ conn.close(); }catch(Exception ex){}
	}
%>