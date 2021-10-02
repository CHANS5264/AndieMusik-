package adm.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import adm.service.impl.QnaServiceImpl;
import adm.service.inter.IQnaService;
import adm.vo.QnasVO;


@WebServlet("/QnasList.do")
public class Qnas_ListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int renum = Integer.parseInt(request.getParameter("renum"));
		
		IQnaService service = QnaServiceImpl.getService();
		
		List<QnasVO> list = service.qnaReplyList(renum);
		
		request.setAttribute("reply", list);
		
		request.getRequestDispatcher("qna/qna_detail.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
