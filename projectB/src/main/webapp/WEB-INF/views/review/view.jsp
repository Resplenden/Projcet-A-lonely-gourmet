<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세보기</title>
</head>
<body>
	<h2>글 상세보기</h2>
	
	<table border="1">
		<tr>
			<th>글번호</th>
			<td>${vo.vidx }</td>
		</tr>
		<tr>
			<th>글제목</th>
			<td>${vo.title }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${vo.content }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${vo.writer }</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${vo.hit }</td>
		</tr>
		<tr>
			<th>작성날짜</th>
			<td>${vo.wdate }</td>
		</tr>
		
	</table>
	<br/>
	<c:if test="${login }">
	<button onclick="location.href='write.do?vidx=${vo.vidx }'">글쓰기</button>
	<button onclick="location.href='modify.do?vidx=${vo.vidx }'">수정</button>
	<button onclick="document.delfrm.submit();">삭제</button>
	
	<form name="delfrm" action="delete.do" method="post">
		
		<input type="hidden" name="vidx" value="${vo.vidx }">
	</form>
	</c:if>
	
	
</body>
</html>