package adm.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import adm.service.impl.NoticeServiceImpl;
import adm.service.inter.INoticeService;

/**
 * Servlet implementation class NoticeDelete
 */
@WebServlet("/NoticeDelete.do")
public class NoticeDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int code = Integer.parseInt(request.getParameter("code"));
		INoticeService service = NoticeServiceImpl.getService();
		
		int cnt = service.deleteNotice(code);
		
		RequestDispatcher rd = request.getRequestDispatcher("/notice/notice_index.jsp");
		rd.forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
