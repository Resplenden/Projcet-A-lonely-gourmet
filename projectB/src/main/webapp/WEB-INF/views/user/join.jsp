<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
	function check(){
		var fm = document.frm;
		
		if(fm.id.value == ""){
			alert("아이디를 입력해주세요.");
			fm.id.focus();
			return;
		}
		if(fm.password.value ==""){
			alert("비밀번호를 입력해주세요.");
			fm.password.focus();
			return;
		}
		if(fm.password2.value ==""){
			alert("비밀번호 확인을 입력해주세요.");
			fm.password2.focus();
			return;
		}
		if(fm.password.value != fm.password2.value){
			alert("비밀번호가 일치하지 않습니다.");
			fm.password2.focus();
			return;
		}
		if(fm.name.value == ""){
			alert("이름을 입력해 주세요");
			fm.name.focus();	
			return;
		}
		if(fm.name.value == ""){
			alert("이름을 입력해 주세요");
			fm.password2.focus();
			return;
		}
		if(fm.addr.value == ""){
			alert("주소를 입력해 주세요");
			fm.addr.focus();	
			return;
		}
		if(fm.phone.value == ""){
			alert("연락처를 입력해 주세요");
			fm.phone.focus();	
			return;
		}
		if(checkDupl()!=true){//아이디 중복체크가 거짓일때 실행되는 로직이다.
			alert("아이디 중복체크를 해주세요.");			
			obj = fm.id.value();//obj defined가 나온이유는 check()에서 obj를 값을 넣어주지 않았기에 생기는 오류이다. 그러므로 obj값을 선언해주어야 한다.
			var flag = blurID(obj);//flag에 blurId(obj);를 넣어준다. obj값이 생성되었기에 가능하다.
			if (flag == false)	{/* flag가 거짓일시 발생하는 로직이다. return까지 if구문을 실행한다.
							 true일시 이 로직은 발생하지않고 그냥 넘어가서 fm.action,fm.method,fm.submit순으로 실행된다.
								 flag if 구문은 */
				alert("아이디가 중복되었습니다.");
				return;
			}			
		}		
			
		fm.action = "<%=request.getContextPath()%>/user/join.do";
		fm.method = "post"; //감춰서 넘기는 방식 Post
		fm.submit();
		
		return;
	}
	var idCheckFlag = false;
	var idCheckVal = "";
	function idCheck(){
		var id = $("#id").val();
		
		$.ajax({
			url:"idCheck.do",
			type:"post",
			data:"id="+id,
			success:function(result){
				if(id != ""){
					if(result == 1){
						alert("중복된 아이디입니다.");
						idCheckFlag = false;
						idCheckVal = "";						
					}else{
						alert("사용가능한 아이디입니다.");
						idCheckFlag = true;
						idCheckVal = id;
					}
				}else{
					alert("아이디는 공백일 수 없습니다.");
				}
			}
			
		});
	}	
	
	function checkDupl(){
		if(!idCheckFlag){
			
			return false;
		}else if($("#id").val() == ""){			
			return false;
		}else{
			return true;
		}
	}	
		
	function blurId(obj){	
		var val = obj.value;
		
		if(idCheckFlag && val != idCheckVal){
			idCheckFlag = false;
		}
		
	}	
</script>
</head>
<body>
	<h2>회원가입 페이지</h2>	
	<form name="frm">	
		아이디 : <input type="text" name="id" id="id" onblur="blurId(this)"><button type="button" onclick="idCheck()">중복체크</button><br>
		비밀번호 : <input type="password" name="password" id="password"><br>
		비밀번호 확인 : <input type="password" name="password2" id="password2"><br>
		닉네임 : <input type="text" name="name" id="name"><br>
		주소 : <input type="text" name="addr" id="addr"><br>
		연락처 : <input type="number" name="phone" id="phone"><br>		
		<button type="button" onclick="check()">가입</button>
		<!-- 버튼은 부모의 태그에  따라 타입이 바뀐다.(form태그로 인해 submit기능을 기본으로 가진다. -->
	</form>
</body>
</html>