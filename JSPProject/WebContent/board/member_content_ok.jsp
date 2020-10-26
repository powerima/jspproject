<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 성적 저장</title>
</head>
<body>
<%

	String saveFolder = "/file/";
	ServletContext context = getServletContext();
	String realFolder = context.getRealPath(saveFolder);
		
	int maxSize = 5*1024*1024;	//5m
	String encType="utf-8";
	
	MultipartRequest multi = new MultipartRequest(
			request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
	String sno = multi.getParameter("sno");	
	String sname = multi.getParameter("sname");
	String tel = multi.getParameter("tel");
	String email = multi.getParameter("email");
	String addr = multi.getParameter("addr");
	
	String filename = multi.getFilesystemName("file");	// 이름	
	File file = multi.getFile("file");	// 실제 파일

		

	out.print("학번: " + sno + "<br>");
	out.print("이름: " + sname + "<br>");	
	out.println("filename: " + filename + "<br>");
	out.println("file: " + file + "<br>");
	
	try {		
		if(filename != null ){	// 파일 업로드가 되었을 경우만 기존 파일을 삭제하고 새로 업로드한다.
			String sql;			
			
			sql = "select * from member where sno=?";
			pstmt = con.prepareStatement(sql);			
			pstmt.setString(1, sno);		
						
			rs = pstmt.executeQuery();	
			
			if(rs.next()){		
				String fileT = rs.getString("fileT");			
				File f = new File(realFolder + fileT);			
				f.delete();
			}
		
		
			
			// 회원 정보 수정
			sql = "update member set "
					+ " sname=?, tel=?, email=?, addr=?, fileT=? "
					+ " where sno=?";
	
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, sname);
			pstmt.setString(2, tel);
			pstmt.setString(3, email);
			pstmt.setString(4, addr);
			pstmt.setString(5, filename);
			pstmt.setString(6, sno);			
		
		}
		
		else{	
			String sql = "update member set "
					+ " sname=?, tel=?, email=?, addr=? "
					+ " where sno=?";

			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, sname);
			pstmt.setString(2, tel);
			pstmt.setString(3, email);
			pstmt.setString(4, addr);			
			pstmt.setString(5, sno);
		}
		
		pstmt.executeUpdate();

	} catch (Exception e) {
		out.print(e);
		e.printStackTrace();
		
	} finally {
		if(pstmt != null) try { pstmt.close(); }catch(Exception e){}
		if(con != null) try { con.close(); } catch(Exception e){}
		if(rs != null) try { rs.close(); } catch(Exception e){}
	}

	//response.sendRedirect("member_list.jsp");
	
%>
</body>
</html>
