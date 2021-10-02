package adm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;


import adm.service.impl.TicketingServiceImpl;
import adm.service.inter.ITicketingService;
import adm.vo.AvdSeatVO;
import adm.vo.PblprfrVO;


@WebServlet("/selectTicketPbl.do")
public class selectTicketPblServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    private ITicketingService service = null;
	
    public selectTicketPblServlet() {
    	service = TicketingServiceImpl.getInstance();
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=utf-8");
		
		int code = Integer.parseInt(request.getParameter("code"));
		
		PblprfrVO vo = service.selectPbl(code);
		// 총좌석 잔여좌석 구하기
		int a = 0;
		int b = 0;
		int s = 0;
		int r = 0;
		List<AvdSeatVO> seatvo = service.selectSeat(code);
		
		
		
		for(int i = 0; i < seatvo.size(); i++) {
			AvdSeatVO list = seatvo.get(i);
			String priCode = list.getPricdoe();
			
			if(list.getAdccheck().equals("n")) {
				if(priCode.equals("A")) {
					a++;
				}else if(priCode.equals("B")) {
					b++;
				}else if(priCode.equals("R")) {
					r++;
				}else if(priCode.equals("S")) {
					s++;
				}
			}
		}
	
		Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("vo", vo);
		map.put("a", a);
		map.put("b", b);
		map.put("r", r);
		map.put("s", s);
		
		
		Gson gson = new Gson();
		
		String jsonData = gson.toJson(map);
		
		PrintWriter out = response.getWriter();
		
		out.write(jsonData);
		
		out.flush();
		out.close();
	}

}
