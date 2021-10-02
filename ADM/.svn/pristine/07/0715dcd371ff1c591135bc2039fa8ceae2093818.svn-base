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

@WebServlet("/ReviewDelete.do")
public class ReviewDeleteSerlvet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int code = Integer.parseInt(request.getParameter("code"));
		IReviewService service = ReviewServiceImpl.getInstance();
		
		int cnt = service.deleteReview(code);
		
		RequestDispatcher rd = request.getRequestDispatcher("review/review_start.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
