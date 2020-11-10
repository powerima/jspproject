<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.io.*" %>
<%@ include file="dbconn.jsp" %>
<%
	MultipartRequest multi = null;
	
	String realFolder = "";	// 웹어플맄이션상 절대 경로
	String saveFolder = "file/";
	String encType = "utf-8";	// 엔코딩 타입
	int maxSize = 5*1024*1024; // 5Mb

	ServletContext context = getServletContext();
	realFolder = context.getRealPath(saveFolder);
	
	try{
		multi = new MultipartRequest(request, realFolder,
				maxSize, encType, new DefaultFileRenamePolicy());
		
		String pcode = multi.getParameter("pcode");
		String pname = multi.getParameter("pname");
		String pdate = multi.getParameter("pdate");
		String petc = multi.getParameter("petc");
		String pimg = multi.getFilesystemName("pimg");
		
		
		// 업로드된 파일이 있는 경우만
		if(pimg != null){						
			// 이전 파일 삭제
			sql = "select * from product where pcode = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pcode);
			
			rs = pstmt.executeQuery();
			rs.next();
			
			// 파일이 존재 하는 경우 삭제
			String prePimg = rs.getString("pimg");
			if(prePimg != null){
				File f = new File(realFolder + prePimg);
				f.delete();
			}
			// 데이터 베이스 수정
			sql = "update product set pname = ?, pdate = ?," +
				" petc = ?, pimg = ? where pcode = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pname);
			pstmt.setString(2, pdate);
			pstmt.setString(3, petc);
			pstmt.setString(4, pimg);
			pstmt.setString(5, pcode);
			
			pstmt.executeUpdate();		
		}
		
		// 데이터 베이스 수정 - 파일 업로가 안된겅우
		sql = "update product set pname = ?, pdate = ?," +
			" petc = ? where pcode = ?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pname);
		pstmt.setString(2, pdate);
		pstmt.setString(3, petc);				
		pstmt.setString(4, pcode);
		
		pstmt.executeUpdate();		
		
		
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		if(conn != null) try{ conn.close(); }catch(Exception ex){}
		if(pstmt != null) try{ pstmt.close(); }catch(Exception ex){}
		if(rs != null) try{ rs.close(); }catch(Exception ex){}
	}
	
	response.sendRedirect("product_list.jsp");

%>
