<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:if test="${pageContext.request.contextPath == 'GET' }">
<div class="signup-form">
    <h2>로그인</h2>
    <form method="POST">
      <p>
        <input type="text" name="username" placeholder="아이디" required>
      </p>
      <p>
        <input type="password" name="password" placeholder="비밀번호" required>
      </p>
      <p>
        <button type="submit">로그인</button>
      </p>
    </form>
  </div>

</c:if>

<c:if test="${pageContext.request.contextPath == 'POST' }">

<jsp:useBean id="dto" class="member.MemberDTO"/>
<jsp:setProperty property="*" name="dto"/>
<c:set var="login" value="${dao.login(dto) }" scope="session"/>
<c:redirect url="/"/>

</c:if>

</body>
</html>