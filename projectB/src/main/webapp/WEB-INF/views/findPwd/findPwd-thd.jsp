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
    		var pwd = $("#pwd").val();
    		var pwd2 = $("#pwd2").val();
    		var reg=/^(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{5,10}$/;
    		
    		if(thd.pwd.value ==""){
    			alert("새 비밀번호를 입력해주세요.");
    			thd.pwd.focus();
    			return;
    		}
    		
    		if(!reg.test(pwd)) {
    		alert("비밀번호는 5~10자리 소문자, 숫자, 특수문자를 섞어 형식에 맞게 입력해주세요.");
    		return false;
    		}
    		
    		if(thd.pwd2.value == ""){
    			alert("비밀번호 확인을 입력해주세요.");
    			thd.pwd2.focus();
    			return;
    		}    
    		
    		if(!reg.test(pwd2)) {
        		alert("비밀번호는 4~10자리 소문자, 숫자, 특수문자를 섞어 형식에 맞게 입력해주세요.");
        		return false;
        	}
    		
    		if(thd.pwd.value != thd.pwd2.value){
    			alert("비밀번호가 일치하지 않습니다.")
    			return;
    		}else{
    			alert("비밀번호가 변경되었습니다.");
    		}
    		    		
    		thd.action = "<%=request.getContextPath()%>/find/findPwd-thd.do";
    		thd.method = "post"; //감춰서 넘기는 방식 Post
    		thd.submit();
    		
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
      <h1>&nbsp;비밀번호 초기화</h1>
      &nbsp;&nbsp;&nbsp;&nbsp;
      <p>새 비밀번호를 입력하세요.</p>
      <form  name="thd" id="newPwd">      
        <input
          type="password"
          name="pwd"
          id="pwd"
          class="newPwd"
          placeholder="새 비밀번호"
          onkeyup="if(window.event.keyCode==13){check()}"
        />
        <br />
        <input
          type="password"
          name="pwd2"
          id="pwd2"
          class="newPwdCk"
		  placeholder="비밀번호 확인"
		  onkeyup="if(window.event.keyCode==13){check()}"          
        />
        
        <button type="button" onclick="check()" name="pwdInit" class="pwdInit">        
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