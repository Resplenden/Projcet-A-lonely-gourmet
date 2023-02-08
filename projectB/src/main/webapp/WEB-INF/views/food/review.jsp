<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>혼밥의 고수 리뷰</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/boardLike.js"></script>
 <link
      href="resources/img/_꾸미기_혼밥의고수_파비콘-removebg-preview.png"
      rel="shortcut icon"
    />
    <!-- 파비콘 -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"
    />
    <!--검색 버튼 아이콘-->
    <link href="${pageContext.request.contextPath}/resources/css/review.css" rel="stylesheet" />
    <!--css 연결-->
</head>
<body>
		<nav>
 <div id="topMenu">
        <div class="logo">
          <a href="#">
            <img
              src="../resources/img/사본 -혼밥의고수 로고 초안_대지 1 사본.png"
              width="200px"
            />
          </a>
        </div>
        <!--end: #topMenu-->
		<c:if test="${login == null && name == null}">
        <div id="searchBar">
          <input type="text" placeholder="검색어를 입력하세요" />
          <button class="searchBtn" type="submit">
            <i class="xi-search xi-2x"></i>
          </button>
        </div>
        <!--end: #searchBar-->
        <div class="loginInfo">
          <a href="<%=request.getContextPath()%>/member/memberLogin.do" class="login"><p>로그인</p></a>
          <a href="<%=request.getContextPath()%>/member/memberJoin.do" class="join"><p>회원가입</p></a>
        </div>
        <!--end:.loginInfo-->
        </c:if>
        <c:if test="${login != null && name == null}">
        <div id="loginSearchBar">
          <input type="text" placeholder="검색어를 입력하세요" />
          <button class="searchBtn" type="submit">
            <i class="xi-search xi-2x"></i>
          </button>
          </div>
          <!--end: #searchBar-->
        <div class="loginInfo">
          <img src="<%=request.getContextPath()%>/resources/upload/${login.stname}" class="memberImage" style="width:45px; height:45px; border-radius: 30px;"> <p class="welcome"><span>${login.nickname}</span>&nbsp;님, 반갑습니다!</p>
          <a href="<%=request.getContextPath()%>/member/memberLogin.do" class="myPage"><p>마이페이지</p></a>
          <a href="<%=request.getContextPath()%>/member/logout.do" class="logout"><p>로그아웃</p></a>
        </div>
        <!--end:.loginInfo-->
        </c:if>
          <c:if test ="${login == null && name != null}">
           	 <div id="loginSearchBar">
          <input type="text" placeholder="검색어를 입력하세요" />
          <button class="searchBtn" type="submit">
            <i class="xi-search xi-2x"></i>
          </button>
          </div>
          <!--end: #searchBar-->
        <div class="loginInfo">
          <span>${name}</span>&nbsp;님, 반갑습니다!</p>
          <a href="<%=request.getContextPath()%>/member/memberLogin.do" class="myPage"><p>마이페이지</p></a>
          <a href="<%=request.getContextPath()%>/member/logout.do" class="logout"><p>로그아웃</p></a>
        </div>
        <!--end:.loginInfo-->
            </c:if>
      </div>
      <!--end: #topMenu-->
      <hr />
      <div id="bottMenu">
        <ul>
          <li><a href="<%=request.getContextPath()%>/map/map.do">맛집지도</a></li>
          <li><a href="<%=request.getContextPath()%>/board/list.do">자유게시판</a></li>
          <li><a href="<%=request.getContextPath()%>/board/noticeList.do">공지사항</a></li>
          <li><a href="<%=request.getContextPath()%>/event/list.do">이벤트</a></li>
        </ul>
      </div>
      <!--end: #bottMenu-->
    </nav>
    <!--end: nav-->
     <main>
      <h1 class="boardName">리뷰 상세보기</h1>
      <div id="board_1">
        <div class="reviewInfo">
          <span
            >카테고리   &nbsp;  &nbsp;<i class="xi-angle-right-min xi-1x"></i>    &nbsp;&nbsp;식당 이름</span
          >
          <h2>리뷰 제목입니다</h2>
          <div class="profileImg">
            <img src="../resources/img/프로필이미지.png" width="50" />
          </div>
          <p class="writer">작성자</p>
          <br />
          <br />
          <br />
          <p class="miniInfo">
            2023.01.26
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#124;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;추천수
            0
          </p>
        </div>
        <!--end: .reviewInfo-->
        <div class="foodImg">사진이 들어가는 자리입니다.</div>
        <!--end: .foodImg-->
        <div id="content">
          <p>
            니가 나의 모든 걸 뺏어갔어도 모두가 내 꿈에 바리케이드를 쳐도 내가
            나의 기름 더 불을 붙여줘 빛이 나는 My Way 빛이 나는 My Way 니가 나의
            모든 걸 뺏어갔어도 모두가 내 꿈에 바리케이드를 쳐도 내가 나의 기름
            더 불을 붙여줘 빛이 나는 My Way 빛이 나는 My Way 난생처음 섰던
            무대엔 낯선 얼굴 쟤 누군데? 마이크 잡은 후엔 함 더 묻대 쟤 누구래?
            끝내고 내려오는 기분이 이걸 하는 가장 큰 이유 중에 하나 앉아서 잘 봐
            그 꼬마가 이젠 TV에 나와 서있어 무대 알아봐라 그러니 Lets put em in
            (all in) 날 부르니 또 오르지 저 구름 위 (oh yeah) 내 걸음이 밑
            거름이 좋은 버릇이 든 어린이는 돼 어른이 아닌 얼음을 목에 걸은 애
            이빨을 드러낼 때야 씩 (study me) Pop that champagne for champion
            반짝 허리에 감겨있는 벨트 감쪽같은 마술은 마법이네 My spell is
            spelling did u get that? 밤마다 반복해서 주문을 외워 삶을 원하다면
            죽음을 배워 타이머가 곧 울리네 tik tik ding ding 난 또 빛이 나는 길
            위에 (woo) I was racing with nobody (woo) 여전히 타올라 제일
            처음같이 (woo) 쉽게 이룬 듯이 근데 no way (woo) 두 엄마의 품은
            기억에 평생 남겨져 흉터로 베여있어 어렸을 땐 행복과는 제일 멀 던 놈
            내게 친구 옆에 있어도 빈자린 언제나 괴롭혀 그때의 난 어렸었네 무시에
            짓눌렸기에 압박 속에 피어났네 난 diamond 무엇보다도 빛나게 (let's
            go) 난 원해 맨 위 그대로 더 행진 난 원해 내일엔 더 재수 없는 놈이
            되길 바라 됐어 타이밍 이젠 내 형제들과 밟어 We go vroom vroom vroom
            vroom 니가 나의 모든 걸 뺏어갔어도 모두가 내 꿈에 바리케이드를 쳐도
            내가 나의 기름 더 불을 붙여줘 빛이 나는 My Way 빛이 나는 My Way I'ma
            I stack my money up 'til I can't no more You should be afraid of us
            We're 'bout to blow up 내가 나의 기름 더 불을 붙여줘 빛이 나는 My
            Way 빛이 나는 My Way 난 여기다 내 목을 걸었어 다시 예전으로 돌아갈
            수 없어 힘들던 그땐 신이 미웠지만 이젠 신의 계획이 뭔지 알게 됐어
            아팠던 기억들은 던져 친구 미안한데 이건 내가 먼저 챙겨가야겠어 난
            아직도 갈 길이 멀어 그렇기에 난 포기 안 할 거라 말했고 넘어져도
            일어나 계속 지쳐도 안쳤지 tap 되려 벌렸지 gap 내 시작은 맨손 반찬
            팔아가며 청춘 받쳐 날 키워준 값진 그녀의 행복 나 땜에 잠시 내려놨던
            그 행복을 이 손자가 돌려줄게 꼭 난 내 놈들과 하나둘씩 이뤄가 점점
            끝없이 Naughty for life 우린 절대 안 져 계속 보여주지 절대 안 될 거
            같던 꿈들을 이뤄 난 여기 있지 아팠던 날 들을 저 뒤로 보내고 웃자고
            같던 꿈들을 이뤄 난 여기 있지 아팠던 날 들을 저 뒤로 보내고 웃자고
            같던 꿈들을 이뤄 난 여기 있지 아팠던 날 들을 저 뒤로 보내고 웃자고
          </p>
        </div>
        <!--end: #content-->
        <div class="recommend">
          <p>이 리뷰가 마음에 드셨다면?</p>
          <div class="like">
            <a href="#" class="like-button">
              <?xml version="1.0" encoding="utf-8"?>
              <svg
                width="30"
                height="30"
                viewBox="0 0 1792 1792"
                xmlns="http://www.w3.org/2000/svg"
              >
                <path
                  d="M320 1344q0-26-19-45t-45-19q-27 0-45.5 19t-18.5 45q0 27 18.5 45.5t45.5 18.5q26 0 45-18.5t19-45.5zm160-512v640q0 26-19 45t-45 19h-288q-26 0-45-19t-19-45v-640q0-26 19-45t45-19h288q26 0 45 19t19 45zm1184 0q0 86-55 149 15 44 15 76 3 76-43 137 17 56 0 117-15 57-54 94 9 112-49 181-64 76-197 78h-129q-66 0-144-15.5t-121.5-29-120.5-39.5q-123-43-158-44-26-1-45-19.5t-19-44.5v-641q0-25 18-43.5t43-20.5q24-2 76-59t101-121q68-87 101-120 18-18 31-48t17.5-48.5 13.5-60.5q7-39 12.5-61t19.5-52 34-50q19-19 45-19 46 0 82.5 10.5t60 26 40 40.5 24 45 12 50 5 45 .5 39q0 38-9.5 76t-19 60-27.5 56q-3 6-10 18t-11 22-8 24h277q78 0 135 57t57 135z"
                />
              </svg>
            </a>
            <div class="likeCount">
              <span id="counter">추천&nbsp;&nbsp;&nbsp;0</span>
            </div>
          </div>
          <!--end: #like-cnt-->
        </div>
      </div>
      <!--end: board_1-->
  </div>
    </main>
    <!--end: main-->
  <footer>
      <div id="slogan">
        <img
          src="../resources/img/사본_-혼밥의고수_로고_초안_대지_1_사본-removebg-preview.png"
          width="200px"
        />
        <p>Until the day when eaten alone human become proud</p>
      </div>
      <!--end: #slogan-->
      <div id="footerMenu">
        <ul>
          <li><a href="#">팀 소개</a></li>
          <p>&#124;</p>
          <li><a href="#">개인정보처리방침</a></li>
          <p>&#124;</p>
          <li><a href="#">이용약관</a></li>
          <p>&#124;</p>
          <li><a href="#">도움말</a></li>
          <p>&#124;</p>
          <li><a href="#">공지사항</a></li>
        </ul>
        <p class="companyInfo">
          혼밥의고수 &#124; 대표자: 고독한 미식가 &#124; 전주시 덕진구 백제대로
          572 4층 이젠컴퓨터아트서비스학원
          <br />
          © 2023 혼밥의 고수 Ltd. All rights reserved.
        </p>
        <!--end: .companyInfo-->
      </div>
      <!--end: #footerMenu-->
      <div id="sns">
        <ul>
          <li>
            <a href="#"><i class="xi-instagram xi-2x"></i></a>
          </li>
          <li>
            <a href="#"><i class="xi-facebook xi-2x"></i></a>
          </li>
          <li>
            <a href="#"><i class="xi-kakaotalk xi-2x"></i></a>
          </li>
        </ul>
      </div>
      <!--end: #sns-->
    </footer>
    <!--end: footer-->
        <a id="topBtn"><p><i class="xi-eject xi-2x"></i><br>TOP</p></a>    
    <script src="${pageContext.request.contextPath}/resources/js/topBtn.js"></script>
    <!-- end: #topBtn -->
  </body>
</html>