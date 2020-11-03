package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MemberVo;
import service.*;

/**
 * Servlet implementation class MemberSelectController
 */
@WebServlet("/MemberSelectController")
public class MemberSelectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberSelectController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		
		request.setCharacterEncoding("utf-8");
		
		String ch1 = request.getParameter("ch1");
		String ch2 = request.getParameter("ch2");
						
		MemberService ms = new MemberServiceImpl();
		MemberVo m = new MemberVo();
		m.setCh1(ch1);
		m.setCh2(ch2);
		
		List<MemberVo> list = (ArrayList<MemberVo>)ms.selectAll(m);
		request.setAttribute("list", list);
		
		RequestDispatcher dispatcher = 
						request.getRequestDispatcher("mvc02/member_list_jstl.jsp");
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
