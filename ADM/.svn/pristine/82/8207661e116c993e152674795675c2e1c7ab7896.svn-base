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
import javax.websocket.Session;

import adm.service.impl.PblServiceImple;
import adm.service.inter.IPblService;
import adm.vo.PblprfrVO;
import adm.vo.PrfplcVO;
import adm.vo.SeriesVO;
import adm.vo.TeamVO;


@WebServlet("/PblSelectboxServlet.do")
public class PblSelectboxServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private IPblService service = null;
    
    public PblSelectboxServlet() {
    	service = PblServiceImple.getInstance();
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		// 공연장 정보 가져오기
		List<PrfplcVO> prfList = service.prfList();
		// 공연팀 정보 가져오기
		List<TeamVO> teamList = service.teamList();
		// 시리즈 정보 가져오기
		List<SeriesVO> serList = service.seriesList();
		
		// request 객체에 set
		request.setAttribute("prfList", prfList);
		request.setAttribute("teamList", teamList );
		request.setAttribute("serList", serList);
		
		
		
		
		//insertPerformance.jsp에 전송
		RequestDispatcher rd = request.getRequestDispatcher("performance/insertPerformance.jsp");
		
		rd.forward(request, response);


	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
