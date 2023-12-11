<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02.jsp</title>
</head>
<body>

	<h1>include</h1>
	<hr>

	<table border="1" cellpadding="10" cellspacing="0">
		<tr>
			<th>&lt;%@ include file=""%></th>
			<th>서로 다른 JSP 파일의 소스를 먼저 합치고 컴파일을 수행한다</th>
			<th>지역변수가 서로 공유된다. 변수의 이름을 중복시키면 안된다</th>
		</tr>
		
		<tr>
			<th>%lt;jsp:include page=""/></th>
			<th>각 JSP를 컴파일하고, 결과를 합친다</th>
			<th>지역변수가 공유되지 않는다. 변수 충돌을 막기 위해 사용할 수 있다</th>
		</tr>
	</table>
	
	<h3>자바 소스 코드 관점에서 내용을 합치려면 지시자를 사용한다</h3>
	<h3>단순히 결과물의 모양만 합치려면 액션태그를 사용한다</h3>

</body>
</html>