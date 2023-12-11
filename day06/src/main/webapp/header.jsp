<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="phonebook.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!-- 내가 값을 지정할 수 있을때 -->
<jsp:useBean id="dao" class="phonebook.PhonebookDAO" />
<!-- 기본 생성자로 생성하고 싶을때 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>:::PhoneBook:::</title>
</head>
<body>

	<h1>
		<a href="${cpath }">PHONEBOOK</a>
	</h1>
	<div>
		<ul>
			<li><a href="list.jsp">목록</a></li>
			<li><a href="add.jsp">추가</a></li>
		</ul>
	</div>
