<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<c:set var="memberDAO" value="${MemberDAO.getInstance() }"/>

<%	request.setCharacterEncoding("UTF-8"); %>
<%	response.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유진이네 고깃집</title>

</head>
<body>

<header>

<h1><a href="${cpath }">유진이네 고깃집</a></h1>

<div style="text-align: center;">로그인 상태 : ${login.username } ❤</div>

<div class="sb">

<div><a href="${cpath}/join.jsp">회원가입</a></div>
<div><a href="${cpath }/login.jsp">로그인</a></div>
<div><a href="${cpath }/logout.jsp">로그아웃</a></div>
<div><a href="${cpath }/delete.jsp">탈퇴</a></div>
<div><a href="${cpath }/write.jsp">게시판</a></div>

</div>

</header>





</body>
</html>