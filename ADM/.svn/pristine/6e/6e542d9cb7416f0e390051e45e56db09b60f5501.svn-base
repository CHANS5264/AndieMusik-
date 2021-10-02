package adm.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.BeanUtilsBean;

import adm.service.impl.QnaServiceImpl;
import adm.service.inter.IQnaService;
import adm.vo.QnasVO;

@WebServlet("/QnasInsert.do")
public class Qnas_InsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int code = Integer.parseInt(request.getParameter("qna_code"));
		
		QnasVO vo = new QnasVO();
		
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		vo.setAdmin_id("admin_5264");
		vo.setQna_code(code);
		
		IQnaService service = QnaServiceImpl.getService();
		
		int seq = service.qnaReplyInsert(vo);
		System.out.println(seq);
		
		request.setAttribute("seq", seq);
		
		//request.getRequestDispatcher("/QnaDetail.do").forward(request, response);
		response.sendRedirect(request.getContextPath() + "/QnaDetail.do?qna_code=" + code);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
