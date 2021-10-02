package adm.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import adm.service.impl.QnaServiceImpl;
import adm.service.inter.IQnaService;
import adm.vo.QnasVO;

@WebServlet("/Qnas_update.do")
public class Qnas_updateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int qna_code = Integer.parseInt(request.getParameter("qna_code"));
		int qnas_code = Integer.parseInt(request.getParameter("qnas_code"));
		String cont = request.getParameter("qnas_content");
		
		QnasVO vo = new QnasVO();
		System.out.println("vo" + vo);
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		IQnaService service = QnaServiceImpl.getService();
		int cnt = service.qnaReplyUpdate(vo);
		System.out.println("cnt" + cnt);
		request.setAttribute("seq", cnt);
		
		response.sendRedirect(request.getContextPath() + "/QnaDetail.do?qna_code=" + qna_code + "&qnas_code=" + qnas_code);
		//response.sendRedirect("qna/qnas_result.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
