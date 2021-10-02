package adm.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import adm.service.impl.FboardServiceImpl;
import adm.service.inter.IFboardService;

@WebServlet("/FboardDelete.do")
public class FboardDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int code = Integer.parseInt(request.getParameter("code"));
		IFboardService service = FboardServiceImpl.getService();
		
		int cnt = service.deleteFboard(code);
		
		RequestDispatcher rd = request.getRequestDispatcher("fboard/fboard_index.jsp");
			rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
