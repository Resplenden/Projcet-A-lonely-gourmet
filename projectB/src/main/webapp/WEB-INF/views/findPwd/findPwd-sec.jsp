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
    <script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.1.min.js" ></script>
    <script type="text/javascript">
    	function check(){
    		
    		if(sec.confirmNum.value == ""){
    			alert("인증번호를 입력해주세요.");
    			return;
    		}
    		
    		if(sec.confirmNum.value != sec.num.value){
    			alert("인증번호가 일치하지 않습니다.");
    			return;
    		}
    		if(sec.confirmNum.value == sec.num.value){
    			alert("인증번호가 일치합니다.");
    		}
    		
    		sec.action = "<%=request.getContextPath()%>/find/findPwd-sec.do";
    		sec.method = "post"; //감춰서 넘기는 방식 Post
    		sec.submit();
    		
    		return;
    	}
    
    
    </script>
</head>
<body>
<div id="inner">
      <a href="${pageContext.request.contextPath}"
        ><img
          src="../resources/img/사본_-혼밥의고수_로고_초안_대지_1_사본-removebg-preview.png"
          width="350px"
        />
      </a>
      <h1>&nbsp;인증번호 입력</h1>
      &nbsp;&nbsp;&nbsp;&nbsp;
      <p>이메일이 발송되었습니다. 인증번호를 입력하세요.</p>
      <form  name="sec" id="pwdConfirm" onsubmit="return false;">
      <input type="hidden" name ="num" value="${num}">
        <input
          type="password"
          name="confirmNum"
          class="confirmNum"
          placeholder="인증번호"
          onkeyup="if(window.event.keyCode==13){check()}"
        />
        <button type="button" onclick="check()" name="findPwd" class="findPwd">
          인증번호 확인
        </button>
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