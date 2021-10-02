package adm.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FboardImageViewServlet
 */
@WebServlet("/FboardImageView.do")
public class FboardImageViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String fileName = request.getParameter("fileName");
		System.out.println(fileName);
		String imagePath = "E:\\A_TeachingMaterial\\4.MiddleProject\\workspace\\ADM\\WebContent\\images\\fboard";
		String filePath = imagePath + File.separator + fileName;
		
		File file = new File(filePath);
		
		OutputStream out = null;
		FileInputStream fis = null;
		
		if(file.exists()) {
			try {
			// 출력용 스트림 => Response객체 이용
			out = response.getOutputStream();
			
			// 파일 입력용 스트림 객체 생성
			fis = new FileInputStream(file);
			byte[] buffer = new byte[1024];
			int len = -1;
			
			while((len = fis.read(buffer)) > 0) {
				out.write(buffer, 0, len);
			}
			out.flush();
		
			} catch(IOException e) {
				System.out.println("입출력 오류 : " + e.getMessage());
			} finally {
				if(fis != null) fis.close();
				if(out != null) out.close();
			}
		
		
		}
	
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
