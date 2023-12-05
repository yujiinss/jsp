<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>quiz01.jsp - 두 수의 덧셈 결과</h1>
	<hr>

	<%
	//primitive type에는 null을 대입할 수 없습니다
	//Integer.parseInt()는 인자로 null을 받아서 처리할 수 없다(NumberFormatException)
	//request.getParameter(String name)의 반환형은 String이다
	//변수 선언을 했을때 출력한다면, 분기문에 상관없이 값이 할당되어 있어야 한다(변수의 초기화)
	//제어문 내부에서 선언한 변수는 제어문 바깥에서 접근할 수 없다(지역 변수)
	String n1 = request.getParameter("n1");
	String n2 = request.getParameter("n2");
	int answer=0;

	//required 걸거나 이런식으로 조건을 써야 함
	if(n1 !=null && n2 !=null && "".equals(n1)==false && "".equals(n2)==false){
	 answer = (Integer.parseInt(n1)+Integer.parseInt(n2));	
	}
%>
<h3>HTML과 JAVA코드가 하나의 페이지에 작성되어 있고, 순서가 섞여도 항상 자바부터 수행된다</h3>
<H3>JAVA코드는 웹서버에서 실행되고, HTML은 클라이언트의 브라우저에서 실행된다</H3>
<form>
		<input type="number" name="n1" placeholder="n1" min="0" max="99" >
		+ 
		<input type="number" name="n2" placeholder="n2" min="0" max="99" >
		<input type="submit" value="=">
		<%= answer %>
	</form>

</body>
</html>