<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<section>
<form action="join-action.jsp" method="POST">
<input type ="text" name="userId" placeholder="아이디">
<input type ="password" name="userPw" placeholder="비밀번호">
<input type ="text" name="userName" placeholder="사용이름">
<input type ="text" name="email" placeholder="이메일">

<label><input type="radio" name="gender" value="여성">여성</label>
<label><input type="radio" name="gender"  value="남성">남성</label>
<p><input type="submit" value="로그인"></p>

</form>

</section>

</body>
</html>