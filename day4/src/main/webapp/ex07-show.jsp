<%@page import="ex06.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>ex07-action에서 선택한 값 출력</h1>
<hr>

	<img src="<%=((MemberDTO)request.getAttribute("dto")).getImgPath() %>" height="150">
	
	<!--el태그 : 표현언어, attribute를 꺼내오기 위함 -->
	<img src="${requestScope.dto.imgPath}" height="150">
	
	<!--없으면 빈문자열을 출력함 -->
	<img src="${dto.imgPath}" height="150">

</body>
</html>