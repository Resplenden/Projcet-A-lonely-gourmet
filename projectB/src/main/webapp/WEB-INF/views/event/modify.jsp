<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>event 수정</title>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.1.min.js"></script>	
<script>

$(document).ready(function(){

	$("#btn").click(function(){
		
		var title = $("#title").val();
		var contents = $("#contents").val();
		
		if(title == "") {
			alert("제목을 입력하세요.");
			$("#title").focus();
			return;
		}
		
		if(contents == "") {
			alert("내용을 입력하세요.");
			$("#contents").focus();
			return;
		}
		
		$("#modifyForm").submit();
		
	});
});

</script>

</head>
<body>
	<h2>event 수정</h2>
	<form action="modify.do" id="modifyForm" name="modifyForm" method="post">
	<input type="hidden" name="eidx" value="${vo.eidx }">
	<table border="1">
		
		<tr>
			<th>글제목</th>
			<td><input type="text" id="title" name="title" value="${vo.title }"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="contents" id="contents">${vo.contents }</textarea></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${vo.writer }</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${vo.rec }</td>
		</tr>
		<tr>
			<th>작성날짜</th>
			<td>${vo.wdate }</td>
		</tr>
		
	</table>
	
	<button type="button" id="btn">수정</button>
		
	</form>
		
	
</body>
</html>