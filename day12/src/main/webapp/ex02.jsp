<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02.jsp</title>
<style>

.black{
background-color: black;
color: #dadada;
}
.lime{
background-color : black;
color: #0000FF;
}
.aqua{
background-color: black;
color: #00FFFF;
}
.orange{
backgound-color: black;
color: orange;
}
pre{
font-size: 16px;
}
</style>
</head>
<body class="${cookie.theme.value }">

<h1>쿠키를 활용한 색상 테마 설정</h1>
<hr>

<form action="ex02-action.jsp">

<select name="theme">
<option>white</option>
<option ${cookie.theme.value == 'black' ? 'selected' : '' }>black</option>
<option ${cookie.theme.value == 'lime' ? 'selected' : '' }>lime</option>
<option ${cookie.theme.value == 'aqua' ? 'selected' : '' }>aqua</option>
<option ${cookie.theme.value == 'orange' ? 'selected' : '' }>orange</option>
</select>

<input type="submit">
</form>

<fieldset>
<legend>lorem</legend>
<pre> 1979년 12월 12일 전두환·노태우 등이 이끌던 군부 내 사조직인 '하나회' 중심의 신군부가 일으킨 군사반란.
1979년 10·26사건이 일어나 대통령 박정희(朴正熙)가 사망한 뒤 합동수사본부장을 맡고 있던 보안사령관 전두환(全斗煥)과 육군참모총장이자 계엄사령관인 정승화(鄭昇和) 간에는 
사건 수사와 군 인사 문제를 놓고 갈등이 있었다. 전두환을 중심으로 한 신군부는 군부 내 주도권을 장악하기 위하여 정승화가 김재규(金載圭)로부터 돈을 받았다고 주장하고, 
10·26사건 수사에 소극적이고 비협조적임을 내세워 정승화를 강제 연행하기로 계획하였다.
</pre>
</fieldset>

<div>
<button id ="checkCookie">쿠키 확인</button>
</div>

<script>
checkCookie.onclick = function(){
	alert(document.cookie)
}
</script>


</body>
</html>