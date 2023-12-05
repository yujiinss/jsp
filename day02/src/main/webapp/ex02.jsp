<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>request.getParameter(String name)</h1>
<hr>

<h3>주소에 쿼리스트링 형태로 파라미터를 추가할 수 있다</h3>
<!-- a태그는 새로운 요청을 만들어내는 태그 -->
<a href="<%=request.getRequestURL() %>?guest=손님"><button>손님 링크</button></a>

<%
String guest = request.getParameter("guest");
%>

<h3>form태그에 입력한 값이 파라미터로 전송될 수 있다. 이때 input의 name을 맞춰야 한다</h3>
<!-- form태그는 input들의 값을 쿼리스트링으로 만든 후, 새로운 요청을 보냄 -->
<form>
<p><input type="text" name="guest" placeholder="직접 입력"></p>
<p><input type="submit">
</form>

<h3>guest : <%=guest %></h3>
</body>
</html>