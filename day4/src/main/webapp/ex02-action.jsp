<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="ex02-error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	int n1 = Integer.parseInt(request.getParameter("n1"));
	int n2 = Integer.parseInt(request.getParameter("n2"));
	int answer = n1+n2;
	
	String msg = String.format("%d + %d = %d", n1,n2,answer);
%>

<h3><%=msg %></h3>
<a href="ex02-form.jsp"><button>다시</button></a>

</body>
</html>