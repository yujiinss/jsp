<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<c:set var="memberDAO" value="${MemberDAO.getInstance() }"/>
<c:set var="boardDAO" value="${BoardDAO.getInstance() }"/>
<c:set var="replyDAO" value="${ReplyDAO.getInstance() }"/>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
a{
color:black;
text-decoration: none;
}
ul>li{
list-style: none;
}
</style>
</head>
<body>

<header>
<div>${selectOne.userid }</div>
<div style="font-size: 50px; text-align: center; margin: 50px 0; font-weight:bold;">
<a href="${cpath }">YUJIINS-WORLD</a>
</div>

</header>

<nav>
<ul style="display: flex; justify-content: space-between;">
<li><a href="${cpath }/login.jsp">로그인</a></li>
<li><a href="${cpath }/logout.jsp">로그아웃</a></li>
<li><a href="${cpath }/join.jsp">회원가입</a></li>
<li><a href="${cpath }/member-delete.jsp">회원탈퇴</a></li>
<li><a href="${cpath }/board.jsp">게시판</a></li>
</ul>
</nav>




</body>
</html>