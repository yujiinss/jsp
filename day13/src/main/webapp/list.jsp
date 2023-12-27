<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<table>
	<thead>
	<tr>
		<td>아이디</td>
		<td>비밀번호</td>
		<td>사용자이름</td>
		<td>성별</td>
		<td>이메일</td>
	</tr>
	</thead>
	
	<tbody>
	<c:set var="list" value="${dao.selectList() }"/>
	
	<c:forEach var="dto" items="${list }">
	<tr>	
		<td>${dto.userId }</td>
		<td>${dto.userPw }</td>
		<td>${dto.userName }</td>
		<td>${dto.gender }</td>
		<td>${dto.email }</td>	
	
	<td>
	<a href="login.jsp?userId=${dto.userId }"><button>로그인</button></a>
	<a href="modify.jsp?userId=${dto.userId }"><button>수정</button></a>
	<a href="delete.jsp?userId=${dto.userId }"><button>탈퇴</button></a>
	</td>
	</tr>
	</c:forEach>
	
	</tbody>

</table>

<div>
<form action="list.jsp">
<p><a href="join.jsp"><button>회원가입</button></a></p>
</form>
</div>


</body>
</html>