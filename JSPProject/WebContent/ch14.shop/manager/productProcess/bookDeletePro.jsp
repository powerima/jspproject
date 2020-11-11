<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="ch14.bookshop.master.ShopBookDBBean" %>

<% request.setCharacterEncoding("utf-8"); %>

<%
	ShopBookDBBean bookProcess = ShopBookDBBean.getInstance();	
	int book_id = Integer.parseInt(request.getParameter("book_id"));	
	String book_kind = request.getParameter("book_kind");	
	
	String realFolder = "";	// 웹 어플리케이션상의 절대 경로
	String filename = "";
	
	String saveFolder ="imageFile/";	// 파일이 업로드되는 폴더
	String encType = "utf-8";	// 엔코딩 타입
	int maxSize = 2*1024*1024;	// 최대 업로드될 파일 크기 2mb
	
	// 현재 jsp 페이지의 웹 어플리케이션상의 절대 경로를 구한다.
	ServletContext context = getServletContext();
	realFolder = context.getRealPath(saveFolder);
	// 저장된 파일 삭제
	filename = bookProcess.getBook(book_id).getBook_image();
	if(filename != null){
		File f = new File(realFolder + filename);
		f.delete();
	}

	
	// db 에서 책 정보 삭제
	bookProcess.deleteBook(book_id);
	
	response.sendRedirect("bookList.jsp?book_kind=" + book_kind);
	
%>