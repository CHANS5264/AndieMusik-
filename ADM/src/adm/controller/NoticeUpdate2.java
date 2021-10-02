package adm.controller;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import adm.service.impl.NoticeServiceImpl;
import adm.service.inter.INoticeService;
import adm.vo.NoticeVO;

@WebServlet("/NoticeUpdate2.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 30,
maxRequestSize = 1024 * 1024 * 50)
public class NoticeUpdate2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 글 수정 servlet
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String uploadPath = "D:\\A_TeachingMaterial\\4.MiddleProject\\workspace\\ADM\\WebContent\\images\\notice";
		
		File fileUploadDir = new File(uploadPath);
		INoticeService service = NoticeServiceImpl.getService();
		
		if(!fileUploadDir.exists()) {
			fileUploadDir.mkdirs();
		}
		
		String fileName = null;
		
		NoticeVO vo = new NoticeVO();
		
		
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		
		for(Part part : request.getParts()) {
			fileName = extractFileName(part);
			
			if(!"".equals(fileName)) {
				try {
					part.write(uploadPath + File.separator + fileName);
				} catch (IOException e) {
					e.printStackTrace();
				}
				break;
			}
		}
		
		HttpSession session = request.getSession();
		
		NoticeVO sessionvo = (NoticeVO) session.getAttribute("noticeDetail");
		
		if(fileName.equals("")) {
			vo.setFile_name(sessionvo.getFile_name());
		}else {
			vo.setFile_name(fileName);
		}
		vo.setNotice_code(sessionvo.getNotice_code());
		
		int cnt = service.updateNotice(vo);
		
		request.setAttribute("vo", cnt);
		System.out.println(cnt);
		
		RequestDispatcher rd = request.getRequestDispatcher("/notice/notice_index.jsp");
		rd.forward(request, response);
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private String extractFileName(Part part) {
		String fileName = "";
		String disposition = part.getHeader("Content-Disposition");
		
		String[] items = disposition.split(";");
		
		for(String item : items) {
			if(item.trim().startsWith("filename")) {
				fileName = item.substring(item.indexOf("=") + 2, item.length() -1);
			}	
		}
		
		return fileName;
	}

}














