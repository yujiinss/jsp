<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.MemberDAO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<c:set var="dao" value="${MemberDAO.getInstance()}"/>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setCharacterEncoding("UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
table{
border: 2px solid black;
border-collapse: collapse;
margin: 20px auto;
}
td,th{
padding: 10px;
}
tr,td{
border: 2px solid black;
}

.header,section{
width: 900px;
margin: 0 auto;
background-color: white;
padding: 20px;
box-sizing: border-box;
}
h1,h2,h3,h4,h5,h6{
margin-top:0;
margin-bottom:0;
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
a{
text-decoration: none;
color: inherit
}
a:hover{
text-decoration: underline;
}
h1{
text-align:center;
}
nav>ul{
display: flex;
justify-content: space-between;
padding-left: 0;
list-style: none;
width: 500px;
margin: 20px auto;
}


</style>
</head>
<body>

<header class="frame">
 <h1><a href ="${cpath }">day14-memberCRUD</a></h1>
 <div id="loginInfo">
 	<c:if test="${not empty login }">
 		<h4 align="right">현재 접속자 : ${login.userName }</h4>
 	</c:if>
 </div>
 
 
 <nav>
 <ul>
 <li><a href="${cpath }/list.jsp">회원 목록</a></li>
 <li><a href="${cpath }/join.jsp">회원가입</a></li> 
 <c:if test="${empty login }">
 <li><a href="${cpath }/login.jsp">로그인</a></li>
 </c:if>
 
 <c:if test="${not empty login }">
 <li><a href="${cpath }/logout.jsp">로그아웃</a></li>
</c:if>
 </ul>
 </nav>
  
</header>

