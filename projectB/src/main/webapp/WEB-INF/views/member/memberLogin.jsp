<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.1.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/cookie.js"></script>
<script>

function loginCheck(){

	var frm = document.frm;
    var idVal = $("#id").val();
    var pwdVal = $("#pwd").val();  
    
    if(idVal =="") {
    	alert("아이디를 입력해주세요.");
    	return;
    }
    
    if(pwdVal =="") {
    	alert("비밀번호를 입력해주세요.");
    	return;
    }


    $.ajax({
       url : "<%=request.getContextPath()%>/member/loginCheck.do",
       type : "post",
       data : {"id":idVal, "pwd":pwdVal},
       dataType : "json",
       success:function(data)
       {
        	if(data == 0)
        	{
        		alert("아이디나 비밀번호가 일치하지 않거나 이미 탈퇴한 회원입니다.");
        		id = "";
        		pwd = "";
        	} else if(data == 1)
        	{
        		alert("로그인성공");
	            frm.action ="<%=request.getContextPath()%>/member/memberLogin.do";
	            frm.method="post"; 
	            frm.submit();
        	}
    	},
    	error: function(request,status,error)
    	{
    		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    	}
    });
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
      <form action="memberLogin.do" name="frm" method="post">
        <input type="text" id="id" name="id" class="id"  placeholder="아이디" />
        <br />
        <input
          type="password"
          id="pwd"
          name="pwd"
          class="password"
          placeholder="비밀번호"
          onkeyup="if(window.event.keyCode==13){loginCheck()}"
        />
        <!-- <br />
        <p>올바르지 않은 아이디/비밀번호입니다.</p> -->
        <input type="checkbox" class="chkId" id="save_id" name="save_id" value="true"  />
        <label for="save_id">아이디 저장</label>
        <button type="button" name="login" class="login" onclick="loginCheck()">로그인</button>
        
        
        <button name="kakaoLogin" type="button" onclick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=78ddd6c305488a31abc2fc79ad6af5c5&redirect_uri=http://localhost:8090/controller/kakao/logindone.do&response_type=code';" class="kakaoLogin">
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