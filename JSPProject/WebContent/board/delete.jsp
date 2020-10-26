<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp"%>
<%
	String pwd = request.getParameter("pwd");
	String sno = request.getParameter("sno");
	try{
		if (pwd.equals("1234")) {

			String sql = "delete from examtbl where sno = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, sno);
			pstmt.executeUpdate();


			if (pstmt != null) try { pstmt.close();	} catch (Exception e) {}
			if (con != null) try { con.close();} catch (Exception e) {}		

			response.sendRedirect("list.jsp");
		} 
		else {
			%>
			<script>
				alert("암호가 일치하지 않습니다.");
				location.href="pwd.jsp?sno=<%=sno%>";
			</script>
			<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if (pstmt != null) try { pstmt.close();	} catch (Exception e) {}
		if (con != null) try { con.close();} catch (Exception e) {}
	}
%>

