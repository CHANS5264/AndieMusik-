package adm.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import adm.service.impl.ReviewServiceImpl;
import adm.service.impl.ViewServiceImpl;
import adm.service.inter.IReviewService;
import adm.service.inter.IViewService;
import adm.vo.ViewVO;


@WebServlet("/ReviewinsertForm.do")
public class ReviewinsertFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	private IViewService service = null;
    public ReviewinsertFormServlet() {

    	service = ViewServiceImpl.getInstance();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = "a001";
//		HttpSession session = request.getSession();
//		String id = session.getAttribute("id");
		List<ViewVO> list = service.viewList(id);
		System.out.println(list);
		if(list.size() < 1) {
			RequestDispatcher rd = request.getRequestDispatcher("/review/noView.jsp");
			rd.forward(request, response);
		}else {
			request.setAttribute("list", list);
		
			RequestDispatcher rd = request.getRequestDispatcher("/review/review_insert.jsp");
			rd.forward(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
