package adm.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import adm.service.impl.FboardServiceImpl;
import adm.service.inter.IFboardService;

@WebServlet("/ReplyDelete.do")
public class FboardReplyDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		int fboard_code = Integer.parseInt(request.getParameter("fboard_code"));
		int fans_code = Integer.parseInt(request.getParameter("fans_code"));
		
		IFboardService service = FboardServiceImpl.getService();
		
		int cnt = service.deleteReply(fans_code);
		
		response.sendRedirect(request.getContextPath() + "/FboardDetail.do?fboard_code=" + fboard_code);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
