package adm.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import adm.vo.ReviewVO;
import adm.vo.ViewVO;

@WebServlet("/ReviewList.do")
public class ReviewListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		int fpage = 1;
		fpage = Integer.parseInt(request.getParameter("page")==null?"1":request.getParameter("page"));
		
		IReviewService service = ReviewServiceImpl.getInstance();
		//화면에 보여질 페이지 수
		int listPage = 10;
		
		//pasing에 보여질 목록 개수
		int listCnt = 2;
		
		//전체 글개수
		int count = service.countList();
		
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
		
		
		List<ReviewVO> list = service.reviewList(map);
		List<ReviewVO> pblNM = new ArrayList<>();
		
		for(int i = 0; i < list.size(); i++) {
			int code = list.get(i).getRev_code();
			
			ReviewVO vo = service.selectPblnm(code);
			pblNM.add(vo);
			
		}
		
		
		request.setAttribute("reList", list);
		request.setAttribute("pblnm", pblNM);
		request.setAttribute("sp", startPage);
		request.setAttribute("ep", endPage);
		request.setAttribute("tp", totalPage);
		
		request.getRequestDispatcher("/review/review_list.jsp").forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
