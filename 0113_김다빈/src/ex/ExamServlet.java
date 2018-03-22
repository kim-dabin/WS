package ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ExamServlet extends HttpServlet{
	public ExamServlet() {
		System.out.println("생성");
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("호출");//get 방식으로 요청 전송
		
		//브라우저에 Content-Type 지정
		resp.setContentType("text/html;charset=UTF-8");
		
		//응답객체에서 출력용 객체 얻어옴
		PrintWriter out = resp.getWriter();
		
		out.println("<!DOCTYPE html>");
		out.println("<html lang='ko'>");
		out.println("<head>");
		out.println("<metha charset='UTF-8'>");
		out.println("<title>헬로 서블릿</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h2>안녕하세요?</h2>");
		out.println("<a href='index.jsp'>메인 페이지로</a>");
		out.println("</body>");
		out.println("</html>");
		out.close();
	}
}
