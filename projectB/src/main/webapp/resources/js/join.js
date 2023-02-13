var checkIdFlag = false; //아이디를 체크했는지 확인하는 변수
var checkPwdFlag = false;
var checkpwdCfmFlag = false;
var checkNameFlag = false;
var checkPhoneFlag = false;
var checkBirthFlag = false;
var checkNickFlag = false;
var checkEmailFlag = false;
var checkGenderFlag = false;
var checkphChkFlag = false;
var checkphChk2Flag = false;

var checkPwdRegFlag = false;
var checkPwdCfmRegFlag = false;

var checkIdVal = "";
var checkNickVal = "";
var checkEmailVal = "";

$(function(){
		$("form").submit(function(){
			
			/* 아이디 */
			var id = $("#id").val();
			if(id == "") {
				alert("아이디를 입력하세요.");
				$("#id").focus();
				checkIdFlag = false;
				return false;

			} else if(!checkIdFlag) {
				alert("아이디 중복확인을 해주세요.");
				checkIdFlag = false;
				return false;
			}
			

			/* 비밀번호 */
			var pwd = $("#pwd").val();
			if(pwd == ""){
				alert("비밀번호를 입력하세요.");
				$('#pwd_check').text('비밀번호를 입력해주세요.');
				$('#pwd_check').css('color', 'red');
				//$("#pwd").focus();
				checkPwdFlag = false;
				return false;
			}
			
			/* 비밀번호 확인  */
			var pwdCfm = $("#pwdCfm").val();
			if(pwdCfm == ""){
				alert("비밀번호 확인을 입력하세요.");
				$("#pwdCfm").focus();
				checkpwdCfmFlag = false;
				return false;
			}
		
			
			/* 이름 */
			var name = $("#name").val();
			if(name == "") {
				alert("이름을 입력하세요.");
				$("#name").focus();
				checkNameFlag = false;
				return false;
			}
			
			/* 닉네임  */
			var nick = $("#nickname").val();
			if(nick == "") {
				alert("닉네임을 입력하세요.");
				$("#nickname").focus();
				checkNickFlag = false;
				return false;
			} else if(!checkNickFlag) {
				alert("닉네임 중복확인을 해주세요.");
				checkNickFlag = false;
				return false;
			} 
			
			/* 생일 */
			var birth = $("#birth").val();
			if(birth == "") {
				alert("생일을 입력하세요.");
				checkBirthFlag = false;
				return false;
			}
			
			/* 성별*/
			var gender = $("#gender").val();
			if(gender == "") {
				alert("성별을 확인해 주세요.");
				checkGenderFlag = false;
				return false;
			} 
			
			/* 핸드폰번호 */
			var phone = $("#phone").val();
						
			if(phone == "") {
				alert("연락처를 입력해주세요.");
				checkPhoneFlag = false;
				return false;
			} 
			
			var phone2 = $("#phone2").val();
			
			if(phone2 == "") {
				alert("인증번호를 입력해주세요.");
				checkphChk2Flag = false;
				return false;
			} 
			
			/* 이메일 */
			var email = $("#email").val();
			if(email == "") {
				alert("이메일을 입력하세요.");
				checkEmailFlag = false;
				return false;
			} else if(!checkEmailFlag) {
				alert("이메일 중복확인을 해주세요.");
				checkEmailFlag = false;
				return false;
			} 
		

			/* 최종 유효성 검사 */
			
		});
	})
	
	/*아이디 중복검사*/
//공백을 아이디로 인식...  
function checkId(){
	var idval = $("#id").val();
	var idReg =/^[a-z0-9_-]{5,10}$/;
	
	if(idval == "") {
		$('#id_check').text('아이디를 입력하세요.');
		$('#id_check').css('color', 'red');
		return;
	}
	
	// 아이디 입력값이 있어
	// 정규식 검사를 해서, 올바르지 않은 형식이면
	// 형식에 맞지 않습니다. 메세지를 띄우고
	// 아이디 입력하는 인풋으로 포커스 이동
	// 리턴
		
	if (idReg.test($("#id").val())) {
		//이름이 형식에 맞다면
		$("#id_check").text("사용가능한 id입니다. 중복체크를 해주세요.");
		checkIdFlag = true; 
	} else {
		//아이디가 형식에 맞지 않은 경우
		$('#id_check').text('아이디는 4~10자 소문자, 숫자를 사용하세요.');
		$('#id_check').css('color', 'red');
		$("#id").focus();
		checkIdFlag = false;
		return;
	}
	// 아이디도 입력되어있고, 형식도 맞으니 중복검사를 할 차례
	// ajax -> 사용가능, 중복 
	
	$.ajax({
		url : "checkId.do",
		type: "post",
		data: "id="+idval,
		success:function(data){

			if(data == 1) {
				$('#id_check').text("중복된 아이디입니다.");
				$('#id_check').css('color', 'red');
				$("#id").focus();
				checkIdFlag = false;
				checkIdVal = "";
				return;
			}  
			
			if(data == 0) {
				$('#id_check').text("사용가능한 아이디입니다.");
				$('#id_check').css('color', 'green');
				checkIdFlag = true;
				checkIdVal = idval;
				
			}
		}
	});	
}


/* 휴대폰 문자 인증 */
 var code2="" 
	function phChk(){
	   var phone = $("#phone").val();
	  	if(phone == ""|| phone == null) {
	  		alert("핸드폰번호를 입력하세요.");
	  		return;
	  	}
	  	  	
		alert('인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.');
		
		 $.ajax({
		        type:"POST", // post 형식으로 발송
		        url:"<%=request.getContextPath()%>/member/sendSMS1.do", // controller 위치
		        data: {phone:phone}, // 전송할 데이터값
		        cache : false,
		        success:function(data){
		            if(data == "error"){ //실패시 
		                alert("휴대폰 번호가 올바르지 않습니다.")
		            }else{            //성공시        
		                alert("인증번호가 전송되엇습니다.")
		                code2 = data; // 성공하면 데이터저장
		            }
		        }
		        
		    });
		};
	function phChk2(){
		
		var phone2 = $("#phone2").val();
		
		if(phone2 == "") {
			$('#phone2_check').text('인증번호를 입력하세요.');
			$('#phone2_check').css('color', 'red');
			return;
		}
		
		
		 if($("#phone2").val() == code2){ // 위에서 저장한값을 ㅣ교함
			$('#phone2_check').text('인증성공');
			$('#phone2_check').css('color', 'green');
	      }else{
	    	  	$('#phone2_check').text('인증이 실패했습니다. 다시 시도해주세요');
				$('#phone2_check').css('color', 'red');
	          return;
	      }
	}
 
 

 /* 닉네임 중복검사 */
function checkNick(){
	var nickVal = $("#nickname").val();
	var nickReg=/^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,16}$/;
	
	if(nickVal == "") {
		$('#nick_check').text("닉네임을 입력하세요.");
		$('#nick_check').css('color', 'red');
		return;
	}
	if(reg.test($(this).val())){
		$("#nick_check").text("멋진 닉네임이예요.");
		$("#nick_check").css('color','green');
		checkNickFlag=true;
	}else {
		$("#nick_check").text("중복된 닉네임입니다.");
		$("#nick_check").css("color","red");
		checkNickFlag = false;
		return;
		
	}
	
		$.ajax({
			url : "<%=request.getContextPath()%>/member/checkNick.do",
			type: "post",
			data: "nickname="+nickVal,
			success:function(data){

				if(data == 1){
					$('#nick_check').text("중복된 닉네임입니다.");
					$('#nick_check').css('color', 'red');
					checkNickFlag = false;
					checkNickVal ="";
					return;
				}
				if (data == 0){
					$('#nick_check').text("사용가능한 닉네임입니다.");
					$('#nick_check').css('color', 'green');
					checkNickFlag = true;
					checkNickVal = nickVal;
				} 
		}
	});
	
}
 
/* 이메일 중복검사  */
 function checkEmail() {
	var emailVal = $("#email").val();
	var emailReg = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i; 
				
	if(emailVal == "") {
		alert("이메일을 입력하세요");
		return;
	}
	
	if(emailReg.test($(this).val())) {
		//alert("사용가능한 이메일입니다");
		$("#email_check").text('');
		checkEmailFlag = true;
		
	} else {
		//alert("형식에 맞지 않습니다");
		$('#email_check').text('이메일을 확인해주세요.');
		$('#email_check').css('color', 'red');
		$("#email").focus();
		checkEmailFlag = false;
		return;
	}	
		
		$.ajax({
			url : "<%=request.getContextPath()%>/member/checkEmail.do",
			type:"post",
			data: "email="+emailVal,
			success:function(data) {
				
				if(data == 1) {
					//result == 1
					$('#email_check').text("이미 가입된 이메일입니다.");
					$('#email_check').css('color', 'red');
					checkEmailFlag = false;
					checkEmailVal ="";
					return;
				} else {
					$('#email_check').text("사용가능한 이메일입니다.");
					$('#email_check').css('color', 'green');
					checkEmailFlag = true;
					checkEmailVal = emailVal;
				}
			}
	});

}


$('#id').on(function(){
	var id =  $("#id").val();
	 
	if(id == "") {
		$('#id').text('id를 입력하세요.');
	    $('#id_check').css('color', 'red');
	    $("#id").focus();
	    return;
	} 
 });

/*정규식 검사 */
//아이디
$("#id").on("input",function(){
	var id = $("#id").val();
	var idReg =/^[a-z0-9_-]{5,10}$/;
	
	if(id == null) {
		//아이디가 공백일 경우
		$('#id_check').text('아이디를 입력해주세요.');
		$('#id_check').css('color', 'red');
		checkIdFlag = false; //아이디를 체크했는지 확인하는 변수
	} else {
		//아이디 입력
		//정규식 검사를 함
		if (idReg.test($(this).val())) {
			//이름이 형식에 맞다면
			console.log(idReg.test($(this).val()));
			$("#id_check").text("사용가능한 id입니다. 중복체크를 해주세요.");
			checkIdFlag = true; 
		} else {
			//아이디가 형식에 맞지 않은 경우
			$('#id_check').text('아이디는 4~10자 소문자, 숫자를 사용하세요.');
			$('#id_check').css('color', 'red');
			//$("#id").focus();
			checkIdFlag = false;
			return;
		}
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
		if (pwdReg.test($(this).val())) {
			$('#pwd_check').text('');

			checkPwdFlag = true; 
			checkPwdRegFlag = true;
		}
	}	
	
	
    
});

$("#pwdCfm").blur(function(){
	var pwd = $("#pwd").val();
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
	} else {
		$("#pwdCk_check").text("비밀번호가 일치");
		$("#pwdCk_check").css("color","green");
		}
	}
});



//한글이름만
$("#name").blur(function(){
	var name = $("#name").val();
	var nameReg = /^[가-힣]{2,6}$/;
			
	if(name == "") {
		//이름을 입력했는지
		$('#name_check').text('이름을 입력해주세요.');
		$('#name_check').css('color', 'red');
	} else {
		//이름을 입력
		//정규식 검사를 함
		if (nameReg.test($(this).val())) {
			//이름이 형식에 맞다면
			$("#name_check").text('');
		} else {
			//이름이 형식에 맞지 않은 경우
			$('#name_check').text('이름을 확인해주세요.');
			$('#name_check').css('color', 'red');
			checkNameFlag = false;
			return;
			}
		}	
});

//생년월일

//핸드폰번호
$("#phone").blur(function(){
	var phone = $("#phone").val();

	var phoneReg = /^01\d\d{3,4}\d{4}$/;

	
	if(phoneReg.test($(this).val())) {
		//alert("사용가능한 번호입니다");
		$("#phone_check").text('');
		checkPhoneFlag = true;
	} else {
		//alert("형식에 맞지 않습니다");
		$('#phone_check').text('번호를 확인해주세요.');
		$('#phone_check').css('color', 'red');
		checkPhone1Flag = false;
		$("#phone").focus();
		return;
	}
	
});

//이메일
$("#email").blur(function(){
	var email = $("#email").val();
	var emailReg = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i; 
			
	
	if(emailReg.test($(this).val())) {
		//alert("사용가능한 이메일입니다");
		$("#email_check").text('');
		checkEmailFlag = true;
		
	} else {
		//alert("형식에 맞지 않습니다");
		$('#email_check').text('이메일을 확인해주세요.');
		$('#email_check').css('color', 'red');
		$("#email").focus();
		checkEmailFlag = false;
		return;
	}	
});

//닉네임 유효성검사
$("#nickname").blur(function(){
	var nickVal = $("#nickname").val();
	var nickReg=/^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,10}$/; //2자 이상 10자 이하, 영어 또는 숫자 또는 한글로 구성
	
	if(reg.test($(this).val())){
		$("#nick_check").text("멋진 닉네임이예요.");
		$("#nick_check").css('color','green');
		checkNickFlag=false;
	}else {
		$("#nick_check").text("중복된 닉네임입니다.");
		$("#nick_check").css("color","red");
		checkNickFlag = true;
		
	}
});  
 


