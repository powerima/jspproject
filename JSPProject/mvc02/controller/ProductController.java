package controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dto.ProductVo;
import service.*;

import java.util.*;

/**
 * Servlet implementation class ProductController
 */
@WebServlet("/ProductController")
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		
		ProductService ps;	
		String flag = request.getParameter("flag");
		String pcode = "";
		String nexturl = "";
		
		if(request.getParameter("pcode") != null) {
			pcode = request.getParameter("pcode");
		}
		
		
		
		
		
		// insert - product_form.jsp
		if(flag.equals("pi")) {
		
			MultipartRequest multi = null;
			ps = new ProductServiceImpl();
			
			String realFolder = "";	// 웹어플리케이션상 절대 경로
			String saveFolder = "file";	
			String encType = "utf-8";	// 엔코딩타입
			int maxSize = 5*1024*1024;	//5Mb
			
	
			ServletContext context= getServletContext();
			realFolder = context.getRealPath(saveFolder);	
			
			// 전송을 담당할 콤포넌트를 생성하고 파일을 전송한다.
			// 전송할 파일명을 가지고 있는 객체, 서버상의 절대경로, 최대 업로드될 파일크기, 문자코드, 기본보안 적용
			multi = new MultipartRequest(request, 
					realFolder, maxSize, encType, new DefaultFileRenamePolicy());
			
			pcode = multi.getParameter("pcode");
			String pname = multi.getParameter("pname");
			String pimg = multi.getFilesystemName("pimg");
			String petc = multi.getParameter("petc");
			String pdate = multi.getParameter("pdate");
			
			ProductVo p = new ProductVo();
			
			p.setPcode(pcode);
			p.setPname(pname);
			p.setPimg(pimg);
			p.setPetc(petc);
			p.setPdate(pdate);
			
			ps.productInsert(p);
			
			nexturl = "ProductController?flag=ps";

		}
		
		// select count
		else if(flag.equals("pc")) {

			
			nexturl = "ProductController?flag=ps";
			
		}
		
		// delete
		else if(flag.equals("pd")) {
			ps = new ProductServiceImpl();
			ProductVo p;
			
			// 파일 삭제
			String saveFolder = "file/";			
	
			ServletContext context= getServletContext();
			String realFolder = context.getRealPath(saveFolder);
			
			p = ps.productSelect(pcode);
			String pimg = p.getPimg();
			
			if(pimg != null) {
				new File(realFolder + pimg).delete();
			}
			
			
			// 데이터 베이스에서 상품 정보 삭제
			ps = new ProductServiceImpl();
			p = new ProductVo();
			p.setPcode(pcode);
			ps.productDelete(p);
			
			nexturl = "ProductController?flag=ps";
			
		}
		
		
		// select - product_list_jstl.jsp
		else if(flag.equals("ps")) {
			
			// 레코드 수 읽어오기
			int count;			
			ps = new ProductServiceImpl();
			count = ps.productCount();
			
			
			// 전체 목록 불러오기
			ps = new ProductServiceImpl();			
			List<ProductVo> list = ps.productSelectAll();
			
			request.setAttribute("count", count);
			request.setAttribute("list", list);
			
			nexturl = "mvc02/product_list_jstl.jsp";
		}
		
		RequestDispatcher dispatcher =
				request.getRequestDispatcher(nexturl);
		dispatcher.forward(request, response);
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
