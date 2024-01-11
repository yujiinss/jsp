<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:set var="dto" value="${boardDAO.selectOne(param.idx)}" />

<div class = form>
   
    <form action="modify-action.jsp" method="post">
        <input type="hidden" name="idx" value="${dto.idx}" />
       
        <input type="text" id="title" name="title" value="${dto.title}" placeholder="제목" /><br/>
        <textarea id="content" name="content" placeholder="내용을 입력하세요">${dto.content}</textarea><br/>
        <input type="submit" value="수정" />
    </form>
</div>

<div>
    <div>
        <a href="${cpath}"><button>목록</button></a>
    </div>
</div>

</body>
</html>