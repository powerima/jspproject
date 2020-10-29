<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String url = request.getParameter("url");
	
	String jdbc = "jdbc:oracle:thin:@//localhost:1521/xe";
	String dbid = "system";
	String dbpwd = "1234";
	String sql =	"";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(jdbc, dbid, dbpwd);
		
		sql = "select * from member_tbl_ch13 where id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			if(passwd.equals(rs.getString("passwd"))){
				session.setAttribute("id", id);
			%>
				<script>
				alert('로그인에 성공하였습니다.');				
				</script>				
			<%			
				
				response.sendRedirect(url);
			}
			else{
			%>
				<script>
				alert('비밀번호가 다릅니다.');				
				</script>				
			<%
				response.sendRedirect(url);
			}
		}
		else{
		%>
			<script>
				alert('아이디가 존재하지 않습니다.');				
			</script>				
		<%
			response.sendRedirect(url);
		}
		
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		if(rs != null)try{ rs.close(); }catch(Exception ex){}
		if(pstmt != null)try{ pstmt.close(); }catch(Exception ex){}
		if(conn != null)try{ conn.close(); }catch(Exception ex){}
	}
			
	
	
%>
