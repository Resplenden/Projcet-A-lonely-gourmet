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
		var contents = $("#content").val();
		
		if(title == "") {
			alert("제목을 입력하세요.");
			$("#title").focus();
			return false;
		}
		
		if(content == "") {
			alert("내용을 입력하세요.");
			$("#content").focus();
			return false;
		}
		
		if(writer == "") {
			alert("작성자를 입력하세요.");
			$("#writer").focus();
			return false;
		}
		
		$("#writeForm").submit();
		
	});
});

</script>

</head>
<body>
	<h2>event 글쓰기</h2>
	
	<form action="write.do" id="writeForm" name="writeForm" method="post" enctype="multipart/form-data">
		<div>
			<label for="title">제목</label>
			<input type="text" name="title" id="title">
		</div>
		<div>
			<label for="content">내용</label>
			<textarea name="content" id="content"></textarea><br>
		</div>
		<div>
			<label for="writer">작성자</label>
			<input type="text" name="writer" id="writer">
		</div>
		<div>
			<label for="filename">파일</label>
			<input multiple="multiple" type="file" name="filename" id="filename">
			<input type="button" value="파일업로드">
		</div>		
		<button type="button" id="btn">저장</button>
		<button type="reset">취소</button>
	</form>
	

</body>
</html>