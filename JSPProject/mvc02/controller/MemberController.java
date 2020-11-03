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
import service.MemberService;
import service.MemberServiceImpl;

/**
 * Servlet implementation class MemberController
 */
@WebServlet("/MemberController")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		MemberService ms = new MemberServiceImpl();
		
		String flag = request.getParameter("flag");
		
		int custno = Integer.parseInt(request.getParameter("custno"));
		String custname = request.getParameter("custname");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String joindate = request.getParameter("joindate");
		String grade = request.getParameter("grade");
		String city = request.getParameter("city");
		
		
		
		if(flag.equals("r")) {	// select
			request.setCharacterEncoding("utf-8");
			
			String ch1 = request.getParameter("ch1");
			String ch2 = request.getParameter("ch2");
							
			ms = new MemberServiceImpl();
			MemberVo m = new MemberVo();
			m.setCh1(ch1);
			m.setCh2(ch2);
			
			List<MemberVo> list = (ArrayList<MemberVo>)ms.selectAll(m);
			request.setAttribute("list", list);
			
			RequestDispatcher dispatcher = 
							request.getRequestDispatcher("mvc02/member_list_jstl.jsp");
			dispatcher.forward(request, response);
			
			
		} else if(flag.equals("u")) {	// upload	
			
		} else if(flag.equals("d")) {	// delete
			
		} else if(flag.equals("i")) {	// insert
			MemberVo m = new MemberVo();
			
			m.setCustno(custno);
			m.setCustname(custname);
			m.setPhone(phone);
			m.setAddress(address);
			m.setJoindate(joindate);
			m.setGrade(grade);
			m.setCity(city);
			ms.insert(m);
			
			RequestDispatcher dispatcher 
						= request.getRequestDispatcher("MemberController?flag=r");
			dispatcher.forward(request, response);		
			
		} else if(flag.equals("e")) {
			
		}
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
