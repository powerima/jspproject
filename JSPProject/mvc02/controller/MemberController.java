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
		
		request.setCharacterEncoding("utf-8");
		
		int custno = 0;
		if(request.getParameter("custno") != null) {
			custno = Integer.parseInt(request.getParameter("custno"));
		}
		
		String ch1 = request.getParameter("ch1");
		String ch2 = request.getParameter("ch2");
		String flag = request.getParameter("flag");
		String custname = request.getParameter("custname");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String joindate = request.getParameter("joindate");
		String grade = request.getParameter("grade");
		String city = request.getParameter("city");
		
		
		// select - member_list.jsp
		if(flag.equals("r")) {	
			MemberVo m = new MemberVo();
			
			ms = new MemberServiceImpl();
			
			m.setCh1(ch1);
			m.setCh2(ch2);
			
			List<MemberVo> list = (ArrayList<MemberVo>)ms.selectAll(m);
			request.setAttribute("list", list);
			
			RequestDispatcher dispatcher = 
							request.getRequestDispatcher("mvc02/member_list_jstl.jsp");
			dispatcher.forward(request, response);
			
			
		}
		
		
		// upload
		else if(flag.equals("u")) {		
			MemberVo m = new MemberVo();
			
			m.setCustno(custno);
			m.setCustname(custname);
			m.setPhone(phone);
			m.setAddress(address);
			m.setJoindate(joindate);
			m.setGrade(grade);
			m.setCity(city);
			
			ms.update(m);
			
			RequestDispatcher dispatcher
						= request.getRequestDispatcher("MemberController?flag=r");
			dispatcher.forward(request, response);		
		}
		
		
		// delete
		else if(flag.equals("d")) {	
			MemberVo m = new MemberVo();
			
			m.setCustno(custno);
			
			ms.delete(m);
			
			RequestDispatcher dispatcher
						= request.getRequestDispatcher("MemberController?flag=r");
			dispatcher.forward(request, response);
			
		} 
		
		// insert - member_form.jsp
		else if(flag.equals("i")) {	
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
			
		}
		
		// edit - member_edit.jsp
		else if(flag.equals("e")) {
			MemberVo m = ms.edit(custno);
			
			request.setAttribute("m", m);
			
			RequestDispatcher dispatcher
						= request.getRequestDispatcher("mvc02/member_edit.jsp");
			dispatcher.forward(request, response);		
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
