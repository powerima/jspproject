/*
 * 
 * 	2020. 11. 02
 * 
 * 	Controller class - servlet
 * 
 * 	Java Resource - mvc02
 * 	WebContent - mvc02
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

import dto.MemberVo;
import service.FormService;
import service.FormServiceImpl;

/**
 * Servlet implementation class FormController
 */
@WebServlet("/FormController")
public class FormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//	response.getWriter().append("Served at: ").append(request.getContextPath());
		
		FormService fs = new FormServiceImpl();
		int custno = Integer.parseInt(request.getParameter("custno"));
		
		String custname = request.getParameter("custname");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String joindate = request.getParameter("joindate");
		String grade = request.getParameter("grade");
		String city = request.getParameter("city");
		
		MemberVo m = new MemberVo();
		m.setCustno(custno);
		m.setCustname(custname);
		m.setPhone(phone);
		m.setAddress(address);
		m.setJoindate(joindate);
		m.setGrade(grade);
		m.setCity(city);
		
		fs.insert(m);
		
		RequestDispatcher dispatcher
			= request.getRequestDispatcher("MemberSelectController");
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
