<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>board/modify 페이지</h2>
	<form action="modify.do" method="post">
		<input type="hidden" name="bidx" value="${vo.bidx}">
		<table border="1">
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" value="${vo.title}"></td>
			</tr>
			<tr>
				<td>등록일</td>
				<td>${vo.wdate}</td>
			</tr>
			<tr>
				<td>조회수</td>
				<td>${vo.hit}</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content" rows="" cols="">${vo.content}</textarea></td>
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