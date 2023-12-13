<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<section class=frame>
<c:set var="dto" value="${dao.selectOne(param.idx) }" />
<h3>항목 수정</h3>
<form action="modify-action.jsp">

${dto.category }
<p>
<label><input type="radio" name="category"  ${dto.category =='음악' ? 'checked' :''} value="음악" required>음악</label>
<label><input type="radio" name="category"  ${dto.category =='만화' ? 'checked' :''} value="만화" required>만화</label>
<label><input type="radio" name="category"  ${dto.category =='요리' ? 'checked' :''} value="요리" required>요리</label>
</p>
<p>
<label><input type="text" name="title" value="${dto.title }" placeholder="제목"></label>
<label><input type="text" name="channel" value="${dto.channel }" placeholder="채널 이름"></label>
<label><input type="text" name="imgName" value="${dto.imgName }" placeholder="영상 썸네일"></label>
<label><textarea name="video" placeholder="영상 태그">${dto.video }</textarea></label>
<input type="hidden" name="idx" value="${dto.idx }">
<input type="submit">
</p>
</form>

</section>
</body>
</html>