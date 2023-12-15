<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<jsp:useBean id="dao" class="product.ProductDAO" />
<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Egg Drop</title>

<style>
a {
	list-style: none;
	color: inherit;
}

.frame {
	width: 1280px;
	margin: 0 auto;
}

.sb {
	display: flex;
	justify-content:
}
</style>

</head>

<body>

	<header class=frame>
		<h1>EGG DROP</h1>

		<nav>
			<ul>
				<li><a href="${cpath }/list.jsp">전체</a></li>
			</ul>
		</nav>

	</header>