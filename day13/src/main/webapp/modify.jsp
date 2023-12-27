<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="${not empty sessionScope.user}">
<h2>안녕, ${sessionScope.user}!</h2>
<form action="logout-action.jsp" method="post">
<input type="submit" value="로그아웃">
</form>
</c:if>

<c:if test="${empty sessionScope.user}">
<h2> 로그인 하세요 </h2>
<a href="login.jsp">로그인페이지로 이동</a>
</c:if>

</body>
</html>
