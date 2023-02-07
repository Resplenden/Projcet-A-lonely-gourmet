<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>event 글쓰기</title>

<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.1.min.js"></script>	
<script>

$(document).ready(function(){

	$("#btn").click(function(){
		
		var title = $("#title").val();
		var contents = $("#contents").val();
		var writer = $("#writer").val();
		
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
		
		if(writer == "") {
			alert("작성자를 입력하세요.");
			$("#writer").focus();
			return;
		}
		$("#writeForm").submit();
		
	});
});

</script>

</head>
<body>
	<h2>event 글쓰기</h2>
	
	<form action="write.do" id="writeForm" name="writeForm" method="post">
		<div>
			<label for="title">제목</label>
			<input type="text" name="title" id="title">
		</div>
		<div>
			<label for="contents">내용</label>
			<textarea name="contents" id="contents"></textarea><br>
		</div>
		<div>
			<label for="writer">작성자</label>
			<input type="text" name="writer" id="writer" value="${login.id}" >
		</div>
				
		<button type="button" id="btn">저장</button>
		<button type="reset">취소</button>
	</form>
	

</body>
</html>