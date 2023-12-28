<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<form action="login-action.jsp" method="POST">
<input type ="text" name="userId" placeholder="아이디">
<input type ="password" name="userPw" placeholder="비밀번호">
<input type="submit" value ="로그인">
</form>

<a href="${cpath }/delete.jsp"><button>탈퇴</button></a>


</body>
</html>