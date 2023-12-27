<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<jsp:useBean id="dto" class="member.MemberDTO"/>
<jsp:setProperty property="*" name="dto"/>

<c:set var="login" value="${dao.login(param.userId, param.userPw) }" scope="session"/>
<c:if test="${not empty login }">
	<c:redirect url="list.jsp"/>
</c:if>

</body>
</html>