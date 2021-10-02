package adm.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import adm.service.impl.PblServiceImple;
import adm.service.inter.IPblService;
import adm.vo.PblprfrVO;


@WebServlet("/selectTicketPblInfo.do")
public class selectTicketPblInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	private IPblService service = null;
    public selectTicketPblInfoServlet() {
    	service = PblServiceImple.getInstance();
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		

		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=utf-8");
		
		int code = Integer.parseInt(request.getParameter("code"));
		PblprfrVO vo =service.selectPerfDetail(code);
		
		Gson gson = new Gson();
		String jsonData = gson.toJson(vo);
		PrintWriter out = response.getWriter();
		
		out.write(jsonData);
		
		out.flush();
		out.close();
		
		
		
	}

}
