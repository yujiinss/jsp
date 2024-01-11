<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<c:set var="memberDAO" value="${MemberDAO.getInstance() }"/>

<%	request.setCharacterEncoding("UTF-8"); %>
<%	response.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./styles.css">
    <title>회원가입</title>
</head>
<body>
    <div id="main-container">
        <header>
        <div class="nav-overlay">
            <nav class="nav">
            	<a href="index.jsp">
                	<img src="https://assets-global.website-files.com/64e5c2af07963c6e3ddbaf3a/64e5c2b107963c6e3ddbbd0a_logo_black.svg"
                	class="image-210">
                </a>
                <div class="header-nav">
                    <a href="history.jsp">목구멍 역사</a>
                    <a href="menu.jsp">메뉴 안내</a>
                    <a href="location.jsp">매장 안내</a>
                    <a href="freeboard.jsp">목소리</a>
                    <a href="join.jsp" class="history">회원가입</a>
                </div>
            </nav>
        </div>
    </header>
    </div>
    	<div class="singnup-form-body ">
		<c:if test="${pageContext.request.method == 'GET'}">
		<div class="signup-form">
		    <h2>회원가입</h2>
		    <form method="POST">
		      <p><h3>이름</h3></p>
		      <p><input type="text" name="username" placeholder="이름" required></p>
		      <p><h3>아이디</h3></p>
		      <p class ="id"><input type="text" name="userid" placeholder="아이디" required>
		        <button type="button">중복체크</button>
		     </p>
		      <p><h3>비밀번호</h3></p>
		      <p><input type="password" name="userpw" placeholder="비밀번호" required></p>
		      <p><h3>이메일</h3></p>
		      <p><input type="text" name="email" placeholder="이메일" required></p>
		      <p><h3>성별</h3></p>
		      <p style="display: flex;">
		        <label><input type="radio" name="gender" value="여성" required>여성</label>
		        <label><input type="radio" name="gender" value="남성" required>남성</label>
		      </p>
		      <p><button class="submit" type="submit">가입하기</button></p>
		    </form>
		  </div>
		</c:if>
		</div>



		<c:if test="${pageContext.request.method == 'POST'}">
		<jsp:useBean id="dto" class="member.MemberDTO"/>
		<jsp:setProperty property="*" name="dto"/>
		<c:set var="row" value="${memberDAO.insert(dto) }" />
			<script>
			const row = '${row}'
			alert(row != 0 ? '가입성공': '가입실패')
			location.href = '${cpath}'
			</script>
		</c:if>


</body>
</html>