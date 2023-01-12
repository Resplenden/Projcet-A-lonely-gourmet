<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>파일 업로드 페이지</h2>
	<form action="fileupload.do" method="post" enctype="multipart/form-data">
		제목 : <input type = "text" name="title">
		파일: <input type="file" name="uploadF1"><br>
		파일: <input type="file" name="uploadF2"><br>
		<button>업로드</button>
	</form>
</body>
</html>