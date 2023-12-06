<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "ex03.UpdownGame" %>

<%!
UpdownGame game = new UpdownGame();
%>
<% // service()
   // 웹 프로그램으로써 수행해야 할 전체적인 로직만 나태내고 있다
   // 상세한 기능의 내용은 game 객체 내부에 메서드로 존재한다
if(request.getParameter("reset")!=null){
	game.reset();
	response.sendRedirect("ex03-form.jsp?msg="); // msg는 빈문자열. 그러면 null이 출력 되지 않음
	return;
	//이후 코드를 수행하지 않는다
}

String user = request.getParameter("user");
String msg = game.handle(user);

String location ="ex03-form.jsp?msg="+ URLEncoder.encode(msg, "UTF-8");

response.sendRedirect(location);
%>