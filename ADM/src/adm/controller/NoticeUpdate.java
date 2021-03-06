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
import adm.vo.NoticeVO;


@WebServlet("/NoticeUpdate.do")
public class NoticeUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//공지사항 수정
		request.setCharacterEncoding("utf-8");
		
		/*
		 * String title = request.getParameter("notice_title"); String content =
		 * request.getParameter("notice_content");
		 */
		int code = Integer.parseInt(request.getParameter("notice_code"));
		/*
		 * NoticeVO vo = new NoticeVO(); vo.setNotice_title(title);
		 * vo.setNotice_content(content);
		 */
		
		INoticeService service = NoticeServiceImpl.getService();
		
		NoticeVO vo = service.selectDetail(code);
		
		request.setAttribute("vo", vo);
		RequestDispatcher rd = request.getRequestDispatcher("/notice/notice_update.jsp");
		rd.forward(request, response);
		//response.sendRedirect("notice_update.jsp");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
