<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<section class="frame">

	<c:set var="dto" value="${dao.selectOne(param.idx) }" />
	<div class="detail">

		<div>
<%-- 		<a href="${cpath }/view.jsp?idx=${dto.idx}"> --%>
<%-- 			<img src="${dto.imgName}" height="300"></a> --%>
			${dto.video }
		</div>
		

		<div>
			<h3>${dto.title }</h3>
		</div>

		<div>
			<h3 style="color: darkgrey; font-size: 12px;">${dto.channel }</h3>
		</div>
	</div>

	<div class="sb">

		<div>
		<a href="${cpath }/add.jsp?idx=${dto.idx}"><button>추가</button></a>
		</div>
		
		<div>
<%-- 		<a href="${cpath }/delete.jsp?idx=${dto.idx}"><button>삭제</button></a> --%>
		<button id="deleteBtn">삭제</button>
		</div>
		
		<div>
		<a href="${cpath}/modify.jsp?idx=${dto.idx }"><button>수정</button></a>
		</div>

	</div>
</section>

<script>
	deleteBtn.onclick = function() {
		const flag = confirm('정말 삭제하시겠습니까')
		if(flag) {
			location.href = '${cpath }/delete.jsp?idx=${dto.idx}'
		}
	}
</script>

</body>
</html>