<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ include file="header.jsp" %>

<c:set var="dto" value="${boardDAO.selectOne(param.idx) }"/>
<div class="menu">
<div>${dto.idx }  ${dto.title }  ${dto.writer }</div>
<div>조회수 : ${dto.viewCount }</div>
<div>${dto.writeDate }</div>
<div><img src="reviewImage/${dto.image }"></div>
<div><pre>${dto.content }</pre></div>
<div>${dto.ipaddr }</div>
</div>

</body>
</html>