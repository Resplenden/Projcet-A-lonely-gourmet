<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="edu.study.vo.UserVo" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  




  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>user/list 페이지</h2>
	<table border="1">
	
	<%-- <%
		for(BoardVo vo : list){
			%>
			<tr>
				<td><%=vo.getTitle() %></td>
				<td><%=vo.getWriter() %></td>
				<td><%=vo.getContent() %></td>		
			</tr>
			<%	
		}	
	%> --%>
	</table>
	
	<table border="1">
	<c:forEach items="${datalist}" var="vo">
		<tr>
			<td>${vo.uidx}</td>
			<td><a href="view.do?uidx=${vo.uidx}">${vo.name}</a></td>
			<td>${vo.addr}</td>
		</tr>
	</c:forEach>
	</table>
	
</body>
</html>