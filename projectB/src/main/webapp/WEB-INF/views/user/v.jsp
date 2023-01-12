<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>user/view 페이지</h2>
	<table border="1">
		<tr>
			<td>아이디</td>
			<td>${vo.id}</td>		
		</tr>
		<tr>
			<td>이름</td>
			<td>${vo.name}</td>		
		</tr>
		<tr>
			<td>등록일</td>
			<td>${vo.rdate}</td>		
		</tr>
		<tr>
			<td>주소</td>
			<td>${vo.addr}</td>		
		</tr>	
	</table>
	
	<button onclick="location.href='<%= request.getContextPath()%>/user/modify.do?uidx=${vo.uidx}'">수정</button>
</body>
</html>