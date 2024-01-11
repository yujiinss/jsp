<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<main>
<h3 style="margin: 30px 500px; border-bottom: 2px solid rgb(247, 195, 204); color:rgb(247, 195, 204); padding:10px; ">대문 페이지</h3>

<details>
<summary>paging info</summary>
<br>
<fieldset>
<c:set var="boardCount" value="${boardDAO.selectCount(param.search) }"/>
<c:set var ="paramPage" value="${empty param.page ? 1: param.page }"/>
<c:set var="paging" value="${Paging.newInstance(paramPage, boardCount) }"/>
<c:set var="list" value="${boardDAO.selectList(param.search, paging) }"/>
<ul>
<li>게시글 개수 : ${boardCount }</li>
<li>요청받은 페이지 : ${paramPage }</li>
<li>paging.offset : ${paging.offset }</li>
<li>paging.fetch : ${paging.fetch }</li>
<li>paging.begin : ${paging.begin }</li>
<li>paging.end : ${paging.end }</li>

</ul>
</fieldset>
</details>


<table id="boardList">
<thead>
<tr>
<th>번호</th>
<th>제목</th>
<th>작성자</th>
<th>조회수</th>
<th>날짜</th>
</tr>
</thead>


<c:forEach var="dto" items="${list }">
<tr>
<td>${dto.idx }</td>
<td><a href="${cpath}/view.jsp?idx=${dto.idx}">
	${dto.title }
	${not empty dto.image ? '❤' : ''}
	</a>
</td>
<td>${dto.writer }</td>
<td>
<c:set var="row" value="${boardDAO.totalView(param.idx)}" />${row 
}</td>
<td>${dto.writeDate }</td>
</tr>
</c:forEach>
</table>

<div class="center">

<c:if test="${paging.prev }">
	<a href="${cpath }?page=${paging.begin - 10}&search=${param.search}">[이전]</a>
</c:if>
<c:forEach var="i" begin="${paging.begin}" end="${paging.end}">
<a class="${paging.page == i ? 'bold' : '' }"
   href="${cpath }?page=${i}&search=${param.search}">[${i }]</a>
</c:forEach>
<c:if test ="${paging.next }">
<a href="${cpath }?page=${paging.end + 1}&search=${param.search}">[다음]</a>
</c:if>
</div>



<div class="sb">

<div>

<form>
<input type="search" name="search" value="${param.search }" placeholder="검색어를 입력하세요">
<input type="submit" value="검색">
</form>

</div>

<div>
<a href="${cpath }/write.jsp"><button>새 글 작성</button></a>
</div>
</div>


</main>

</body>
</html>