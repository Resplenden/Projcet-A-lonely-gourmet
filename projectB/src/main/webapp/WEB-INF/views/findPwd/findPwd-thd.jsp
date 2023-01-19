<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>혼밥의 고수 비밀번호 찾기</title>
    <link
      href="../resources/img/_꾸미기_혼밥의고수_파비콘-removebg-preview.png"
      rel="shortcut icon"
    />
    <!--파비콘-->
    <link href="${pageContext.request.contextPath}/resources/css/findPwd.css" rel="stylesheet" />
</head>
<body>
	 <div id="inner">
      <a href="#"
        ><img
          src="../resources/img/사본_-혼밥의고수_로고_초안_대지_1_사본-removebg-preview.png"
          width="350px"
        />
      </a>
      <h1>&nbsp;비밀번호 초기화</h1>
      &nbsp;&nbsp;&nbsp;&nbsp;
      <p>새 비밀번호를 입력하세요.</p>
      <form action="findPwd-thd.do" method="post" id="newPwd">
      
        <input
          type="password"
          name="password"
          class="newPwd"
          placeholder="새 비밀번호"
        />
        <br />
        <input
          type="password"
          name="password2"
          class="newPwdCk"
          onchange="isSame();"	
          placeholder="비밀번호 확인"          
        />
        <span id=same></span>
        <button type="submit" name="pwdInit" class="pwdInit">        
          비밀번호 변경
        </button>
        <input type="hidden" name="email" value="${email}">
      </form>
      <!--end: form-->
      <p class="companyInfo">
        혼밥의고수 &#124; 대표자: 고독한 미식가 &#124; 전주시 덕진구 백제대로
        572 4층 이젠컴퓨터아트서비스학원
        <br />
        © 2023 혼밥의 고수 Ltd. All rights reserved.
      </p>
      <!--end: .companyInfo-->
    </div>
</body>
</html>