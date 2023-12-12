<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ex04.*"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>singleton과 EL Tag</h1>
<hr>

<h3>어떤 경우에도 단 하나의 객체만 가지게 하는 클래스 디자인 패턴을 싱글톤이라고 한다</h3>

<h3>jsp:useBean은 지정한 클래스의 기본생성자를 이용하여 객체를 생성한다</h3>

<jsp:useBean id="ob1" class="ex04.Test01"/>
<p>${ob1 }(새로고침마다 객체 해시코드가 변한다)</p>

<h3>c:set은 메서드의 호출결과 혹은 내가 지정한 리터럴 상수값이 객체가 된다</h3>
<c:set var ="ob2" value="${Test2.getInstance()}"/>
<p>${ob2 }(새로고침을 아무리해도 객체 해시코드는 변하지 않는다)</p>

<!--dao는 함수 중심의 객체 / 기능 중심의 객체는 싱글톤으로 만드는게 유리하다 -->
<!--dto는 싱글톤으로 만들면 안된다 -->
</body>
</html>