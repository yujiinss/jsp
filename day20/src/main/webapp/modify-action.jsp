<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="header.jsp" %>

<c:set var="title" value="${boardDAO.modifyPost(param.title)}" />
<c:set var="content" value="${boardDAO.modifyPost(param.content)}" />

</body>
</html>