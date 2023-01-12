<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>board/write 페이지</h2>
	<!-- http://localhost:8009/controller/board.write.do -->
	<!-- http://localhost:8009/controller/board.writeAction.do -->
	<!-- http://localhost:8009/controller/board.writeAction.do -->
	<form action="write.do" method="post">
	<!-- 절대경로로 쓸시 바로 도메인다음으로 나오기떄문에 /writeAction.do 는 localhots:8009/writeAction.do가된다. -->
		제목 : <input type="text" name="title"><br>
		작성자 : <input type="text" value="${login.name}" readonly><br>
		내용 : <textarea name="content"></textarea><br>
		
		<button>저장</button>
		<!-- 버튼은 부모의 태그에 따라 타입이 바뀐다.(form태그로 인해 submit기능을 기본으로 가진다. -->
	</form>
</body>
</html>