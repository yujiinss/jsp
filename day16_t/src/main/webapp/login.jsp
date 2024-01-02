<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:if test="${pageContext.request.method == 'GET' }">
	<h3>로그인</h3>
	<form method="POST">
		<p><input type="text" name="userid" placeholder="ID" required autofocus></p>	
		<p><input type="password" name="userpw" placeholder="Password" required></p>	
		<p><input type="submit" value="로그인"></p>	
	</form>
</c:if>

<c:if test="${pageContext.request.method == 'POST' }">
	<jsp:useBean id="dto" class="member.MemberDTO" />
	<jsp:setProperty property="*" name="dto" />
	<c:set var="login" value="${memberDAO.login(dto) }" scope="session" />
	<c:redirect url="/" />
</c:if>

</body>
</html>