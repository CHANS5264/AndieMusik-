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

import com.google.gson.Gson;

import adm.dao.inter.ITicketingDao;
import adm.service.impl.TicketingServiceImpl;
import adm.service.inter.ITicketingService;
import adm.vo.ReserveVO;


@WebServlet("/SelectReserve.do")
public class SelectReserveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   private ITicketingService service = null;
   
    public SelectReserveServlet() {
    	service = TicketingServiceImpl.getInstance();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		

		
		HttpSession session = request.getSession();
		
		String id = (String) session.getAttribute("id");
		
		System.out.println(id);
		List<ReserveVO> list = service.selectReserv(id);
		
		request.setAttribute("list", list);
	
		RequestDispatcher rd= request.getRequestDispatcher("/mypage/advState.jsp");
		rd.forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}















