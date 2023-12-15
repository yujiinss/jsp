<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<section class="frame">

	<c:set var="list" value="${dao.selectList() }"/>
		<c:forEach var="dto" items="${list }">

	<div class="box">
			<div class="item">
				<div class="img"><a href="${cpath }/view.jsp?idx=${dto.idx}"> 
					<img src="${cpath }/image/${dto.imgName}" height="120"></a>
				</div>
				<div class="name">${dto.name }</div>
				<div class="price">${dto.price }</div>
			</div>
		</c:forEach>
	</div>
	
	
	<div>
		<a href="${cpath }/add.jsp"><button>추가</button></a>
	</div>
	
	
</section>

</body>
</html>