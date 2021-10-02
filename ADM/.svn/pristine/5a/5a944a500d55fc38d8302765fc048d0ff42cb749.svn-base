package adm.controller;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import adm.service.impl.MemberServiceImpl;
import adm.service.inter.IMemberService;

@WebServlet("/MemberController.do")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String mem_id = request.getParameter("memId");
		
		IMemberService service = MemberServiceImpl.getInstance();
		
		String id = service.idCheck(mem_id);
		
		request.setAttribute("memId", id);
		
		RequestDispatcher disp = request.getRequestDispatcher("member/idCheck.jsp");
		disp.forward(request, response);
		
		doGet(request, response);
	}

}
