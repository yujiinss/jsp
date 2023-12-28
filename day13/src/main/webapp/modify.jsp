<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="header.jsp" %>

<section>
<c:set var="dto" value="${dao.selectOne(param.userId)}"/>
<form action="modify-action.jsp" method="POST">

<div><input type="text" name="userId" value="${dto.userId }" placeholder="아이디" required readonly></div><%--readonly 읽기 전용이라는 말 --%>
<div><input type ="password" name="userPw" value="${dto.userPw}" placeholder="비밀번호" required autofocus></div>
<div><input type ="text" name="userName" value="${dto.userName }" placeholder="사용이름" required></div>
<div><input type ="text" name="email" value="${dto.email }" placeholder="이메일" required></div>

<label><input type="radio" name="gender" value="여성" ${dto.gender == '남성' ? 'checked' : '' } required>여성</label>
<label><input type="radio" name="gender"  value="남성" ${dto.gender == '남성' ? 'checked' : '' } required>남성</label>
<p><input type="submit" value="로그인"></p>

</form>

</section>

</body>
</html>