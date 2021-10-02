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

@WebServlet("/Qnas_Delete.do")
public class Qnas_DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		System.out.println(request.getParameter("qna_code"));
		int qna_code = Integer.parseInt(request.getParameter("qna_code"));
		int qnas_code = Integer.parseInt(request.getParameter("qnas_code"));
		
		IQnaService service = QnaServiceImpl.getService();
		int cnt = service.qnaReplyDelete(qnas_code);
		response.sendRedirect(request.getContextPath() + "/QnaDetail.do?qna_code=" + qna_code);
		
		/*
		 * RequestDispatcher rd = request.getRequestDispatcher("/notice_detail.jsp");
		 * rd.forward(request, response);
		 */
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
