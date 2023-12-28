<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<section>
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
		<a class="deleteLink" href="${cpath }/delete.jsp?userId=${dto.userId}"><button>탈퇴</button></a>
		<a href="${cpath }/modify.jsp?userId=${dto.userId}"><button>수정</button></a>
		</td>
	</tr>	
	</c:forEach>
	
	</tbody>
</table>
</section>

<script>

	function deleteHandler(event){ 	// 발생한 행위가 event // 사용자가 사용하는 모든 행위
		event.preventDefault()		// event의 기본작동을 막는다
									// a를 클릭했을 때 기본작동(페이지 이동)을 막아버린다
		const flag = confirm('정말 삭제하시겠습니까')// 삭제할지 물어보고 대답에 따라 true/false 저장 // flag의 값이 true이면 
		if(flag){								// 클릭당한 태그 요소가 event.target
			location.href = event.target.parentNode.href // 
			// 클릭당한 태그 요소가 event.target이며, 
			// 클릭당한 요소는 button이며, button의 상위요소는 a태그, a의 href속성으로 이동시킨다
		}
	}
	// 문서 내부의 a태그 중에서 클래스가 deleteLink인 모드 요소를 불러와서
	const aList = document.querySelectorAll('a.deleteLink')
	
	//aList내부의 각 요소를 a라고 할 떄, a를 클릭하면 실행되는 함수 자리에 deleteHandler를 할당한다
	aList.forEach(a => a.onclick = deleteHandler)
	
</script>



</body>
</html>