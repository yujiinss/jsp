<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<jsp:useBean id="dao" class="youtube.YutubeDAO" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	a {
		text-decoration: none;
		color: inherit;
	}
	a:hover {
		text-decoration: none;
	}
	.frame {
		width: 900px;
		margin: 0 auto;
		border: 1px dashed red;
	}
	header {
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	nav > ul {
		display: flex;
		width: 300px;
		list-style: none;
		padding: 0;
	}
	nav > ul > li {
		flex: 1;
	}
	div.box {
		display: flex;
		flex-flow: wrap;
		margin: auto;
	}
	div.item {
		box-sizing: border-box;
		width: 200px;
		margin: 10px;
		padding: 10px;
		text-align: center;
	}
	div.detail{
	display: flex;
	flex-flow:column;
	justify-content: center;
	align-items: center;
	text-align: center;
	}
	.frame > .detail{
	
	font-family: 'NanumGothic';
	
	}
	
	</style>
</head>
<body>

<header class="frame">
	<h1><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTExMTVfMTAz%2FMDAxNjM2OTMxNTQ2Njg3.4MBb-O5WrfvBRADeDfE29d-qLU7Xp7nzmp43RsA04Lgg.gRjC06Tq1A-GagPxvaU63e9AFWxlbKr-yjyzQM5ETwgg.PNG.cyberxirex%2F01.png&type=sc960_832" width="100px"></h1>
	<nav>
		<ul>
			<li><a href="${cpath }/list.jsp">전체</a></li>
			<li><a href="${cpath }/list.jsp?category=음악">음악</a></li>
			<li><a href="${cpath }/list.jsp?category=만화">만화</a></li>
			<li><a href="${cpath }/list.jsp?category=요리">요리</a></li>
		</ul>
	</nav>
</header>
