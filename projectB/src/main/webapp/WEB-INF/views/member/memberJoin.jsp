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
      <form action="join.do" method="post">
        <ul>
          <li>
            <label for="id">아이디</label><br />
            <input type="text" id="id" name="id" class="id" />
            <button type="button" name="idCheck" class="idCheck" onclick="checkId()">
              <p>중복확인</p>
            </button>
            <span id="id_check"></span>
          </li>
          <br />
          <br />
          <li>
            <label for="pwd">비밀번호</label><br />
            <input type="password" id="pwd" name="pwd" class="password" />
            <span id="pwd_check" class="error_msg"></span>
          </li>
          <br />
          <br />
          <li>
            <label for="pwdCfm">비밀번호 확인</label><br />
            <input type="password" id ="pwdCfm" name="pwdCfm" class="passwordCfm" />
          	<span id="pwdCk_check" class="error_msg"></span>
          </li>
          <br />
          <br />
          <li>
            <label for="name">이름</label><br />
            <input type="text" id="name" name="name" class="name" />
            <span id="name_check" class="error_msg"></span>
          </li>
          <br />
          <br />
          <li>
            <label for="nickname">닉네임</label><br />
            <input type="text" id="nickname" name="nickname" class="nickname" />
             <button type="button" name="nickCheck" class="nickCheck" onclick="checkNick()">
              <p>중복확인</p>
            </button>
          	<span id="nick_check" class="error_box"></span>
          </li>
          <br />
          <br />
          <li>
            <label for="birth">생일</label><br />
            <input
              type="date"
              name="birth"
              class="birthday"
              id="date"
              max="2099-12-31"
              min="1910-01-01"
              value="sysdate"
            />
            <span id="birth_check" class="error_msg"></span>
          </li>
          <br />
          <br />
          <li>
            <label for="gender">성별</label><br />
            <select name="gender" class="gender" id="gender">
              <option value="">선택하세요</option>
              <option value="man">남자</option>
              <option value="woman">여자</option>
              <option value="notSelect">선택 안함</option>
            </select>
          </li>
          <br />
          <br />
          <li>
            <label for="phone">연락처</label><br />
            <input type="tel" id="phone" name="phone" class="phone" placeholder="- 없이 번호를 입력하세요. (ex: 01012345678)"/>
          	<span id="phone_check" class="error_msg"></span>
          </li>
          <br />
          <br />
          <li>
            <label for="email">이메일</label><br />
            <input type="email" id="email" name="email" class="email" />
             <button type="button" name="emailCheck" class="emailCheck" onclick="checkEmail()">
              <p>중복확인</p>
            </button>
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
  var checkPhone1Flag = false;
  var checkPhone2Flag = false;
  var checkPhone3Flag = false;
  var checkBirthFlag = false;
  var checkNickFlag = false;
  var checkEmailFlag = false;
  var checkGenderFlag = false;
  
  
  var checkIdVal = "";
  var checkNickVal = "";
  var checkEmailVal = "";
  
  $(function(){
		$("form").submit(function(){
			
			/* 아이디 */
			var id =  $.trim($("#id").val());
			if(id == "") {
				alert("아이디를 입력하세요.");
				$("#id").focus();
				checkIdFlag = false;
				return false;
				
			} else if(!checkIdFlag) {
				alert("아이디 중복확인을 하세요");
				checkIdFlag = false;
				return false;
			}
			

			/* 비밀번호 */
			var pwd = $.trim($("#pwd").val());
			if(pwd == ""){
				alert("비밀번호를 입력하세요.");
				$("#pwd").focus();
				checkPwdFlag = false;
				return false;
			}
			
			/* 비밀번호 확인  */
			var pwdCfm = $.trim($("#pwdCfm").val());
			if(pwdCk == ""){
				alert("비밀번호 확인을 입력하세요.");
				$("#pwdCfm").focus();
				checkpwdCfmkFlag = false;
				return false;
			}
		
			
			/* 이름 */
			var name = $.trim($("#name").val());
			if(name == "") {
				alert("이름을 입력하세요");
				$("#name").focus();
				checkNameFlag = false;
				return false;
			}
			
			/* 닉네임  */
			var nick = $.trim($("#nickname").val());
			if(nick == "") {
				alert("닉네임을 입력하세요");
				checkNickFlag = false;
				return false;
			} else if(!checkNickFlag) {
				alert("닉네임 중복확인을 하세요");
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
			var phone = $("#phone1").val();
			
			
			if(phone == "") {
				alert("핸드폰 번호를 입력하세요");
				checkPhoneFlag = false;
				return false;
			} 
			
			/* 이메일 */
			var email = $("#email").val();
			if(email == "") {
				alert("이메일을 입력하세요");
				checkEmailFlag = false;
				return false;
			} else if(!checkEmailFlag) {
				alert("이메일 중복확인을 하세요");
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
			} else {
				$('#id_check').text("사용가능한 아이디입니다.");
				$('#id_check').css('color', 'green');
				checkIdFlag = true;
				checkIdVal = idval;
				
			} /*if(data == 0 && idval == "") {
				alert("아이디를 입력해주세요.");
				id.focus();
				checkIdFlag = false;
				checkIdVal = "";
			}*/

		}
	});	
}


 /* 닉네임 중복검사 */
function checkNick(){
	var nickVal = $("#nickname").val();

		$.ajax({
			url : "checkNick.do",
			type: "post",
			data: "nickname="+nickVal,
			success:function(data){

				if(data == 1){
					$('#nick_check').text("중복된 닉네임입니다.");
					$('#nick_check').css('color', 'red');
					$("#nickname").focus();
					checkNickFlag = false;
					checkNickVal =="";
					return;
				}else{
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
		
		$.ajax({
			url:"checkEmail.do",
			type:"post",
			data: "email="+emailVal,
			success:function(data) {
				
				if(data == 1) {
					//result == 1
					$('#email_check').text("이미 가입된 이메일입니다.");
					$('#email_check').css('color', 'red');
					checkEmailFlag = false;
					checkEmailVal ="";
					$("#nickname").focus();
					return;
				} else {
					checkEmailFlag = true;
					checkEmailVal = emailVal;
				}
			}
	});

}


$('#id').on(function(){
	var id =  $("#id").val();
	 
	if(id == "") {
		$('#id').text('id를 입력하세요');
	    $('#id_check').css('color', 'red');
	    $("#id").focus();
	    return;
	} 
 });

/*정규식 검사 */
//아이디
$("#id").on("input",function(){
	var id = $("#id").val();
	var idReg =/^[a-z0-9_-]{4,10}$/;
	
	if(id == null) {
		//아이디가 공백일 경우
		$('#id_check').text('아이디를 입력해주세요');
		$('#id_check').css('color', 'red');
		checkIdFlag = false; //아이디를 체크했는지 확인하는 변수
	} else {
		//아이디 입력
		//정규식 검사를 함
		if (idReg.test($(this).val())) {
			//이름이 형식에 맞다면
			console.log(idReg.test($(this).val()));
			$("#id_check").text("사용가능한 id입니다. 중복체크를 해주세요");
			checkIdFlag = true; 
		} else {
			//아이디가 형식에 맞지 않은 경우
			$('#id_check').text('아이디는 4~10자 소문자, 숫자를 사용하세요');
			$('#id_check').css('color', 'red');
			//$("#id").focus();
			checkIdFlag = false;
			return;
		}
	}	
    
});

/*비밀번호 일치확인*/
$('#pwdCk').focusout(function () {
	var pwd = $("#pwd").val();
	var pwdCfm = $("#pwdCfm").val();
 
 
  	if (pwd == pwdCk) {
      $('#pwdCk_check').text('비밀번호가 일치합니다.');
      $('#pwdCk_check').css('color', 'green');
      checkPwdCkFlag = true;
           
   } else {
       $('#pwdCk_check').text("비밀번호가 일치하지 않습니다.");
       $('#pwdCk_check').css('color', 'red');
	   $("#pwdCfm").focus();
       checkPwdCkFlag = false;
       return;
   }	
});

//비밀번호
$("#pwd").blur(function(){
	var pwd = $("#pwd").val();
	var pwdReg =/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{4,8}$/;
	
	if(pwd == null) {
		//아이디가 공백일 경우
		$('#pwd_check').text('비밀번호를 입력해주세요');
		$('#pwd_check').css('color', 'red');
		checkPwdFlag = false; //아이디를 체크했는지 확인하는 변수
	} else {
		//아이디 입력
		//정규식 검사를 함
		if (pwdReg.test($(this).val())) {
			//alert("알맞은 형식입니다");
			//이름이 형식에 맞다면
			checkPwdFlag = true; 
		} else {
			//아이디가 형식에 맞지 않은 경우
			//alert("비밀번호는 4자리 이상 8자리 소문자,숫자, 특수문자를 이용해 만들어주세요");
			$('#pwd_check').text('비밀번호는 4자리 이상 8자리 소문자,숫자, 특수문자를 이용해 만들어주세요');
			$('#pwd_check').css('color', 'red');
			//$("#pwd").focus();
			checkPwdFlag = false;
			return;
		}
	}	
    
});



//한글이름만
$("#name").blur(function(){
	var name = $("#name").val();
	var nameReg = /^[가-힣]{2,6}$/;
			
	if(name == "") {
		//이름을 입력했는지
		$('#name_check').text('이름을 입력해주세요');
		$('#name_check').css('color', 'red');
	} else {
		//이름을 입력
		//정규식 검사를 함
		if (nameReg.test($(this).val())) {
			//이름이 형식에 맞다면
			$("#name_check").text('');
		} else {
			//이름이 형식에 맞지 않은 경우
			$('#name_check').text('이름을 확인해주세요');
			$('#name_check').css('color', 'red');
			$("#name").focus();
			checkNameFlag = false;
			return;
			}
		}	
});

//생년월일

//핸드폰번호
$("#phone1").blur(function(){
	var phone = $("#phone1").val();

	var phoneReg = /^01\d\d{3,4}\d{4}$/;

	
	if(phoneReg.test($(this).val())) {
		//alert("사용가능한 번호입니다");
		$("#phone_check").text('');
		checkPhoneFlag = true;
	} else {
		//alert("형식에 맞지 않습니다");
		$('#phone_check').text('번호를 확인해주세요');
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
		$('#email_check').text('이메일을 확인해주세요');
		$('#email_check').css('color', 'red');
		$("#email").focus();
		checkEmailFlag = false;
		return;
	}	
});

	

  </script>  
  
  </body>
</html>