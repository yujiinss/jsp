<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="login" class="ex06.MemberDTO" scope="session"/>
<jsp:setProperty property="name" name="login"/>

<%
// 세션에 객체를 저장하는 것 만으로 이 페이지의 역할은 끝났다
// 다음 화면으로 연결시켜주기 위해서 리다이렉트를 사용한다
// 페이지가 바뀌면서 요청도 새로 들어가지만, 세션은 같은 세션이기 때문에 attribute를 사용할 수있다
response.sendRedirect("ex06.jsp");
// 주로 세션과 많이 연계하는 redirect
%>
