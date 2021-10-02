package adm.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import adm.service.impl.QnaServiceImpl;
import adm.service.inter.IQnaService;
import adm.vo.QnaVO;

/**
 * Servlet implementation class QnaUpdateServlet2
 */
@WebServlet("/QnaUpdate2.do")
public class QnaUpdateServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Q&A수정
		request.setCharacterEncoding("utf-8");
		
		int code = Integer.parseInt(request.getParameter("qna_code"));
		
		IQnaService service = QnaServiceImpl.getService();
		
		QnaVO vo = service.qnaDetail(code);
		
		request.setAttribute("vo", vo);
		
		RequestDispatcher rd = request.getRequestDispatcher("/qna/qna_update.jsp");
		rd.forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}















