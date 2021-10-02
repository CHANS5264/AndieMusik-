package adm.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import adm.service.impl.NoticeServiceImpl;
import adm.service.inter.INoticeService;
import adm.vo.NoticeVO;


@WebServlet("/NoticeDetail.do")
public class NoticeDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//공지사항 상세페이지 servlet
		request.setCharacterEncoding("utf-8");
		
		/*
		 * response.setCharacterEncoding("utf-8");
		 * response.setContentType("application/json; charset=utf-8");
		 */
		
		int code = Integer.parseInt(request.getParameter("notice_code"));
		
		INoticeService service = NoticeServiceImpl.getService();
		
		NoticeVO vo = service.selectDetail(code);
		
		HttpSession session = request.getSession();
		session.setAttribute("noticeDetail", vo);
		
		request.setAttribute("detail", vo);
		
		/*
		 * Gson gson = new Gson(); //JSON 라이브러리(Gson)객체 생성 String jsonData = null;
		 * 
		 * PrintWriter out = response.getWriter();
		 * 
		 * out.write(jsonData);
		 * 
		 * out.flush(); out.close();
		 */
		
		request.getRequestDispatcher("/notice/notice_detail.jsp").forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
