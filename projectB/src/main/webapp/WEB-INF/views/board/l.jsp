<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="edu.study.vo.BoardVo" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%

	List<BoardVo> list =(List<BoardVo>)request.getAttribute("datalist");	

%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
ul{
	display:flex;
	list-style:none;
		
}
</style>

  
<title>공지사항</title>
</head>
<body>
	<h3>공지사항</h3>
	<!-- 오라클을 커밋하지 않아 값이 들어가지 않았다...  -->
	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>내용</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="vo">
				<tr>
					<td>${vo.bidx}</td>
					<td>${vo.title}</td>
					<td><a href="view.do?bidx=${vo.bidx}">${vo.content}</a></td>
					<td>${vo.wdate.substring(0,10)}</td>
				</tr>
			</c:forEach>			
		</tbody>	
	</table>
	<div>
		<ul >
			<c:if test="${page.prev}">
				<li><a href="list.do?page=${page.startPage - 1}&&searchType=${page.scri.searchType}&&keyWord=${page.encoding(page.scri.keyWord)}">이전</a></li>
			</c:if>
			<c:forEach begin="${page.startPage}" end="${page.endPage}" var="vo">
				<li><a href="list.do?page=${vo}&&searchType=${page.scri.searchType}&&keyWord=${page.encoding(page.scri.keyWord)}">${vo}</a></li>
			</c:forEach>
				<c:if test="${page.next && page.endPage > 0}">
					<li><a href="list.do?page=${page.endPage + 1}&&searchType=${page.scri.searchType}&&keyWord=${page.encoding(page.scri.keyWord)}">다음</a></li>
				</c:if> 
		</ul>
	</div>
	
	
	<form action="list.do" method="get">
		<select name="searchType">
			 <option value="title"<c:if test="${param.searchType eq 'title' }">selected</c:if>>제목</option>
			<option value="content"<c:if test="${param.searchType eq 'content' }">selected</c:if>>내용</option>	
		</select>		
		<input type="text" name="keyWord" value="${param.keyWord}">	
		<button>검색</button>	
	</form>
	<c:if test="${login != null }">
		<button onclick="location.href = 'write.do'">등록</button>
	</c:if>
</body>
</html>