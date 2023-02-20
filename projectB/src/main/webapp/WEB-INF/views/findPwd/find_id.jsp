<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script type="text/javascript">

	function findingID(){
		var name = $("#name").val();
		var email = $("#email").val();	
		
		if($("#name").val()==""){
			alert("이름을 입력해주세요.");
			return;
		}
		
		if($("#email").val()==""){
			alert("이메일을 입력해주세요.");
			return;
		}
		
		
		$.ajax({
			url:"findingID.do",
			type:"post",
			dataType : "json",
			data: 
			{
				name: name,
				email : email	
			},
			
			success:function(data) {
				
				if(data.name == 0) { 
					alert("등록되지 않은 회원입니다.");
					return;
				} 
				
				if(data.email == 0){
					alert("등록되지 않은 이메일입니다.");
					return;
				} 
				
				$("#findId").submit();

				
			} 
		});//ajax
	
	}


</script>
	
</head>
<body>
<div id="inner">
        <a href="${pageContext.request.contextPath}">
            <img
              src="../resources/img/사본 -혼밥의고수 로고 초안_대지 1 사본.png"
             width="350px">
          </a>
      <h1>&nbsp;아이디 찾기</h1>
		 &nbsp;&nbsp;&nbsp;&nbsp;
      <p>정보를 입력하세요.</p>
	

		<form action="find_id.do" name ="findId" id="findId" method="post" >
				
			<input type="text" name="name" id="name" class="name" placeholder="이름">
			<br />
			<input type="email" name="email" id="email" class="email" placeholder="이메일">
			<br /> 
			<button type="button" id="btn" class="findId" onclick="findingID()">아이디확인</button>
			<br/>
			<input type="button" class="cancel" value="취소" onclick="location.href='<%=request.getContextPath()%>'"/>
			<br/>
		</form>
		
		
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