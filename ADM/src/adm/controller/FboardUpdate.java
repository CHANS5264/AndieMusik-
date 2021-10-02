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
import adm.vo.FboardVO;

/**
 * Servlet implementation class FboardUpdate
 */
@WebServlet("/FboardUpdate.do")
public class FboardUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//게시판 수정
		request.setCharacterEncoding("utf-8");
		
		/*
		 * String title = request.getParameter("notice_title"); String content =
		 * request.getParameter("notice_content");
		 */
		int code = Integer.parseInt(request.getParameter("fboard_code"));
		/*
		 * NoticeVO vo = new NoticeVO(); vo.setNotice_title(title);
		 * vo.setNotice_content(content);
		 */
		
		IFboardService service = FboardServiceImpl.getService();
		
		FboardVO vo = service.selectDetail(code);
		
		request.setAttribute("vo", vo);
		RequestDispatcher rd = request.getRequestDispatcher("fboard/fboard_update.jsp");
		rd.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
