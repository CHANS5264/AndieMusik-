package adm.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

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

@WebServlet("/QnaInsert.do")
public class QnaInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Q&A 글작성 servlet
		request.setCharacterEncoding("utf-8");
		
		QnaVO vo = new QnaVO();
		
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		HttpSession session = request.getSession();
		
		String id = (String) session.getAttribute("mem_id");
		
		vo.setMem_id(id);
		
		IQnaService service = QnaServiceImpl.getService();
		
		service.qnaInsert(vo);
		System.out.println("log");
		
//		request.getRequestDispatcher("/qna/qna_index.jsp").forward(request, response);
		response.sendRedirect("qna/qna_index.jsp");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
