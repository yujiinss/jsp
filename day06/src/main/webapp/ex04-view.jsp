<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex04-view.jsp</title>
</head>
<body>


	<h1>게시글 읽기</h1>
	<hr>

	<%
	int[] arr = { 4, 8, 2, 7, 6 };
	for (int i = 0; i < arr.length; i++) {
		out.print(arr[i] + "");
	}
	out.print("</p>");
	%>

<pre>
1979년 12월 12일,
전두환 노태우 주도
사건 발생
김영삼의 역사바로세우기 
공식적으로 12.12 군사반란이라고 불리게 됨
</pre>

<jsp:include page="ex04-list.jsp">
</body>
</html>