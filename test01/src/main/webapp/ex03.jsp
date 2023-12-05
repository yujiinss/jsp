<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>JSP 기본문법 활용 + JDBC</h1>
<hr>

<%@ page import="ex03.Ex03DAO" %> <!-- 지시자 -->
<%!
private Ex03DAO dao = new Ex03DAO();%> <!-- 선언부 -->

<%!
 String dbVersion = dao.getDBversion();
 %> <!-- 스크립트 -->
<h3>DB version : <%=dbVersion %></h3> <!-- 표현식 -->
</body>
</html>

