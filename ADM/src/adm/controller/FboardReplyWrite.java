package adm.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import adm.service.impl.FboardServiceImpl;
import adm.service.inter.IFboardService;
import adm.vo.FansVO;
import adm.vo.FboardVO;

@WebServlet("/FboardReplyWrite.do")
public class FboardReplyWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		
		System.out.println(request.getParameter("code"));
		int code = Integer.parseInt(request.getParameter("code")); 
		String con = request.getParameter("con");
		
		FansVO vo = new FansVO();
		
		System.out.println(code);
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		vo.setMem_id("a001");	//세션넣어야함
		vo.setFboard_code(code);
		vo.setFans_content(con);
		
		IFboardService service = FboardServiceImpl.getService();

		service.insertReply(vo);

		
//		request.setAttribute("seq", seq);
		

		response.sendRedirect(request.getContextPath() + "/FboardDetail.do?fboard_code=" + code);
//		response.sendRedirect(request.getContextPath() + "/FboardDetail.do?fboard_code=" + code + );
		
	}

	   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		      doGet(request, response);
		   }

}
