<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="food.FoodDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>parameter vs attribute</h3>
<ul>
<li>파라미터는 사용자의 입력값을 말한다</li>
<li>쿼리스트링 형태로 있을 수 있으며, 문자열로 구성된다</li>
<li>HTTP Method가 POST인 경우, 문자열 혹은 파일객체로 구성될 수 있다</li>
<li>사용자의 입력값으로, 서버 개발자가 값을 강제로 넣을 수는 없다(setParameter는 없다)</li>
</ul>

<ul>
<li>프로그램에서 활용되는 객체를 말한다</li>
<li>Object 타입으로 정의되어 있어서, 자바의 모든 객체를 사용할 수 있다</li>
<li>JSP 내장 객체에 저장해둘 수 있고, 내장 객체에 따라 유효범위가 다르다</li>
<li>서로 다른 JSP 페이지가 attribute를 공유할 수 있다</li>
<li>서버 개발자가 값을 set혹은 get할 수 있다</li>
<li>Object타입을 원하는 형태로 바꾸려면, 형변환(down casting)해야 한다</li>
</ul>

<table border="1" cellpadding="10" cellspacing="0">
<tr>
	<td>request.setAttribute(String name, Object o)</td>
	<td>name이름으로 request에 저장한다</td>
</tr>
<tr>
	<td>request.getAttribute(String name)</td>
	<td>name이름으로 request에 저장된 객체를 꺼낸다</td>
</tr>
<tr>
	<td>request.removeAttribute(String name)</td>
	<td>name이름으로 request에 저장된 객체를 제거한다</td>
</tr>
</table>

<%
    //어떤 형태이든 객체를 만들 수 있음
	String test1="Hello";
	FoodDTO test2 = new FoodDTO();
	Integer[] test3 ={2,7,8,4,6};
	List<Integer> test4 = Arrays.asList(test3);
	
	test2.setCategory("치킨");
	test2.setMenuName("굽네순살");
	test2.setMenuPrice(16000);
	test2.setStoreName("굽네치킨 광안점");
	
	test4.sort(null);
	
	// 왼쪽에는 꺼내거나 지울 떄 필요한 이름
	request.setAttribute("test1",test1);
	request.setAttribute("test2",test2);
	request.setAttribute("test3",test3);
	request.setAttribute("test4",test4);
	
	//Object타입으로 넣었기 때문에 down casting 해준다
	String ob1 = (String) request.getAttribute("test1");
	FoodDTO ob2 = (FoodDTO) request.getAttribute("test2");
	Integer[] ob3 = (Integer[]) request.getAttribute("test3");
	List<Integer> ob4 = (List<Integer>) request.getAttribute("test4");
	
	request.removeAttribute("test3");
	
	out.print("<p>ob1 : " +ob1+"</p>");
	out.print("<p>ob2 : " +ob2+"</p>");
	out.print("<p>ob3 : " +ob3+"</p>");
	out.print("<p>ob4 : " +ob4+"</p>");
	
	
	%>
	
	<table border="1" cellpadding="10" cellspacing="0">
	<tr>
		<td>내장객체</td>
		<td>유효범위</td>
	</tr>
	
	<tr>
		<td>pageContext</td>
		<td>현재 페이지에서만 사용할 내장객체를 저장한다</td>
	</tr>
	
	<tr>
	<!--  -->
		<td>request</td>
		<td>현재 요청에 대해서만 사용할 attribute를 저장한다<br>
		forward를 이용하면, forward 대상 페이지에서도 attribute를 참조할 수 있다</td>
	</tr>
	
	<tr>
		<td>session</td>
		<td>현재 사용자가 요청하는 모든 페이지에 대해 공유할 수 있는 attribute 저장소</td>
	</tr>
	
	<tr>
	<!-- 서로 다른 사용자 -->
		<td>application</td>
		<td>모든 사용자가 요청하는 모든 페이지에 대해 공유할 수 있는 attribute 저장소</td>
	</tr>
	
	</table>
</body>
</html>