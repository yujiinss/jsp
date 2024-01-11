<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

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