<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<%
	String saveFolder = "/file/";
	ServletContext context = getServletContext();
	String realFolder = context.getRealPath(saveFolder);
	
	out.print("realFolder---> " + realFolder);
	
	int maxSize = 5*1024*1024;	//5m
	String encType="utf-8";
	MultipartRequest multi = new MultipartRequest(
			request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
	String sno = multi.getParameter("sno");
	String sname = multi.getParameter("sname");
	String tel = multi.getParameter("tel");
	String email = multi.getParameter("email");
	String post = multi.getParameter("post");
	String addr1 = multi.getParameter("addr1");
	String addr2 = multi.getParameter("addr2");
	String addr = addr1 + " " + addr2;
	
	
	String filename = multi.getFilesystemName("file");	// 이름
	File file = multi.getFile("file");	// 실제 파일
%>

sno: <%=sno %><br>
sname: <%=sname %><br>
filename: <%=filename %><br>
file: <%=file%><br>

addr: <%=addr %><br>
addr1: <%=addr1 %><br>
addr2: <%=addr2 %><br>
<%
	try {
			
		String sql = "insert into member(idx, sno, sname, tel, email, addr, fileT)" 
			+ " values(s_member.nextval,?,?,?,?,?,?)";

		pstmt = con.prepareStatement(sql);

		pstmt.setString(1, sno);
		pstmt.setString(2, sname);
		pstmt.setString(3, tel);
		pstmt.setString(4, email);
		pstmt.setString(5, addr);
		pstmt.setString(6, filename);

		pstmt.executeUpdate();

	} catch (Exception e) {
		out.print("에러가 발생하였습니다.");
		e.printStackTrace();
		
	} finally {
		if(pstmt != null) try { pstmt.close(); }catch(Exception e){}
		if(con != null) try { con.close(); } catch(Exception e){}
	}

	response.sendRedirect("member_list.jsp");
%>