<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
<%@ include file="dbconn.jsp" %>

<%
	MultipartRequest multi = null;
	
	String realFolder = "";	// 웹어플리케이션상 절대 경로
	String saveFolder = "shop/file";	
	String encType = "utf-8";	// 엔코딩타입
	int maxSize = 5*1024*1024;	//5Mb
	
	ServletContext context= getServletContext();
	realFolder = context.getRealPath(saveFolder);	

	out.println("the realpath is : " + realFolder + "<br>");
	
	try{
		// 전송을 담당할 콤포넌트를 생성하고 파일을 전송한다.
		// 전송할 파일명을 가지고 있는 객체, 서버상의 절대경로, 최대 업로드될 파일크기, 문자코드, 기본보안 적용
		multi = new MultipartRequest(request, 
				realFolder, maxSize, encType, new DefaultFileRenamePolicy());
		
		String pcode = multi.getParameter("pcode");
		String pname = multi.getParameter("pname");
		String pimg = multi.getFilesystemName("pimg");
		String petc = multi.getParameter("petc");
		String pdate = multi.getParameter("pdate");

		out.print(pcode + "<br>");
		out.print(pname + "<br>");
		out.print(pimg + "<br>");
		out.print(petc + "<br>");
		out.print(pdate + "<br>");
		
		
		sql = "insert into product (pcode, pname, pimg, petc, pdate) " +
			" values(?,?,?,?,?)";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pcode);
		pstmt.setString(2, pname);
		pstmt.setString(3, pimg);
		pstmt.setString(4, petc);
		pstmt.setString(5, pdate);
		pstmt.executeUpdate();
			
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		if(conn != null) try{ conn.close(); }catch(Exception ex){}
		if(pstmt != null) try{ conn.close(); }catch(Exception ex){}
	}
	
	response.sendRedirect("product_list.jsp");
%>
