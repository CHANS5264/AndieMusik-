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


@WebServlet("/noticeImageView.do")
public class noticeImageViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String fileName = request.getParameter("fileName");
		System.out.println(fileName);
		String imagePath = "D:\\A_TeachingMaterial\\4.MiddleProject\\workspace\\ADM\\WebContent\\images\\notice";
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
				
				// byte 배열을 이용해서 파일 내용을 읽어와 출력용 스트림 객체로 출력
				while((len = fis.read(buffer)) > 0) {
					out.write(buffer, 0, len);
				}
				out.flush();
				
			} catch (IOException e) {
				System.out.println("입출력 오류 : " + e.getMessage());
			}finally {
				if(fis != null) fis.close();
				if(out != null) out.close();
			}
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

















