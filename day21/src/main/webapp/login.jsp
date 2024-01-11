<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<c:if test="${pageContext.request.method == 'GET'}">
<h3>로그인</h3>

<form method="POST">
<p><input type="text" name="userid" placeholder="아이디"></p>
<p><input type="password" name="userpw" placeholder="비밀번호"></p>
<p><input type="submit" value="제출"></p>
</form>
</c:if>

<c:if test="${pageContext.request.method == 'POST'}">
<jsp:useBean id="dto" class="member.MemberDTO"/>
<jsp:setProperty property="*" name="dto"/>
<c:set var="login" value="${memberDAO.login(dto) }" scope="session" />
	<c:redirect url="/" />
</c:if>

<c:if test="${not empty login }">
<p>
	${login.userid }(${login.username })
	<a href="${cpath }/logout.jsp"><button>로그아웃</button></a>
</p>
</c:if>


</body>
</html>