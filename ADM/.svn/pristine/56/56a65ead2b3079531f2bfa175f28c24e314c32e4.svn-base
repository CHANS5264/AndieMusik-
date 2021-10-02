package adm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import com.google.gson.Gson;

import adm.service.impl.MemberServiceImpl;
import adm.service.inter.IMemberService;
import adm.vo.MemberVO;


@WebServlet("/UpdateMember.do")
public class UpdateMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	private IMemberService service = null;

	public UpdateMemberServlet() {
		service =MemberServiceImpl.getInstance();
		
		
	}

	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=utf-8");
		
		MemberVO vo = new MemberVO();
		
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		vo.setAdmin_check("N");
		
		int result = service.memberUpdate(vo);
		String res = null;
		if(result > 0) {
			res = "ok";
		}else {
			res = "no";
		}
		
		Gson gson = new Gson();
		String jsonData = gson.toJson(res);
		
		HttpSession session = request.getSession();
		
		session.setAttribute("id", vo.getMem_id());
		session.setAttribute("pass", vo.getMem_pass());
		session.setAttribute("admin", vo.getAdmin_check());
		session.setAttribute("memberInfo", vo);
		
		PrintWriter out = response.getWriter();
		
		out.write(jsonData);
		
		out.flush();
		out.close();
		
		
	}

}
















