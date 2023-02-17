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
	<h2>review 목록</h2>
	<form action="list.do" method="get"> <!-- url을 넘기는 방식 -->
		<select name="searchType">
			<option value = "title" <c:if test="${param.searchType eq 'title'}">selected</c:if>>제목</option>
			<option value = "content"<c:if test="${param.searchType eq 'content' }">selected</c:if>>내용</option>
			<option value = "writer"<c:if test="${param.searchType eq 'writer' }">selected</c:if>>닉네임</option>
		</select>
		<input type="text" name="searchVal" value="${param.searchVal }">
		<button>검색</button>
		
		<input type="hidden" name="page" value="1">
		<input type="hidden" name="displayPageNum" value="10">
	</form>

	
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
				<td>${vo.vidx}</td>
				<td><a href="view.do?vidx=${vo.vidx}">${vo.title}</a></td>
				<td>${vo.writer}</td>
				<td>${vo.hit}</td>
				<td>${vo.wdate }</td>
			</tr>
		</c:forEach>
		</table>
		
		<br/>
		<c:if test="${login != null}">
		<a href="<%=request.getContextPath()%>/review/write.do">글쓰기</a>
		</c:if>
		<br/>
	 <div class="pager">
          	<ul class="pagination">
			<!-- 이전 페이지 -->	
			<c:if test="${pageMaker.prev}">
				<a href="<%=request.getContextPath() %>/review/list.do?page=${pageMaker.startPage-1}&perPageNum=${searchVo.perPageNum}&searchType=${searchVo.searchType}&searchVal=${searchVo.searchVal}">◀</a>
			</c:if>
			<!-- 현재 페이지 -->	
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
				<c:choose>
					<c:when test="${pageMaker.endPage == 0}">
					<p></p>
					</c:when>
					<c:when test="${num == searchVo.page}">
						<b>${num}</b>
					</c:when>
					<c:when test="${num != searchVo.page }">
						<a href="<%=request.getContextPath() %>/review/list.do?page=${num}&perPageNum=${searchVo.perPageNum}&searchType=${searchVo.searchType}&searchVal=${searchVo.searchVal}">${num}</a>
					</c:when>
				</c:choose>
			</c:forEach>
			<!-- 다음 페이지 -->	
			<c:if test="${pageMaker.next}">
				<a href="<%=request.getContextPath() %>/review/list.do?page=${pageMaker.endPage+1}&perPageNum=${searchVo.perPageNum}&searchType=${searchVo.searchType}&searchVal=${searchVo.searchVal}">▶</a>
			</c:if>
			</ul>
          </div>
          <!--end: .pager-->
	


</body>
</html>