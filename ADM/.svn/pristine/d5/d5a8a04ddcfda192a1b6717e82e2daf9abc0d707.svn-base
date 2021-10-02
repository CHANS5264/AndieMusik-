package adm.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import adm.service.impl.TicketingServiceImpl;
import adm.service.inter.ITicketingService;
import adm.vo.AdvantkVO;

/**
 * Servlet implementation class TIcketing
 */
@WebServlet("/TIcketing.do")
public class TIcketingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	private ITicketingService service = null;
	
    public TIcketingServlet() {
      service = TicketingServiceImpl.getInstance();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		

		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=utf-8");
		
		String[] seat = request.getParameterValues("seat[]");
		int code = Integer.parseInt(request.getParameter("code"));
		
		String id = "a001"; // 추후에 섹션값으로
		String check = "Y";
		
		AdvantkVO vo = null;
		
		int result = 0;
		
		for(int i =0 ;i < seat.length; i++) {
			vo = new AdvantkVO();
			vo.setAdv_check(check);
			vo.setMem_id(id);
			vo.setPbl_code(code);
			vo.setSeat_code(seat[i]);
			service.insertAdv(vo);
			result++;
		}
		
		Gson gson = new Gson();
		
		String jsonData = gson.toJson(result);
		
		PrintWriter out = response.getWriter();
		
		out.write(jsonData);
		
		out.flush();
		out.close();
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
