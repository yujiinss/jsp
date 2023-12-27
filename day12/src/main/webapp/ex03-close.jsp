<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	String makeCookie = request.getParameter("makeCookie");

	if(makeCookie != null){
		Cookie cookie = new Cookie("donotpopup", makeCookie);// 값이 뭐든 상관없음 하지만 빈 문자열은 X, null값으로 인식할 수 있음
		cookie.setMaxAge(180);
		response.addCookie(cookie);
	}
%>

<script>
window.close();
</script>

</body>
</html>