<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	
	<h2>view 페이지</h2>
	<form>
	
	<table >
		<tr>
			<td>글제목</td>
			<td>${vo.title}</td>		
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
			<td>${vo.content}</td>		
		</tr>		
	</table>
	</form>
	<div>
		<ul>
			<c:forEach items="${reply}" var="reply">
			<li style="list-style:none">
				<div>
					<p>${reply.writer} / ${reply.rdate.substring(0,10)}</p>
					<p>	${reply.contents}	</p>
				</div>
			</li>
			</c:forEach>
		</ul>
	</div>
	
	<div>

	<form action="<%= request.getContextPath()%>/reply/replyWrite.do" method="post">	
		<p>
			<label>${login.name}</label>
		</p>
		<p>
			<textarea rows="5" cols="50" name="contents"></textarea>
		</p>
		<p>
			<input type="submit" value="댓글작성">
			<input type="text" name="bidx" value= "${vo.bidx}">
		</p>
	</form>
	
	</div>
	
	<button onclick="location.href='<%= request.getContextPath()%>/board/modify.do?bidx=${vo.bidx}'">수정</button>
	<%-- <button onclick="location.href='<%= request.getContextPath()%>/board/delete.do?bidx=${vo.bidx}'">삭제</button> --%>
	<button onclick="document.delfrm.submit();">삭제</button>
	<form name="delfrm" action="delete.do" method="post">
		<input type="hidden" name="bidx" value="${vo.bidx}">
	</form>
	<!-- 삭제버튼 클릭시 해당 데이터 삭제후 list 페이지로 리다이렉트 하세요. -->
</body>
</html>