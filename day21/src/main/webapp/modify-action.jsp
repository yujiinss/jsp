<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ include file ="header.jsp" %>

<jsp:useBean id="dto" class="board2.BoardDTO"/>
<jsp:setProperty property="*" name="dto"/>
<c:set var="row" value="${boardDAO.modifyPost(dto)}" />

<script>
	const row = '${row}'
	alert(row != 0 ? '수정 성공': '수정 실패')
	location.href = '${cpath}/view.jsp?idx=${dto.idx}'
</script>


</body>
</html>