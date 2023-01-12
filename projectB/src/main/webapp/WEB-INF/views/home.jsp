<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!   afdsferweqfw
</h1>

<P>  The time on the server is ${serverTime}. </P>
<a href="<%= request.getContextPath()%>/test.do">test 경로 이동!</a>
<!-- 위 링크를 클릭햇을 대 views 폴더에 있는 sample.jsp가 포워드 되도록 구현하세요. -->
<hr>
${uin}님 환영합니다.
<a href="<%= request.getContextPath()%>/board/list.do">board/list.do</a>
<a href="<%= request.getContextPath()%>/board/view.do">board/view.do</a>
<a href="<%= request.getContextPath()%>/board/write.do">board/write.do</a>
<hr>
<a href="<%= request.getContextPath()%>/user/list.do">user/list.do</a>

<hr>
<a href="<%= request.getContextPath()%>/oper/calc.do">계산기 바로가기</a>
<hr>
<c:if test="${login == null }">
<a href="<%= request.getContextPath()%>/user/login.do">login하러 가기!</a>
<a href="<%= request.getContextPath()%>/user/join.do">회원가입</a>
<a href="<%= request.getContextPath()%>/kakao/login.do">카카오login하러 가기!</a>
<a href="<%= request.getContextPath()%>/kakao/view.do">지도 가기!</a>
</c:if>

<c:if test="${login != null }">
<a href="<%= request.getContextPath()%>/user/logout.do">logout하러 가기!</a>
</c:if>

<a href="<%= request.getContextPath()%>/ajax/main.do">통신하러 가기!</a>
<hr>
${login.name}님 환영합니다!
<hr>
<a href="<%= request.getContextPath()%>/fileupload.do">파일업로드</a>
</body>
</html>
