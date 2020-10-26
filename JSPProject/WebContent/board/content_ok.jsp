<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 성적 저장</title>
</head>
<body>
	<%


		String sno = request.getParameter("sno");
		String sname = request.getParameter("sname");
		String kor = request.getParameter("kor");
		String eng = request.getParameter("eng");
		String math = request.getParameter("math");
		String hist = request.getParameter("hist");

		out.print("학번: " + sno + "<br>");
		out.print("이름: " + sname + "<br>");
		out.print("국어: " + kor + "<br>");
		out.print("영어: " + eng + "<br>");
		out.print("수학: " + math + "<br>");
		out.print("역사: " + hist + "<br>");
	
		try {
			
			String sql = "update examtbl set "
						+ " sname=?, kor=?, eng=?, math=?, hist=? "
						+ " where sno=?";

			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, sname);
			pstmt.setString(2, kor);
			pstmt.setString(3, eng);
			pstmt.setString(4, math);
			pstmt.setString(5, hist);
			pstmt.setString(6, sno);

			pstmt.executeUpdate();

		} catch (Exception e) {
			out.print("에러가 발생하였습니다.");
			e.printStackTrace();
			
		} finally {
			if(pstmt != null) try { pstmt.close(); }catch(Exception e){}
			if(con != null) try { con.close(); } catch(Exception e){}
		}

		response.sendRedirect("list.jsp");
	%>
</body>
</html>
