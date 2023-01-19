<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>혼밥의 고수 회원가입</title>
 <link
      href="../resources/img/_꾸미기_혼밥의고수_파비콘-removebg-preview.png"
      rel="shortcut icon"
    />
    <!--파비콘-->
    <link href="${pageContext.request.contextPath}/resources/css/memberJoin.css" rel="stylesheet" />
</head>
<body>
    <div id="inner">
      <a href="${pageContext.request.contextPath}"
        ><img
          src="../resources/img/사본_-혼밥의고수_로고_초안_대지_1_사본-removebg-preview.png"
          width="350px"
        />
      </a>
      <form action="join.do" method="post">
        <ul>
          <li>
            <label for="id">아이디</label><br />
            <input type="text" name="id" class="id" />
            <button type="button" name="idCheck" class="idCheck">
              <p>중복확인</p>
            </button>
          </li>
          <br />
          <br />
          <li>
            <label for="password">비밀번호</label><br />
            <input type="password" name="password" class="password" />
          </li>
          <br />
          <br />
          <li>
            <label for="passwordCfm">비밀번호 확인</label><br />
            <input type="password" name="passwordCfm" class="passwordCfm" />
          </li>
          <br />
          <br />
          <li>
            <label for="name">이름</label><br />
            <input type="text" name="name" class="name" />
          </li>
          <br />
          <br />
          <li>
            <label for="nickname">닉네임</label><br />
            <input type="text" name="nickname" class="nickname" />
          </li>
          <br />
          <br />
          <li>
            <label for="birthday">생일</label><br />
            <input
              type="date"
              name="birthday"
              class="birthday"
              id="date"
              max="2099-12-31"
              min="1910-01-01"
              value="sysdate"
            />
          </li>
          <br />
          <br />
          <li>
            <label for="gender">성별</label><br />
            <select name="gender" class="gender">
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
            <input type="tel" name="phone1" class="phone" /> -
            <input type="tel" name="phone2" class="phone" /> -
            <input type="tel" name="phone3" class="phone" />
          </li>
          <br />
          <br />
          <li>
            <label for="email">이메일</label><br />
            <input type="email" class="email" />
          </li>
          <br />
          <br />
          <li>
            <button type="submit" name="join" class="join">회원가입</button>
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