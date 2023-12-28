<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>수정 결과</title>
</head>
<body>

<jsp:useBean id="dto" class="member.MemberDTO"/>
<jsp:setProperty property="*" name="dto"/>

<c:set var="row" value="${dao.update(dto)}"/>

<c:if test="${row != 0 }">
<c:set var="login" value="${dto }" scope="session"/>
</c:if>

</body>
</html>