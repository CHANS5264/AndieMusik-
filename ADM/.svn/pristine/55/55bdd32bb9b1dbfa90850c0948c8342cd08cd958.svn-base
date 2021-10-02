package adm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import adm.service.impl.TicketingServiceImpl;
import adm.service.inter.ITicketingService;
import adm.vo.PblprfrVO;


@WebServlet("/SelectPblNm.do")
public class SelectPblNmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	private ITicketingService service = null;
	
    public SelectPblNmServlet() {
        service = TicketingServiceImpl.getInstance();
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=utf-8");
		
		String date = request.getParameter("date");
		
		List<PblprfrVO> list = service.selectPblNm(date);
		
		Gson gson = new Gson();
		String jsonData = gson.toJson(list);
		
		PrintWriter out = response.getWriter();
		
		out.write(jsonData);
		
		out.flush();
		out.close();
	}

}















