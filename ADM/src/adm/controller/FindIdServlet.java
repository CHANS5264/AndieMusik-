package adm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import adm.service.impl.MemberServiceImpl;
import adm.service.inter.IMemberService;
import adm.vo.MemberVO;

@WebServlet("/FindId.do")
public class FindIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String name = request.getParameter("mem_name");
		String mail = request.getParameter("mem_mail");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("mem_name", name);
		map.put("mem_mail", mail);
		
		IMemberService service = MemberServiceImpl.getInstance();
		
		String id = service.findId(map);
		
		String result = null;
		
		if(id == null) {
			result = "";
		}else {
			result = id;
		}
		Gson gson = new Gson();
		String jsonData = gson.toJson(result);
		
		PrintWriter out = response.getWriter();
			
		out.write(jsonData);
		
		out.flush();
		out.close();
		
//		RequestDispatcher disp = request.getRequestDispatcher("/member/findok.jsp");
//		disp.forward(request, response);;
//		
	}

}
