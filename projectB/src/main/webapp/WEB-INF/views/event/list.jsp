<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록</title>
</head>
<body>
	<h2>event 목록</h2>

	
		<table>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성날짜</th>
			</tr>
		
		<c:forEach items="${list}" var="vo">
			<tr>
				<td>${vo.eidx}</td>
				<td><a href="view.do?eidx=${vo.eidx}">${vo.title}</a></td>
				<td>${vo.writer}</td>
				<td>${vo.rec}</td>
				<td>${vo.wdate }</td>
			</tr>
		</c:forEach>
		</table>
	
	<button onclick="location.href='write.do?eidx=${vo.eidx }'">글쓰기</button>


</body>
</html>