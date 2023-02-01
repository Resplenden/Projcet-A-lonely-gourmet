<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기</title>
</head>
<body>
	
	
	
		<label>'${name}'회원님</label>
		<label>찾으시는 아이디는 '${id }' 입니다.</label>
	
	<br>
	<a href="<%= request.getContextPath() %>/member/memberLogin.do">로그인</a>

</body>
</html>