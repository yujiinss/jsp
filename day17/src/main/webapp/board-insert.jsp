<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:if test="${pageContext.request.method =='GET' }">
<c:if test="${empty selectOne }">
<script>
alert('로그인이 필요합니다')
location.href = '${cpath}/login.jsp'
</script>
</c:if>
<form method="POST">
<p><input type="hidden" name="writer" value="${selectOne.userid }"></p>
<p><textarea rows="2" cols="80" name="title" placeholder="제목"></textarea></p>
<p><textarea rows="8" cols="80" name="title" placeholder="내용"></textarea></p>
<p><input type="submit" value="작성하기"></p>
</form>
</c:if> 

<c:if test="${pageContext.request.method == 'POST' }">
<jsp:useBean id="dto" class="board.BoardDTO"/>
<jsp:setProperty property="*" name="dto"/>
<c:set var="row" value="${BoardDAO.insert(dto) }"/>
<c:redirect url="/board.jsp"/>

</c:if>


</body>
</html>