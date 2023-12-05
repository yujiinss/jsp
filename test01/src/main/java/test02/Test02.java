package test02;

import java.io.IOException;// directive
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test02 extends HttpServlet {
	
	private static final long serialVersionUID=1L; //declaration
	/*객체를 직렬화해서 실행하기 위한*/
	
	@Override 
	// Server에서 실행될 프로그램의 service함수는 역할상 main함수와 같다 //script
	protected void service(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd a hh:mm:ss");
		String now = sdf.format(new Date());
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8"); //""+ ob +"" //expression
		
		PrintWriter pw = response.getWriter();
		
		String html="";
		html +="<!DOCTYPE html>";
		html += "<html lang=\"ko\">";
		html += "<head>";
		html += "<title>MyServlet</title>";
		html += " <meta charset=\"UTF-8\">";
		html += "</head>";
		html += "<body>";
		html += "<h1>My Servlet</h1>";
		html += "<hr>";
		html += "<h3>"+ now +"<h3>";
		html += "</body>";
		html += "</html>";

		pw.write(html);
		pw.flush();
		pw.close();
	}

}
