<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<table border="1" cellpadding="10" cellspacing="0" width="800" align="center">
	<c:set var="list" value="${boardDAO.selectList() }" />
	<c:forEach var="dto" items="${list }">
	<tr>
		<td>${dto.idx }</td>
		<td>
			<a href="${cpath }/view.jsp?idx=${dto.idx}">${dto.title }</a>			
		</td>
		<td>${dto.writer }</td>
		<td>${dto.writeDate }</td>
	</tr>
	</c:forEach>
</table>

	<div>
		<a href="${cpath }/board-insert.jsp"><button>작성</button></a>
	</div>

</body>
</html>