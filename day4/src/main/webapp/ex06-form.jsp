<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex06.jsp</title>
<style>
.item{
display: flex;
justify-content: center;
allign-item: center;
border: 1px solid darkgrey;
font-size: 20px;
height:120px;
line-height: 120px;
width: 300px;
}
</style>
</head>
<body>

<h1>사용자 선택</h1>
<hr>
<div class="item">
<a href="ex06-action.jsp?name=짱구"><img src="img/짱구.png" height="100">짱구</a>
</div>

<div class="item">
<a href="ex06-action.jsp?name=철수"><img src="img/철수.png" height="100">철수</a>
</div>

<div class="item">
<a href="ex06-action.jsp?name=맹구"><img src="img/맹구.png" height="100">맹구</a>
</div>

<div class="item">
<a href="ex06-action.jsp?name=유리"><img src="img/유리.png" height="100">유리</a>
</div>

<div class="item">
<a href="ex06-action.jsp?name=훈이"><img src="img/훈이.png" height="100">훈이</a>
</div>

<div class="item">
<a href="ex06-action.jsp?name=짱구"><img src="img/짱구.png" height="100">짱구</a>
</div>

</body>
</html>