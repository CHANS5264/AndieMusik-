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

@WebServlet("/ReplyUpdate.do")
public class FboardReplyUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int fboard_code = Integer.parseInt(request.getParameter("fboard_code"));
		System.out.println(request.getParameter("fans_code"));
		int fans_code = Integer.parseInt(request.getParameter("fans_code"));
		String cont = request.getParameter("fans_content");
		
		FansVO vo = new FansVO();
		
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		IFboardService service = FboardServiceImpl.getService();
		
		int cnt = service.updateReply(vo);
		request.setAttribute("seq", cnt);
		
		response.sendRedirect(request.getContextPath() + "/FboardDetail.do?fboard_code=" + fboard_code + "&fans_code=" + fans_code);
		
		
		
		
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
