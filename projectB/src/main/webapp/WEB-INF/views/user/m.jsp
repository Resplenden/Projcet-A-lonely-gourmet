<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>user/modify 페이지</h2>
	<form action="modify.do" method="post">
		<input type="hidden" name="uidx" value="${vo.uidx}">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" value="${vo.id}"></td>
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
				<td><textarea name="addr" rows="" cols="">${vo.addr}</textarea></td>
			</tr>
		</table>
		<button>저장</button>
		<!--
			상세페이지에서 수정버튼 클릭시 해당 jsp가 포워드 될 수 있도록 구현한다.
			이떄 수정버튼을 클릭한 게시글에 대한 상세 정보가 수정 페이지에 출력되어야 한다.
		  -->
	</form>
</body>
</html>