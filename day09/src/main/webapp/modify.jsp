<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="header.jsp" %>

<c:set var="dto" value="${dao.selectOne(param.idx) }" />
<section class="frame">

<h3>항목 수정</h3>

<form action = "modify-action.jsp">
<p>
<input type="hidden" name="idx" value="${dto.idx }">
</p>

<p><input type="text" name="name" value="${dto.name }" placeholder="상품 이름" required></p>
<p><input type="number" name="price" value="${dto.price }" placeholder="상품 가격" required></p>
<p><input type="text" name="imgName" value="${dto.imgName }" placeholder="그림 파일 이름"></p>
<p><input type="submit"></p>

</form>

</section>
</body>
</html>