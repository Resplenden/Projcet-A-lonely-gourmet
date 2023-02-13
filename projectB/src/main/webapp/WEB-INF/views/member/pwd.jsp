<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script>

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
       if (flag == false)   {/* flag가 거짓일시 발생하는 로직이다. return까지 if구문을 실행한다.
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


//비밀번호 일치 확인
$("#pwd").blur(function{
	if($("#pwd").val() != $("#pwdCfm").val()) {
		$("#pwdCk_check").text("비밀번호가 일치하지 않습니다.");
		$("#pwdCk_check").css("color","red");
	} else {
		$("#pwdCk_check").text("");
	}
});



/*비밀번호 일치확인*/
$('#pwdCfm').focusout(function () {
	var pwdReg=/^(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{4,10}$/;
	var pwdCfmReg=/^(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{4,10}$/;
	
	var pwd = $("#pwd").val();
	var pwdCfm = $("#pwdCfm").val();
 	
  if (pwdReg.test($("#pwd").val()) == pwdCfmReg.test($("#pwdCfm").val())) {
      $('#pwdCk_check').text('비밀번호가 일치합니다.');
      $('#pwdCk_check').css('color', 'green');
      checkPwdCkFlag = true;
           
   } else {
	   //alert("비밀번호가 일치하지 않습니다.");
       $('#pwdCk_check').text("비밀번호가 일치하지 않습니다.");
       $('#pwdCk_check').css('color', 'red');
       checkPwdCkFlag = false;
       return;
   }	
  
  if($("#pwd").val() != $("#pwdCfm").val()) {
		$("#pwdCk_check").text("비밀번호가 일치하지 않습니다.");
		$("#pwdCk_check").css("color","red");
	} else {
		$("#pwdCk_check").text("");
	}
  	
});



//비밀번호
$("#pwd").blur(function(){
	var pwd = $("#pwd").val();
	//var pwdReg =/^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]){4,10}$/;
	var pwdReg=/^(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{4,10}$/;
	
	if(pwd !=null) {
		//비밀번호 입력
		//정규식 검사를 함
		if (pwdReg.test($(this).val())) {
			//alert("알맞은 형식입니다");
			//비밀번호가 형식에 맞다면
			checkPwdFlag = true; 
			checkPwdRegFlag = true;
			
			
		} else {
			//비밀번호가 형식에 맞지 않은 경우
			//alert("비밀번호는 4자리 이상 8자리 소문자,숫자, 특수문자를 이용해 만들어주세요");
			$('#pwd_check').text('비밀번호는 4자리 이상 8자리 소문자, 숫자, 특수문자를 이용해 만들어주세요.');
			$('#pwd_check').css('color', 'red');
			//$("#pwd").focus();
			checkPwdFlag = false;
			checkPwdRegFlag = false;
			$("#pwd").focus();
			return;
		} 
	}	
    
});

$("#pwdCfm").blur(function(){
	var pwdCfm = $("#pwdCfm").val();
	//var pwdReg =/^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]){4,8}$/;
	var pwdCfmReg=/^(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{4,10}$/;
	
	if(pwdCfm !=null) {
		//비밀번호 입력
		//정규식 검사를 함
		if (pwdCfmReg.test($(this).val())) {
			//alert("알맞은 형식입니다");
			//비밀번호가 형식에 맞다면
			checkPwdCfmFlag = true; 
		} else {
			//비밀번호가 형식에 맞지 않은 경우
			//alert("비밀번호는 4자리 이상 8자리 소문자,숫자, 특수문자를 이용해 만들어주세요");
			$('#pwdCk_check').text('비밀번호는 4자리 이상 8자리 소문자,숫자, 특수문자를 이용해 만들어주세요');
			$('#pwdCk_check').css('color', 'red');
			//$("#pwd").focus();
			checkPwdCfmFlag = false;
			return;
		} 
		
	if(pwd != pwdCfm) {
		$("#pwdCk_check").text("비밀번호가 일치하지 않습니다.");
		$("#pwdCk_check").css("color","red");
	}	
	
	}
	
    
});








</script>

</body>
</html>