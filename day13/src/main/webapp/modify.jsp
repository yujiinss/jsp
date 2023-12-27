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
<form action="modify-action.jsp" method="POST">
<div><input name="userId" value="${login,userid }" placeholder="아이디"></div>
<div><input type ="password" value="${login.userPw}" name="userPw" placeholder="비밀번호"></div>
<div><input type ="text" name="userName" value="${login.userName }" placeholder="사용이름"></div>
<div><input type ="text" name="email" value="${login.email }" placeholder="이메일"></div>

<label><input type="radio" name="gender" value="여성">여성</label>
<label><input type="radio" name="gender"  value="남성">남성</label>
<p><input type="submit" value="로그인"></p>

</form>

</section>

</body>
</html>
