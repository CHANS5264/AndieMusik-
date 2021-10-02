package adm.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import adm.service.impl.QnaServiceImpl;
import adm.service.inter.IQnaService;
import adm.vo.QnaVO;


@WebServlet("/QnaUpdate.do")
public class QnaUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		IQnaService service = QnaServiceImpl.getService();
		
		QnaVO vo = new QnaVO();
		
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		HttpSession session = request.getSession();
		
		QnaVO sessionvo = (QnaVO) session.getAttribute("qnaDetail");
		
		vo.setQna_code(sessionvo.getQna_code());
		
		int cnt = service.qnaUpdate(vo);
		
		request.setAttribute("vo", cnt);
		
		RequestDispatcher rd = request.getRequestDispatcher("/qna/qna_index.jsp");
		rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
