<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>

<section class=frame>
<h3>항목 추가</h3>

<form action = "add-action.jsp">

<p><input type="text" name="name" placeholder="상품 이름" required></p>
<p><input type="number" name="price" placeholder="상품 가격" required></p>
<p><input type="text" name="imgName" placeholder="그림 파일 이름"></p>
<p><input type="submit"></p>

</form>

</section>

</body>
</html>