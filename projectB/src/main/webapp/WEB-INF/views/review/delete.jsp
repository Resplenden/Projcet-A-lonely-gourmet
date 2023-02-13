<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 삭제</title>

<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.1.min.js"></script>	
<script>

$(document).ready(function(){

	$("#btn").click(function(){
		
		alert("진짜로 삭제하시겠습니까?");
		$("#delfrm").submit();
		
	});
});

</script>

</head>
<body>
	<h2>event 글쓰기</h2>
	
	<form action="delete.do" id="delfrm" name="delfrm" method="post">
		
		<input type="hidden" name="vidx" value="${vo.vidx }">
	</form>
	

</body>
</html>