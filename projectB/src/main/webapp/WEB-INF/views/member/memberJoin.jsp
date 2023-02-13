<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>혼밥의 고수 회원가입</title>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.1.min.js"></script>
 <link
      href="../resources/img/_꾸미기_혼밥의고수_파비콘-removebg-preview.png"
      rel="shortcut icon"
    />
    <!--파비콘-->
      <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"
    />
    <!--카메라 버튼 아이콘-->
    <link href="${pageContext.request.contextPath}/resources/css/memberJoin.css" rel="stylesheet" />

	<script>
		
		function main() {
			if(confirm("메인으로 돌아가시겠습니까? 작성하신 내용은 저장되지 않습니다.")){
				location.href="<%=request.getContextPath()%>";
			}else {
				return false;
			}
		}
	</script>
</head>
<body>
    <div id="inner">
      <a onclick="main()" href="#"><img
          src="../resources/img/사본_-혼밥의고수_로고_초안_대지_1_사본-removebg-preview.png"
          width="350px"
        />
      </a>
      <form action="join.do" method="post" enctype = "multipart/form-data">
     
        <ul>
          <li id="prof">
            <label for="profile"></label><br />
            <div class="memberImage">
              <label class="profileImg" for="profileImg">
                <i class="xi-camera xi-2x"></i>
              </label>
              <input type="file" id="profileImg" name="profileImg" />
            </div>
            <!--div: 프로필 이미지가 들어갈 자리-->
            <!--label: 파일 찾기 버튼을 감싸는 태그-->
            <!--iTag: 아이콘 태그-->
          </li>
          <li>
            <label for="id">아이디<br /><br />
            <input type="text" id="id" name="id" class="id" onblur="blurId(this)" />
            <input type="button" name="idCheck" class="idCheck" onclick="checkId()" value="중복확인" >
            </label>
            <span id="id_check"></span>
          </li>
          <br />
          <br />
          <li>
            <label for="pwd">비밀번호<br /><br />
            <input type="password" id="pwd" name="pwd" class="password" />
            </label>
            <span id="pwd_check" class="error_msg"></span>
          </li>
          <br />
          <br />
          <li>
            <label for="pwdCfm">비밀번호 확인<br /><br />
            <input type="password" id ="pwdCfm" name="pwdCfm" class="passwordCfm" />
            </label>
          	<span id="pwdCk_check" class="error_msg"></span>
          </li>
          <br />
          <br />
          <li>
            <label for="name">이름<br /><br />
            <input type="text" id="name" name="name" class="name" />
            </label>
            <span id="name_check" class="error_msg"></span>
          </li>
          <br />
          <br />
          <li>
            <label for="nickname">닉네임<br /><br />
            <input type="text" id="nickname" name="nickname" class="nickname" />
             <input type="button" name="nickCheck" class="nickCheck" onclick="checkNick()" value="중복확인" >
              
            </label>
          	<span id="nick_check" class="error_box"></span>
          </li>
          <br />
          <br />
          <li>
            <label for="birth">생일<br /><br />
            <input
              type="date"
              name="birth"
              class="birthday"
              id="birth"
              max="2099-12-31"
              min="1910-01-01"
              value="sysdate"
            />
            </label>
            <span id="birth_check" class="error_msg"></span>
          </li>
          <br />
          <br />
          <li>
            <label for="gender">성별<br /><br />
            <select name="gender" class="gender" id="gender">
              <option value="">선택하세요</option>
              <option value="man">남자</option>
              <option value="woman">여자</option>
              <option value="notSelect">선택 안함</option>
            </select>
            </label>
          </li>
          <br />
          <br />
          <li>
            <label for="phone">연락처<br /><br />
            <input type="text" id="phone" name="phone" class="phone" placeholder="(ex: 01012345678)"/>
            <input type="button" onclick="phChk()"  class="phoneCheck" value="인증번호 전송">
            </label>
          	<span id="phone_check" class="error_msg"></span>
          </li>
          <br />
          <br />
          <li>
          <label for="phone2">인증번호<br /><br />
          <input type="text" name="phone2" id="phone2" class="phone2">
          <input type="button" onclick="phChk2()" id="phoneChk" class="phone2Check" value="인증하기">
			</label>    
			<span id="phone2_check" class="error_msg"></span>      
          </li>
            <br />
          <br />
          <li>
            <label for="email">이메일<br /><br />
            <input type="email" id="email" name="email" class="email" placeholder="(ex: example@email.com)"/>
             <input type="button"  name="emailCheck" class="emailCheck" onclick="checkEmail()" value="중복확인">
              
            </label>
            <span id="email_check" class="error_box"></span>
          </li>
          <br />
          <br />
          <li>
            <button  id="btn" name="join" class="join">회원가입</button>
          </li>
        </ul>
      </form>
      <!--end: #joinForm-->
    </div>
    <!--end: #inner-->
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
      

<script>

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
				$('#id_check').text("아이디를 입력하세요.");
				$('#id_check').css('color', 'red');
				$("#id").focus();
				checkIdFlag = false;
				return false;

			} else if(!checkIdFlag) {
				$('#id_check').text("아이디 중복확인을 해주세요.");
				$('#id_check').css('color', 'red');
				checkIdFlag = false;
				return false;
			}
			

			/* 비밀번호 */
			var pwd = $("#pwd").val();
			if(pwd == ""){
				
				$('#pwd_check').text('비밀번호를 입력해주세요.');
				$('#pwd_check').css('color', 'red');
				//$("#pwd").focus();
				checkPwdFlag = false;
				return false;
			}
			
			/* 비밀번호 확인  */
			var pwdCfm = $("#pwdCfm").val();
			if(pwdCfm == ""){
				$('#pwdCk_check').text('비밀번호 확인을 입력하세요.');
				$('#pwdCk_check').css('color', 'red');

				$("#pwdCfm").focus();
				checkpwdCfmFlag = false;
				return false;
			}
		
			
			/* 이름 */
			var name = $("#name").val();
			if(name == "") {
				$('#name_check').text('이름을 입력하세요.');
				$('#name_check').css('color', 'red');
				$("#name").focus();
				checkNameFlag = false;
				return false;
			}
			
			/* 닉네임  */
			var nick = $("#nickname").val();
			if(nick == "") {
				$('#nickname_check').text('닉네임을 입력하세요.');
				$('#nickname_check').css('color', 'red');
				$("#nickname").focus();
				checkNickFlag = false;
				return false;
			} else if(!checkNickFlag) {
				$('#nickname_check').text('닉네임 중복확인을 해주세요.');
				$('#nickname_check').css('color', 'red');
				checkNickFlag = false;
				return false;
			} 
			
			/* 생일 */
			var birth = $("#birth").val();
			if(birth == "") {
				$('#birth_check').text('생일을 입력해주세요.');
				$('#birth_check').css('color', 'red');
				checkBirthFlag = false;
				return false;
			}
			
			/* 성별*/
			var gender = $("#gender").val();
			if(gender == "") {
				$('#gender_check').text('성별을 체크해주세요');
				$('#gender_check').css('color', 'red');
				checkGenderFlag = false;
				return false;
			} 
			
			/* 핸드폰번호 */
			var phone = $("#phone").val();
						
			if(phone == "") {
				$('#phone_check').text('핸드폰 번호를 해주세요.');
				$('#phone_check').css('color', 'red');
				checkPhoneFlag = false;
				return false;
			} 
			
			var phone2 = $("#phone2").val();
			
			if(phone2 == "") {
				$('#phone2_check').text('인증번호를 입력 해주세요.');
				$('#phone2_check').css('color', 'red');
				checkphChk2Flag = false;
				return false;
			} 
			
			/* 이메일 */
			var email = $("#email").val();
			if(email == "") {
				$('#email_check').text('이메일을 해주세요.');
				$('#email_check').css('color', 'red');
				$("#email").focus();
				checkEmailFlag = false;
				return false;
			} else if(!checkEmailFlag) {
				alert("이메일 중복확인을 해주세요.");
				checkEmailFlag = false;
				return false;
			} 
			
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
		checkIdFlag = false;
		return;
	}
	
	// 아이디 입력값이 있어
	// 정규식 검사를 해서, 올바르지 않은 형식이면
	// 형식에 맞지 않습니다. 메세지를 띄우고
	// 아이디 입력하는 인풋으로 포커스 이동
	// 리턴
	if(idval != "") {
		if (idReg.test($("#id").val())) {
			//이름이 형식에 맞다면
			$("#id_check").text("사용가능한 id입니다. 중복체크를 해주세요.");
			$('#id_check').css('color', 'red');
		} else {
			//아이디가 형식에 맞지 않은 경우
			$('#id_check').text('아이디는 5~10자 소문자, 숫자를 사용하세요.');
			$('#id_check').css('color', 'red');
			$("#id").focus();
			checkIdFlag = false;
			return;
		}
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

function checkDupl(){
    if(!checkIdFlag){
       
       return false;
    }else if($("#id").val() == ""){         
       return false;
    }else{
       return true;
    }
 }   
 
function blurId(obj){   
    var val = obj.value;
    
    if(checkIdFlag && val != checkIdVal){
      checkIdFlag = false;
    }  
 }

/* 휴대폰 문자 인증 */
 var code2="" 
	function phChk(){
	   var phone = $("#phone").val();
	   var phoneReg = /^01\d\d{3,4}\d{4}$/;
	   
	  	if(phone == ""|| phone == null) {
	  		$('#phone_check').text('핸드폰번호를 입력해주세요.');
			$('#phone_check').css('color', 'red');
	  		return;
	  	}
	  	
	  	if(phone!= "") {
	  		if(phoneReg.test($("#phone").val())) {
				//alert("사용가능한 번호입니다");
				$("#phone_check").text('사용가능한 번호입니다');
				checkPhoneFlag = true;
			} else {
				//alert("형식에 맞지 않습니다");
				$('#phone_check').text('번호를 확인해주세요.');
				$('#phone_check').css('color', 'red');
				$("#phone").focus();
				checkPhoneFlag = false;
				return;
			}
	  	}
	  	
	 
	  	$('#phone_check').text('인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.');
		$('#phone_check').css('color', 'red');
		//alert('인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.');
		
		 $.ajax({
		        type:"POST", // post 형식으로 발송
		        url:"<%=request.getContextPath()%>/member/sendSMS1.do", // controller 위치
		        data: {phone:phone}, // 전송할 데이터값
		        cache : false,
		        success:function(data){
		            if(data == "error"){ //실패시 
		        
		            	$('#phone_check').text('휴대폰 번호가 올바르지 않습니다.');
		        		$('#phone_check').css('color', 'red');
		                //alert("휴대폰 번호가 올바르지 않습니다.")
		                return;
		            }else{            //성공시        
		            	$('#phone_check').text('인증번호가 전송되었습니다.');
		        		$('#phone_check').css('color', 'red');
		                //alert("인증번호가 전송되엇습니다.");
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
	var nickReg=/^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,10}$/;
	
	if(nickVal == "") {
		$('#nick_check').text("닉네임을 입력하세요.");
		$('#nick_check').css('color', 'red');
		return;
	} else {
		if(nickReg.test($("#nickname").val())){
			$("#nick_check").text("사용가능한 닉네임이예요. 닉네임 중복체크를 해주세요.");
			$("#nick_check").css('color','green');
		} else {
			$("#nick_check").text("닉네임은 2자 이상 10자 이하,영어 또는 숫자 또는 한글로 만들어주세요 .");
			$("#nick_check").css('color','red');
			$("#nickname").focus();
			checkNickFlag = false;
			return;

		}
	}
	
		$.ajax({
			url:"<%=request.getContextPath()%>/member/checkNick.do",
			type: "post",
			data: "nickname="+nickVal,
			success:function(data){

				if(data == 1){
					$('#nick_check').text("중복된 닉네임입니다.");
					$('#nick_check').css('color', 'red');
					checkNickFlag = false;
					checkNickVal ="";
					$("#nickname").focus();
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
	
	if(emailReg.test($("#email").val())) {
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
			url:"<%=request.getContextPath()%>/member/checkEmail.do",
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
			$("#id_check").text("사용가능한 id입니다. 중복체크를 해주세요.");
			checkIdFlag = true; 
		} else {
			//아이디가 형식에 맞지 않은 경우
			$('#id_check').text('아이디는 5~10자 소문자, 숫자를 사용하세요.');
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
		checkPwdFlag = false;
		checkPwdCfmFlag = false;
		return;
	} else {
		$("#pwdCk_check").text("비밀번호가 일치합니다");
		$("#pwdCk_check").css("color","green");
		checkPwdFlag = true;
		checkPwdCfmFlag = true;
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
		checkNameFlag = false;
		return;
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

	if(phone == "") {
		$('#phone_check').text('번호를 입력해주세요.');
		$('#phone_check').css('color', 'red');
		checkPhoneFlag = false;
		return;
	} else {
		if(phoneReg.test($(this).val())) {
			//alert("사용가능한 번호입니다");
			$("#phone_check").text('');
			checkPhoneFlag = true;
		} else {
			//alert("형식에 맞지 않습니다");
			$('#phone_check').text('번호를 확인해주세요.');
			$('#phone_check').css('color', 'red');
			$("#phone").focus();
			checkPhoneFlag = false;
			return;
		}
	}

});




</script>  
  
  </body>
</html>