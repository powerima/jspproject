<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="ex.CD" %>
<%
	String jdbc = "jdbc:oracle:thin:@//localhost:1521/xe";
	String dbid = "system";
	String dbpwd = "1234";
	String sql = "";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(jdbc, dbid, dbpwd);
		
		for(int i=1; i<4; i++){
			sql = "insert into tbl_ch13_grade0"+ i +
					"(custno, custname, kor, eng)" +
					" values(seq_tbl_ch13_grade0"+i+".nextval, ?,?,?)";
					
			for(int j=0;j<100;j++){
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, CD.getName());
				pstmt.setInt(2, (int)(Math.random()*61)+40);
				pstmt.setInt(3, (int)(Math.random()*61)+40);
				pstmt.executeUpdate();		
			}
		}
		
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		if(pstmt != null) try{ pstmt.close(); }catch(Exception ex){}
		if(conn != null) try{ conn.close(); }catch(Exception ex){}
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>