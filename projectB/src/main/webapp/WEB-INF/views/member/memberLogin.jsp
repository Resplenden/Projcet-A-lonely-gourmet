<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>혼밥의 고수 로그인</title>
<link
      href="../resources/img/_꾸미기_혼밥의고수_파비콘-removebg-preview.png"
      rel="shortcut icon"
    />
    <!--파비콘-->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"
    />
    <!--카카오톡 아이콘-->
    <link href="${pageContext.request.contextPath}/resources/css/memberLogin.css" rel="stylesheet" />
</head>
  <body>
    <div id="inner">
      <a href="${pageContext.request.contextPath}"
        ><img
          src="../resources/img/사본_-혼밥의고수_로고_초안_대지_1_사본-removebg-preview.png"
          width="350px"
        />
      </a>
      <form action="login.do" method="post">
        <input type="text" name="id" class="id" placeholder="아이디" />
        <br />
        <input
          type="password"
          name="password"
          class="password"
          placeholder="비밀번호"
        />
        <!-- <br />
        <p>올바르지 않은 아이디/비밀번호입니다.</p> -->
        <input type="checkbox" class="chkId" name="chk_id" />
        <label for="chk_id">아이디 저장</label>
        <button type="submit" name="login" class="login">로그인</button>
        <button name="kakaoLogin" type="button" onclick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=0c4af53abdedaf0c73af2ec8b352e10c&redirect_uri=http://192.168.0.20:8090/controller/member/logindone.do&response_type=code';" class="kakaoLogin">
          <i class="xi-kakaotalk xi-2x"></i>&nbsp;&nbsp;&nbsp;카카오톡으로
          로그인
        </button>
        <ul class="subMenu">
          <li><a href="#">회원가입</a></li>
          <li><a href="#">아이디 찾기</a></li>
          <li><a href="<%=request.getContextPath()%>/findPwd/findPwd-fir.do">비밀번호 찾기</a></li>
        </ul>
      </form>
      <!--end: form-->
      <footer>
        <div id="footerMenu">
          <ul>
            <li><a href="#">팀 소개</a></li>
            &#124;
            <li><a href="#">개인정보처리방침</a></li>
            &#124;
            <li><a href="#">이용약관</a></li>
            &#124;
            <li><a href="#">도움말</a></li>
            &#124;
            <li><a href="#">공지사항</a></li>
          </ul>
        </div>
        <!--end: #footerMenu-->
        <p class="companyInfo">
          혼밥의고수 &#124; 대표자: 고독한 미식가 &#124; 전주시 덕진구 백제대로
          572 4층 이젠컴퓨터아트서비스학원
          <br />
          © 2023 혼밥의 고수 Ltd. All rights reserved.
        </p>
        <!--end: .companyInfo-->
      </footer>
      <!--end: footer-->
    </div>
    <!--end: #inner-->
  </body>
</html>