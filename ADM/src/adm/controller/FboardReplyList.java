package adm.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import adm.service.impl.FboardServiceImpl;
import adm.service.inter.IFboardService;
import adm.vo.FansVO;

/**
 * Servlet implementation class FboardReplySelect
 */
@WebServlet("/ReplyList.do")
public class FboardReplyList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//0. 요청시 전송데이터 받기 - bonum
		int bo = Integer.parseInt(request.getParameter("bo"));
		System.out.println("servlet bonum =" + bo);
	//1. service클래스 객체 얻기
		IFboardService service = FboardServiceImpl.getService();
	//2. service메소드 호출 - 결과값 받기
		List<FansVO> seq = service.replyList(bo);
	//3. 결과값 request에 저장
		request.setAttribute("seq", seq);
	//4. jsp로 포워딩
		request.getRequestDispatcher("fboard/FboardDetail.do").forward(request, response);
	}

	
	
	
	
	
	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
