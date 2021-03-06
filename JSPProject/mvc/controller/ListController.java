/*
 * 	2020. 10. 30
 * 
 * 	mvc 패턴 
 * 
 * 	Servlet 으로 생성된 클래스
 * 
 *  WebContent - mvc - list.jsp
 * 	Java Resource - mvc 소스폴더 
 * 
 * 	목록 보기를 위한 컨트롤러
 * 
 */

package controller;

import java.io.IOException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ListDaoImpl;
import model.Member;

/**
 * Servlet implementation class ListController
 */
@WebServlet("/ListController")
public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("목록보기");
		
		ListDaoImpl dao = new ListDaoImpl();
		List<Member> list = dao.selectAll();
		
		request.setAttribute("list", list);
		
		RequestDispatcher dispatcher
					= request.getRequestDispatcher("mvc/list.jsp");
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
