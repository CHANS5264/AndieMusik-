package adm.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import adm.service.impl.ReviewServiceImpl;
import adm.service.inter.IReviewService;
import adm.vo.ReviewVO;

@WebServlet("/ReviewUpdate.do")
public class ReviewUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//후기 게시글 수정
		request.setCharacterEncoding("utf-8");
		
		int code = Integer.parseInt(request.getParameter("rev_code"));
		String content = request.getParameter("rev_cont");
		IReviewService service = ReviewServiceImpl.getInstance();
		
		ReviewVO vo = new ReviewVO();
		
		/* vo = service.updateReview(code); */
		
		request.setAttribute("vo", vo);
		RequestDispatcher rd = request.getRequestDispatcher("/review/review_update.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
