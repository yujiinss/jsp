<%@page import="person.PersonDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list-show.jsp</title>
<style>
	tr:hover{
	background-color: lightskyblue;
	cursor: pointer;
	}
	table a{
	display: black;
	text-decoration: none;
	}
	
</style>
</head>
<body>

	<h1>person 목록</h1>
	<hr>
	<p>
	<a href="add-form.jsp"><button>추가</button></a>
	</p>

	<table border="1" cellpadding="10" cellspacing="0"width="500">
		<thead>
			<tr>
				<th>나이</th>
				<th>이름</th>
			</tr>
		</thead>
		<tbody>
			<%
			List<PersonDTO> list = (List<PersonDTO>)request.getAttribute("list");

			for (PersonDTO dto : list) {%>
			<tr>
			<!-- a태그를 쓰는 이유는 view.jsp로 이동할 때 name의 정보를 갖고 이동시키기 위함 -->
				<td><a href="view.jsp?name=<%=dto.getName()%>"><%=dto.getName() %></a></td>
				<td><%=dto.getAge()%></td>
			</tr>
			<%
			}
			%>

		</tbody>
	</table>
</body>
</html>