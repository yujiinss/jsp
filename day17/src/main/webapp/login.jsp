<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:if test="${pageContext.request.method == 'GET'}">
<h3>로그인하기</h3>
<form method="POST">
<p><input type="text" name="userid" placeholder="아이디"></p>
<p><input type="text" name="userpw" placeholder="비번"></p>
<p><input type="submit" value="로그인"></p>
</form>
</c:if>

<c:if test="${pageContext.request.method == 'POST'}">
<jsp:useBean id="dto" class="member.MemberDTO"/>
<jsp:setProperty property="*" name="dto"/>
<c:set var="selectOne" value="${memberDAO.selectOne(dto) }" scope="session" />
	<c:redirect url="/" />
</c:if>


</body>
</html>