<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h3>로그아웃하기</h3>

<%
	session.invalidate();	
	response.sendRedirect(request.getContextPath());

%>
</body>
</html>