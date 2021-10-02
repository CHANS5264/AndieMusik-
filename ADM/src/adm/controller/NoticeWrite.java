package adm.controller;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

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


@WebServlet("/NoticeWrite.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 30,
maxRequestSize = 1024 * 1024 * 50)
public class NoticeWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//공지사항 글 작성 servlet
		request.setCharacterEncoding("utf-8");
		
		String uploadPath = "D:\\A_TeachingMaterial\\4.MiddleProject\\workspace\\ADM\\WebContent\\images\\notice";
		
		File fileUploadDir = new File(uploadPath);
		
		// 저장될 폴더가 없으면 생성
		if(!fileUploadDir.exists()) {
			fileUploadDir.mkdirs();
		}
		
		String fileName = null;
		NoticeVO vo = new NoticeVO();
		
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		for(Part part : request.getParts()) {
			fileName = extractFileName(part);
			// 파일명이 공백이면 파일이 아닌 일반 파라미터
			if(!"".equals(fileName)) {
				try {
					part.write(uploadPath + File.separator + fileName);
				} catch (IOException e) {
					e.printStackTrace();
				}
				break;
			}
		}
		
		/*
		 * HttpSession session = request.getSession();
		 * 
		 * String admin = (String)session.getAttribute("mem_id");
		 */
		vo.setAdmin_id("admin");
		//System.out.println(fileName);
		vo.setFile_name(fileName);
		
		INoticeService service = NoticeServiceImpl.getService();
		
		service.insertNotice(vo);
		
		request.getRequestDispatcher("/notice/notice_index.jsp").forward(request, response);
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
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
