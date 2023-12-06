<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>업다운 게임 입력 / 출력</h1>
<hr>

<!-- button태그는 form 안에서 submit의 역할을 함 -->
<form action="ex03-action.jsp">
	<input type="number" name="user">
	<input type="submit">
	<!-- <button>제출<button> -->
	<a href="ex03-action.jsp?reset=true">다시</a>
</form>

<h3>출력할 메시지 공간</h3>
<%=request.getParameter("msg") %>
</body>
</html>

