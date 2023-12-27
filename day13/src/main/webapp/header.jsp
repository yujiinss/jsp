<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.MemberDAO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<c:set var="dao" value="${MemberDAO.getInstance()}"/>
<% request.setCharacterEncoding("UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
table{
border: 2px solid black;
border-collapse: collapse;
}
tr,td{
border: 2px solid black;
}

body{
background-color: #eee;
margin: 0;
padding: 0;
}
ul>li{
list-style : none;
text-decoration : none;
}
ul>li>a{
color: black;
}
.sb{
display: flex;
justify-content: space-between;
}

</style>
</head>
<body>


<header>
 <ul class= "sb">
 <li><a href="list.jsp">회원 목록</a></li>
 <li><a href="login.jsp">로그인</a></li>
 <li><a href="logout.jsp">로그아웃</a></li>
 <li><a href="join.jsp">회원가입</a></li>
 </ul>
  
</header>

