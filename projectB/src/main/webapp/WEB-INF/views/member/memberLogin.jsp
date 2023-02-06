<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<script>

$(function(){
	var id = getCookie("str_id");
	
	if(id) {
		$("#id").val(id);
		$("#save_id").attr("checked", true);
	}	
});

function login(){
	var id = $("#id").val();
	var idChk = $("#save_id").is(":checked");
	
	if(id == "") {
		alert("아이디를 입력하세요");
		$("#id").focus();
		return;
	}
	
	if(pwd == "") {
		alert("비밀번호를 입력하세요.");
		$("#pwd").focus();
		return;
	}
	
	if(idChk) {
		setCookie("str_id", id, 7);
	} else {
		deleteCookie("str_id");
	} 
		$("#loginForm").submit();

	
}

//쿠키 저장하기
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
  
//쿠키삭제  
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
  
//쿠키 가져오기  
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){ //쿠키가 존재한다면
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length; //쿠키값의 마지막 위치 인덱스 번호 설정
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}
</script>    


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
      <form action="memberLogin.do" method="post">
        <input type="text" id="id" name="id" class="id" value="${inputId }" placeholder="아이디" />
        <br />
        <input
          type="password"
          id="pwd"
          name="pwd"
          class="password"
          placeholder="비밀번호"
        />
        <!-- <br />
        <p>올바르지 않은 아이디/비밀번호입니다.</p> -->
        <input type="checkbox" class="chkId" id="save_id" name="save_id" value="true" ${checked}  />
        <label for="save_id">아이디 저장</label>
        <button type="submit" name="login" class="login" onclick="login()">로그인</button>
        
        <c:if test="${msg == false }">
			alert("아이디와 비밀번호를 다시 입력해주세요");
			<p style="color:red;">아이디와 비밀번호를 다시 입력해주세요.</p>
		</c:if>
        
        
        <button name="kakaoLogin" type="button" onclick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=0c4af53abdedaf0c73af2ec8b352e10c&redirect_uri=http://localhost:8090/controller/kakao/logindone.do&response_type=code';" class="kakaoLogin">
          <i class="xi-kakaotalk xi-2x"></i>&nbsp;&nbsp;&nbsp;카카오톡으로
          로그인
        </button>
         <button type="button" name="naverLogin" class="naverLogin" onclick="location.href='${urlNaver}'">
          <i class="xi-naver-square xi-2x"></i>&nbsp;&nbsp;&nbsp;네이버로 로그인
        </button>
        <ul class="subMenu">
          <li><a href="<%=request.getContextPath()%>/member/memberJoin.do">회원가입</a></li>
          <li><a href="<%=request.getContextPath()%>/find/find_id.do">아이디 찾기</a></li>
          <li><a href="<%=request.getContextPath()%>/find/findPwd-fir.do">비밀번호 찾기</a></li>
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