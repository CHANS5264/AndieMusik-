package adm.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import adm.service.impl.ReviewServiceImpl;
import adm.service.inter.IReviewService;
import adm.vo.ReviewVO;

@WebServlet("/ReviewDetail.do")
public class ReviewDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int code =Integer.parseInt(request.getParameter("rev_code"));
		IReviewService service = ReviewServiceImpl.getInstance();
		String nm = request.getParameter("pbl_nm");
		
		int cnt = service.revCnt(code); 
		ReviewVO vo = service.selectDetail(code);
		
		
		HttpSession session = request.getSession();
		session.setAttribute("reviewDetail", vo);
		
		request.setAttribute("detail", vo);
		request.setAttribute("nm", nm);
		
		request.getRequestDispatcher("/review/review_detail.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
