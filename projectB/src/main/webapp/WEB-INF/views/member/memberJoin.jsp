<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>혼밥의 고수 회원가입</title>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.1.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/join.js"></script>
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
            <div class="memberImage">
              <label class="profileImg" for="profileImg">
                <i class="xi-camera xi-2x"></i>
                <input type="file" id="profileImg" name="profileImg" />
              </label>
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
      
  
  
  </body>
</html>