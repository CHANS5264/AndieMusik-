package adm.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import adm.service.impl.FboardServiceImpl;
import adm.service.inter.IFboardService;
import adm.vo.FboardVO;

@WebServlet("/FboardList.do")
public class FboardList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		int fpage = 1;
		fpage = Integer.parseInt(request.getParameter("page"));
		
		IFboardService service = FboardServiceImpl.getService();
		
		//화면에 보여질 페이지 수
		int listPage = 10;
		
		//pasing에 보여질 목록 개수
		int listCnt = 2;
		
		//전체 글개수
		int count = service.fboardList();
		
		//전체 페이지수 = 전체글개수 / listPage
		int totalPage = (int)Math.ceil((double)count/listPage);
		
		//화면에 보여지는 페이지 번호
		int startPage = ((fpage -1) / listCnt * listCnt) + 1;
		int endPage = startPage + listCnt -1;
		if(endPage > totalPage) endPage = totalPage;
		
		int start = (fpage - 1) * listPage + 1;
		int end = start + listPage -1;
		if(end > count) end = count;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		
//		System.out.println(map.get("end"));
		
		
		List<FboardVO> list = service.fboardAllList(map);
		
		request.setAttribute("fboList", list);
		request.setAttribute("sp", startPage);
		request.setAttribute("ep", endPage);
		request.setAttribute("tp", totalPage);
		
		request.getRequestDispatcher("/fboard/fboard_list.jsp").forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
