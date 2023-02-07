<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
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
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css"
    />
    <!-- Link Swiper's CSS -->
    <link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" />
    <!--css 연결-->
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <!-- Swiper JS -->
    <script src="resources/js/main.js"></script>
    <!--js 연결-->
	<title>혼밥의 고수</title>
</head>
<body>
<nav>
 <div id="topMenu">
        <div class="logo">
          <a href="#">
            <img
              src="resources/img/사본 -혼밥의고수 로고 초안_대지 1 사본.png"
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
      <div id="mainView">
        <div class="swiper mySwiper">
          <div class="swiper-button-next"></div>
          <div class="swiper-button-prev"></div>
          <div class="swiper-wrapper">
            <article class="swiper-slide slide1">
              <div class="text">
                <h3>전주에서 혼밥하고 싶다면?</h3>
                <p>맛의 고장 전주, 혼밥은 어디에서 할까?</p>
                <a href="#" class="best"
                  ><i class="xi-crown xi-1x"> 베스트 후기</i></a
                >
                <a href="#" class="map"
                  ><i class="xi-maker xi-1x"> 맛집지도</i></a
                >
              </div>
            </article>
            <article class="swiper-slide slide2">
              <div class="text">
                <h3>이젠 혼밥도 럭셔리하게!</h3>
                <p>혼자 먹기 좋은 '떡갈비 정식'</p>
                <a href="#" class="best"
                  ><i class="xi-crown xi-1x"> 베스트 후기</i></a
                >
                <a href="#" class="map"
                  ><i class="xi-maker xi-1x"> 맛집지도</i></a
                >
              </div>
            </article>
            <article class="swiper-slide slide3">
              <div class="text">
                <h3>가정식 백반을 1인 메뉴로</h3>
                <p>
                  2인 이상 주문 가능한 백반은 이제 그만! 1인분의 시대가 열린다
                </p>
                <a href="#" class="best"
                  ><i class="xi-crown xi-1x"> 베스트 후기</i></a
                >
                <a href="#" class="map"
                  ><i class="xi-maker xi-1x"> 맛집지도</i></a
                >
              </div>
            </article>
            <article class="swiper-slide slide4">
              <div class="text">
                <h3>버스터미널 근처에서 혼밥하기</h3>
                <p>혼밥? 이제는 '혼여'도 두렵지 않다!</p>
                <a href="#" class="best"
                  ><i class="xi-crown xi-1x"> 베스트 후기</i></a
                >
                <a href="#" class="map"
                  ><i class="xi-maker xi-1x"> 맛집지도</i></a
                >
              </div>
            </article>
            <article class="swiper-slide slide5">
              <div class="text">
                <h3>혼자 먹다 둘이 죽는 국밥 명소</h3>
                <p>국밥엔 혼술이 국룰이지!</p>
                <a href="#" class="board"
                  ><i class="xi-list xi-1x"> 게시글 보기</i></a
                >
                <a href="#" class="map"
                  ><i class="xi-maker xi-1x"> 맛집지도</i></a
                >
              </div>
            </article>
            <article class="swiper-slide slide6">
              <div class="text">
                <h3>고기 반찬, 남 주기 아깝다!</h3>
                <p>혼자서도 당당히 먹으러 다닐 수 있는 고깃집 추천</p>
                <a href="#" class="board"
                  ><i class="xi-list xi-1x"> 게시글 보기</i></a
                >
                <a href="#" class="map"
                  ><i class="xi-maker xi-1x"> 맛집지도</i></a
                >
              </div>
            </article>
            <article class="swiper-slide slide7">
              <div class="text">
                <h3>가볍고 빠른 식사는 어디서?</h3>
                <p>이게 진짜 혼밥이지! 부담없이 갈 수 있는 혼밥집 모음</p>
                <a href="#" class="board"
                  ><i class="xi-list xi-1x"> 게시글 보기</i></a
                >
                <a href="#" class="map"
                  ><i class="xi-maker xi-1x"> 맛집지도</i></a
                >
              </div>
            </article>
            <!--end: swiper-slide-->
          </div>
          <!--end: .swiper-wrapper-->
        </div>
        <!--end: .swiper-->
      </div>
      <!--end: #mainView-->
      <div id="eventPage">
        <div class="eventContent">
          <h3>가입 회원에게 주어지는 특별 혜택!</h3>
          <p>회원들을 대상으로 하는 쏠쏠한 상시 이벤트를 절대 놓치지 마세요!</p>
          <a href="<%=request.getContextPath()%>/board/eventList.do" class="eventBtn">
            이벤트 보러가기&nbsp;&nbsp;&nbsp;&nbsp;<i
              class="xi-angle-right xi-1x"
            ></i
          ></a>
        </div>
        <!--end: .eventContent-->
        <div class="eventImg">
          <img
            src="resources/img/firework.png"
            class="firstFirework"
            width="130px"
          />
          <img
            src="resources/img/firework.png"
            class="secondFirework"
            width="120px"
          />
          <img src="resources/img/선물.png" class="gift" width="600px" />
        </div>
        <!--end: .eventImg-->
      </div>
      <!--end: #eventPage-->
      <div id="listPage">
        <div class="noticeList">
          <div class="listTitle">
            <h3>공지사항</h3>
            <a href="<%=request.getContextPath()%>/board/noticeList.do" class="readMore"><p>READ MORE →</p></a>
          </div>
          <!--end: .listTitle-->
          <table>
            <tbody>
              <tr>
                <td><a href="#">첫번째 공지입니다.</a></td>
                <td>관리자</td>
                <td>2023-01-09</td>
              </tr>
              <tr>
                <td><a href="#">두번째 공지입니다.</a></td>
                <td>관리자</td>
                <td>2023-01-09</td>
              </tr>
              <tr>
                <td><a href="#">세번째 공지입니다.</a></td>
                <td>관리자</td>
                <td>2023-01-09</td>
              </tr>
              <tr>
                <td><a href="#">네번째 공지입니다.</a></td>
                <td>관리자</td>
                <td>2023-01-09</td>
              </tr>
              <tr>
                <td><a href="#">다섯번째 공지입니다.</a></td>
                <td>관리자</td>
                <td>2023-01-09</td>
              </tr>
              <tr>
                <td><a href="#">여섯번째 공지입니다.</a></td>
                <td>관리자</td>
                <td>2023-01-09</td>
              </tr>
              <tr>
                <td><a href="#">일곱번째 공지입니다.</a></td>
                <td>관리자</td>
                <td>2023-01-09</td>
              </tr>
              <tr>
                <td><a href="#">여덟번째 공지입니다.</a></td>
                <td>관리자</td>
                <td>2023-01-09</td>
              </tr>
              <tr>
                <td><a href="#">아홉번째 공지입니다.</a></td>
                <td>관리자</td>
                <td>2023-01-09</td>
              </tr>
              <tr>
                <td><a href="#">열번째 공지입니다.</a></td>
                <td>관리자</td>
                <td>2023-01-09</td>
              </tr>
            </tbody>
          </table>
        </div>
        <!--end: .noticeList-->
        <div class="popularList">
          <div class="listTitle">
            <h3>인기 게시글</h3>
            <a href="<%=request.getContextPath()%>/board/boardList.do" class="readMore"><p>READ MORE →</p></a>
          </div>
          <!--end: .listTitle-->
          <table>
            <tbody>
              <tr>
                <td><a href="#">첫번째 게시글입니다.</a></td>
                <td>관리자</td>
                <td>2023-01-09</td>
              </tr>
              <tr>
                <td><a href="#">두번째 게시글입니다.</a></td>
                <td>관리자</td>
                <td>2023-01-09</td>
              </tr>
              <tr>
                <td><a href="#">세번째 게시글입니다.</a></td>
                <td>관리자</td>
                <td>2023-01-09</td>
              </tr>
              <tr>
                <td><a href="#">네번째 게시글입니다.</a></td>
                <td>관리자</td>
                <td>2023-01-09</td>
              </tr>
              <tr>
                <td><a href="#">다섯번째 게시글입니다.</a></td>
                <td>관리자</td>
                <td>2023-01-09</td>
              </tr>
              <tr>
                <td><a href="#">여섯번째 게시글입니다.</a></td>
                <td>관리자</td>
                <td>2023-01-09</td>
              </tr>
              <tr>
                <td><a href="#">일곱번째 게시글입니다.</a></td>
                <td>관리자</td>
                <td>2023-01-09</td>
              </tr>
              <tr>
                <td><a href="#">여덟번째 게시글입니다.</a></td>
                <td>관리자</td>
                <td>2023-01-09</td>
              </tr>
              <tr>
                <td><a href="#">아홉번째 게시글입니다.</a></td>
                <td>관리자</td>
                <td>2023-01-09</td>
              </tr>
              <tr>
                <td><a href="#">열번째 게시글입니다.</a></td>
                <td>관리자</td>
                <td>2023-01-09</td>
              </tr>
            </tbody>
          </table>
        </div>
        <!--end: .popularList-->
        <div id="miniView">
          <p>혼밥러도<br />디저트는 <br />못참지</p>
          <a href="#" class="miniMap"><i class="xi-maker xi-2x"></i></a>
        </div>
        <!--end: #miniView-->
      </div>
      <!--end: #listPage-->
    </main>
    <!--end: main-->
    <footer>
      <div id="slogan">
        <img
          src="resources/img/사본_-혼밥의고수_로고_초안_대지_1_사본-removebg-preview.png"
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
  </body>
</html>
