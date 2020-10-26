<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ include file="dbconn.jsp"%>
<%
	String pwd = request.getParameter("pwd");
	String sno = request.getParameter("sno");
	String sql = null;
	
	String saveFolder = "/file/";
	ServletContext context = getServletContext();
	String realFolder = context.getRealPath(saveFolder);
	
	try{
		if (pwd.equals("1234")) {

			// 파일 삭제
			sql = "select * from member where sno = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sno);
			rs = pstmt.executeQuery();
			rs.next();
			
			String fileT = rs.getString("fileT");			
			File f = new File(realFolder + fileT);			
			f.delete();
			
			
			// 데이터베이스에서 회원 정보 삭제
			sql = "delete from member where sno = ?";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, sno);
			pstmt.executeUpdate();


			if (pstmt != null) try { pstmt.close();	} catch (Exception e) {}
			if (con != null) try { con.close();} catch (Exception e) {}		

			response.sendRedirect("member_list.jsp");
		} 
		else {
			%>
			<script>
				alert("암호가 일치하지 않습니다.");
				location.href="member_pwd.jsp?sno=<%=sno%>";
			</script>
			<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if (pstmt != null) try { pstmt.close();	} catch (Exception e) {}
		if (con != null) try { con.close();} catch (Exception e) {}
		if (rs != null) try { rs.close();} catch (Exception e) {}
	}
%>
