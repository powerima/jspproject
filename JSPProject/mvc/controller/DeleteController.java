/*
 * 	2020. 10. 30
 * 
 * 	mvc 패턴 
 * 
 * 	Servlet 으로 생성된 클래스
 * 
 *  WebContent - mvc 폴더
 * 	Java Resource - mvc 소스폴더 
 * 
 */

package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DeleteDaoImpl;
import model.Member;

/**
 * Servlet implementation class DeleteController
 */
@WebServlet("/DeleteController")
public class DeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		String id = request.getParameter("id");
		Member m = new Member();
		m.setId(id);
		
		System.out.println("레코드 삭제");
		DeleteDaoImpl dao = new DeleteDaoImpl();
		dao.delete(m);
		
		RequestDispatcher dispatcher
				= request.getRequestDispatcher("ListELController");
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
