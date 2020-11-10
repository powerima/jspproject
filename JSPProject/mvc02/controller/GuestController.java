package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.GuestVo;
import service.*;

/**
 * Servlet implementation class GuestController
 */
@WebServlet("/GuestController")
public class GuestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GuestController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
		GuestService gs = new GuestServiceImpl();
		int pageNum = 1;
		
		if(request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		
		
		
		// 페이지 나누기에 필요한 내용들
		int pageSize = 10;
		int startRow = (pageNum - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		int pageBlock = 10;
		int count = gs.getCount();
		int pageCount = count/pageSize + (count % pageSize > 0 ? 1 : 0);		
		int startPage = 1;
		if(pageNum % pageBlock == 0 ) {
			startPage = (int)(pageNum/pageBlock-1)*pageBlock + 1;
		} else { 
			startPage = (int)(pageNum/pageBlock)*pageBlock +1; 
		}
		
		int endPage = startPage + pageBlock - 1;
		endPage = pageCount > endPage ? endPage : pageCount;

		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		// 페이지 나누기
		/*
		System.out.println("1. 페이지 사이즈: " + pageSize);
		System.out.println("2. 페이지 리스트 사이즈: " + pageBlock);
		System.out.println("3. 총 레코드 수: " + count);
		System.out.println("4. 총 페이지 수: " + pageCount);
		System.out.println("5. 현재 레코드: " + startRow);
		System.out.println("6. 현재 페이지: " + pageNum);
		System.out.println("7. 하단 가로 시작 페이지: " + startPage);
		System.out.println("8. 하단 가로 마지막 페이지: "+ endPage);
		*/
		
		
		// 검색에 필요한 내용들
		String ch1 = request.getParameter("ch1");
		String ch2 = request.getParameter("ch2");
		
		GuestVo g = new GuestVo();
		g.setCh1(ch1);
		g.setCh2(ch2);
		
		List<GuestVo> list = gs.selectAll(startRow, endRow, g);
		
		
		
		request.setAttribute("list", list);
		RequestDispatcher dispatcher =
				request.getRequestDispatcher("mvc02/guest_list_jstl.jsp");
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
