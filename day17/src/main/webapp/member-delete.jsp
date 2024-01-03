<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:set var="row" value="${mamberDAO.delete(selectOne.userid }"/>
<c:if test="${row != 0 }">
<c:redirect url="/"/>
</c:if>

</body>
</html>