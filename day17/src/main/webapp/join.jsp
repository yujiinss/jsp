<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:if test="${pageContext.request.method == 'GET'}">
<h3>가입하기</h3>
<form method="POST">
<p><input type="text" name="userid" placeholder="아이디" required></p>
<p><input type="password" name="userpw" placeholder="비번" required></p>
<p><input type="text" name="username" placeholder="이름" required></p>
<p><input type="text" name="email" placeholder="이메일" required></p>
<p>
<label><input type="radio" name="gender" value="여성">여성</label>
<label><input type="radio" name="gender" value="남성">남성</label>
</p>
<p><input type="submit" value="로그인"></p>
</form>
</c:if>

<c:if test="${pageContext.request.method == 'POST' }">
	<jsp:useBean id="dto" class="member.MemberDTO"/>
	<jsp:setProperty property="*" name="dto"/>
	<c:set var="row" value="${memberDAO.insert(dto) }" />
	<c:if test="${row != -1 }">
		<c:redirect url="/login.jsp"/>
	</c:if>
	<script>
	alert('가입 중복')
	history.go(-1)
	</script>
</c:if>


</body>
</html>