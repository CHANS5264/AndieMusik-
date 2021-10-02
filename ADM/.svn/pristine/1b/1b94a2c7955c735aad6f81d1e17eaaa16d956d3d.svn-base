package adm.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import adm.service.impl.QnaServiceImpl;
import adm.service.inter.IQnaService;
import adm.vo.QnaVO;
import adm.vo.QnasVO;

@WebServlet("/QnaDetail.do")
public class QnaDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
//servlet.do?id=id&pass=d
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int code = Integer.parseInt(request.getParameter("qna_code"));
		IQnaService service = QnaServiceImpl.getService();
		
		int cnt = service.qnaCnt(code);
		QnaVO qnavo = service.qnaDetail(code);
		List<QnasVO> qnasVo = service.qnaReplyList(code);
		HttpSession session = request.getSession();
		session.setAttribute("qnaDetail", qnavo);
		
		
		request.setAttribute("detail", qnavo);
		request.setAttribute("reply", qnasVo);
		
		request.getRequestDispatcher("/qna/qna_detail.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
