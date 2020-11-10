package t1110_controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.T1110_StudentVo;
import service.T1110_StudentServiceImpl;

/**
 * Servlet implementation class T1110_StudentController
 */
@WebServlet("/T1110_StudentController")
public class T1110_StudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public T1110_StudentController() {
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
		
		String flag = request.getParameter("flag");
		String nextUrl = "";
		T1110_StudentServiceImpl ts = new T1110_StudentServiceImpl();
		
		
		// sno 얻기 - form.jsp 로 연결
		if (flag.equals("f")) {			
			int sno = ts.getSno();
			request.setAttribute("sno", sno);
			
			nextUrl = "t1110/form.jsp";
		} 
		
		// select - 학생 리스트 얻기 student_list_jstl.jsp 로 연결
		else if(flag.equals("s")) {
			List<T1110_StudentVo> list;
			
			list = ts.selectAll();
			request.setAttribute("list", list);
			
			nextUrl = "t1110/student_list_jstl.jsp";
		}
		
		// insert - 학생 정보 등록
		else if(flag.equals("i")) {
			String sname = request.getParameter("sname");
			String deptname = request.getParameter("deptname");
			int eng = Integer.parseInt(request.getParameter("eng"));
			int math = Integer.parseInt(request.getParameter("math"));
			
			T1110_StudentVo s = new T1110_StudentVo();
			s.setSname(sname);
			s.setDeptname(deptname);
			s.setEng(eng);
			s.setMath(math);
			
			ts.insert(s);
			
			nextUrl = "T1110_StudentController?flag=s";
		}
		
		RequestDispatcher dispatcher =
				request.getRequestDispatcher(nextUrl);
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
