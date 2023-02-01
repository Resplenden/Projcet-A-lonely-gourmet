<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>

<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.1.min.js"></script>
<script>

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
				
					$("#frm").submit();

				
			} 
		});//ajax
	
	}

</script>

</head>
<body>
	<h1>아이디 찾기</h1>

		<form action="find_id.do" name ="frm" id="frm" method="post" >
			<c:if test="${msg == false }">
			<span id="findingID" >찾으시는 아이디는 아이디가 없습니다</span> 
			</c:if> 
			<div>
				<label for="name">이름</label>
				<input type="text" name="name" id="name">
			</div>
			<div>
				<label for="email">이메일</label>
				<input type="email" name="email" id="email">
			</div>
				
			<button type="button" id="btn" onclick="findingID()">아이디확인</button>
			<button onclick="reset()">취소</button>
			<br>
			
			
		</form>

</body>
</html>