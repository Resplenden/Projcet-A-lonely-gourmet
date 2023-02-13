<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>혼밥의 고수 아이디 찾기</title>
	<link
      href="../resources/img/_꾸미기_혼밥의고수_파비콘-removebg-preview.png"
      rel="shortcut icon"
    />

<link href="${pageContext.request.contextPath}/resources/css/find_id.css" rel="stylesheet" />
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.1.min.js"></script>
</head>
<body>
<div id="inner">
<a href="#"
        ><img
          src="../resources/img/사본_-혼밥의고수_로고_초안_대지_1_사본-removebg-preview.png"
          width="350px"
        />
      </a>
      <h1>&nbsp;아이디 찾기</h1>
      <br/>
      
	
	
		<div id="findId">
		<br/>
			<label>'${name}'회원님이</label>
			<label>찾으시는 아이디는 '${id }' 입니다.</label>
		
		<br/>
		<br/>
		<br/>

		
		<button class="findId"><a href="<%= request.getContextPath() %>/find/findPwd-fir.do">비밀번호 찾기</a></button>
		<button class="findId"><a href="<%= request.getContextPath() %>/member/memberLogin.do">로그인</a></button>
	

</div>

	<!--end: form-->
	<p class="companyInfo">
 		혼밥의고수 &#124; 대표자: 고독한 미식가 &#124; 전주시 덕진구 백제대로
        572 4층 이젠컴퓨터아트서비스학원
        <br />
        © 2023 혼밥의 고수 Ltd. All rights reserved.
      </p>
      </div>
      <!--end: .companyInfo-->
	<!-- inner -->


</body>
</html>