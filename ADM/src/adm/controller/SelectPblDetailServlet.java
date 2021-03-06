package adm.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import adm.service.impl.PblServiceImple;
import adm.service.inter.IPblService;
import adm.vo.PblprfrVO;

// 공연정보 상세조회 서블릿
@WebServlet("/SelectPblDetail.do")
public class SelectPblDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private IPblService service = null;
	
    public SelectPblDetailServlet() {
    	service = PblServiceImple.getInstance();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// 공연코드 가져오기
		int code = Integer.parseInt(request.getParameter("code"));
		
		
		
		
		// db에서 정보 가져오기
		PblprfrVO vo = service.selectPerfDetail(code);
		
		request.setAttribute("detail", vo);
		
		HttpSession session = request.getSession();
		
		session.setAttribute("detailvo", vo);
		
		RequestDispatcher rd = request.getRequestDispatcher("/performance/performDetail.jsp");
		rd.forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
