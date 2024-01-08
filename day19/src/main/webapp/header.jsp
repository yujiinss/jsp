<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.*, board2.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<c:set var="memberDAO" value="${MemberDAO.getInstance() }"/>
<c:set var="boardDAO" value="${BoardDAO.getInstance() }"/>
<c:set var="fileUtil" value="${FileUtil.getInstance() }"/>

<%	request.setCharacterEncoding("UTF-8"); %>
<%	response.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day19-board</title>
<style>

a{
color: inherit;
text-decoration: none;
font-sixe: 50px;
}
a:hover {
text-decoration: underline;
}
text#boardList a{
display : block;
width: 100%;
}
table#boardList a:hover{
text-decoration: none;
}

table#boardList{
border-collapse: collapse;
border: 2px solid rgb(247, 195, 204);
margin: 20px auto;
width: 900px;
}
table#boardList > thead{
background-color: rgb(247, 195, 204);
color: white;
}
table#boardList >tbody> tr{
border-bottom : 1px solid rgb(247, 195, 204);
}
table#boardList > tbody > tr:hover{
background-color : #dadada;
transition-duration: 1s;
}
table#boardList td,
table#boardList th{
padding: 10px;
text-align: center;
}
.sb{
width: 900px;
margin: 20px auto;
display: flex;
justify-content: space-between;
}
.menu{
font-size: 20px;
border :  2px solid rgb(247, 195, 204);
text-align: center;
font-family: Malgun Gothic;
}
.border{
border : 2px solid rgb(247, 195, 204);
height: 30px;
padding: 10px 0;
}

table#boardList > thead > tr> th:nth-child(1) { width: 10%;}
table#boardList > thead > tr> th:nth-child(2) { width: 50%;}
table#boardList > thead > tr> th:nth-child(3) { width: 10%;}
table#boardList > thead > tr> th:nth-child(4) { width: 10%;}
table#boardList > thead > tr> th:nth-child(5) { width: 20%;}

table#boardList > tbody > tr> td:nth-child(2) {text-align: left;}
</style>
</head>
<body>

<header>

<h1 style="text-align: center; color-weight: bold;"><a href="${cpath }">----- YUJIINS WORLD -----</a></h1>

<div style="text-align: center;">로그인 상태 : ${login.username } ❤</div>
<div class="sb border">

<div><a href="${cpath}/join.jsp">회원가입</a></div>
<div><a href="${cpath }/login.jsp">로그인</a></div>
<div><a href="${cpath }/logout.jsp">로그아웃</a></div>
<div><a href="${cpath }/write.jsp">게시판</a></div>

</div>

</header>




</body>
</html>