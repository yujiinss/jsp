<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div.nav{
width: 100%;
}
div.nav >ul{
width: 900px;
display: flex;
justify-content: center;
list-style: none;
padding: 0;
margin: auto;
}
div.nav > ul>li{
text-align: center;
flex:1;
}
a{
text-decoration: none;
color: grey;
}
a:hover{
color: black;
}
div.nav a{
display: balck;
}
</style>
</head>
<body>

<h1> 대문페이지 - day05</h1>
<hr>

<div class="nav">
<ul>
<li><a href="list.jsp">인원관리</a>
</ul>
</div>
</body>
</html>