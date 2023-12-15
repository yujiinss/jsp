<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<section class=frame>
<h3>항목 추가</h3>
<form action= add-action.jsp>

<label><input type="radio" name="카테고리" value="음악">음악</label>
<label><input type="radio" name="카테고리" value="만화">만화</label>
<label><input type="radio" name="카테고리" value="요리">요리</label>

<p>
<label><input type="text" name="category" placeholder="카테고리"></label>
<label><input type="text" name="title" placeholder="제목"></label>
<label><input type="text" name="channel" placeholder="채널 이름"></label>
<label><input type="text" name="imgName" placeholder="영상 썸네일"></label>
<label><input type="text" name="video" placeholder="영상 태그"></label>
<input type="submit">
</p>
</form>

</section>
</body>
</html>