<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.1.min.js"></script>
 <link
      href="../resources/img/_꾸미기_혼밥의고수_파비콘-removebg-preview.png"
      rel="shortcut icon"
    />
    <!-- 파비콘 -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"
    />
    <!--검색 버튼 아이콘-->
    <link href="${pageContext.request.contextPath}/resources/css/foodView1.css" rel="stylesheet" />
    <!--css 연결-->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=637da4ce9c724b0a92d260712157c315&libraries=services"></script>

<title>혼밥의 고수 식당 상세보기</title>
 
</head>
<body>
	<!-- 식당 상세보기 페이지 -->
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
          <li><a href="<%=request.getContextPath()%>/event/list.do">식당</a></li>
        </ul>
      </div>
      <!--end: #bottMenu-->
    </nav>
    <!--end: nav-->
     <main>
      <h1 class="boardName">식당 상세보기</h1>
      <div id="board_1">
        <div class="foodImg"></div>
        <!--end: .foodImg-->	
        <div class="info">
          <div id="h2"></div>
          <h3>카테고리</h3>
          <ul>
            <li>
              <p>
                <i class="xi-maker xi-1x"></i>&nbsp;&nbsp;&nbsp;전주시 덕진구
                금암동 000-00
              </p>
            </li>
            <li>
              <p><i class="xi-call xi-1x"></i>&nbsp;&nbsp;&nbsp;063-000-0000</p>
            </li>
            <li>
              <p>
                <i class="xi-clock-o xi-1x xi-flip-horizontal"></i
                >&nbsp;&nbsp;&nbsp;09:00 ~ 22:00
              </p>
            </li>
            <li>
              <p>
                <i class="xi-tag xi-1x"></i>&nbsp;&nbsp;&nbsp;혼밥 / 혼술 /
                서민적인
              </p>
            </li>
          </ul>
          <button class="reviewWrite" onclick="location.href='<%=request.getContextPath()%>/food/reviewWrite.do'">
            <i class="xi-pen xi-1x"></i>&nbsp;리뷰쓰기
          </button>
          <button class="recommend">추천 0</button>
        </div>
        <!--end: .info-->
        <div class="menu">
          <h3>대표 메뉴</h3>
          <ul>
            <li>
              <p class="menuName">안창살볶음떡볶이마라탕</p>
              <p class="price">가격</p>
            </li>
            <li>
              <p class="menuName">돌돌말이차돌박이석쇠구이</p>
              <p class="price">가격</p>
            </li>
          </ul>
        </div>
        <!--end: .menu-->
      </div>
      <!--end: #board_1-->
      <div id="board_2">
        <div class="reviewList">
          <h3>방문자 리뷰</h3>
          <p class="count">5건</p>
          <ul>
            <li>
              <div class="review">
                <div class="reviewImg"></div>
                <div class="reviewContent">
                  <a href="<%=request.getContextPath()%>/food/review.do"><h3>리뷰 제목입니다</h3></a>
                  <p>
                    리뷰 내용입니다리뷰 내용입니다리뷰 내용입니다리뷰 내용입니다
                    리뷰 내용입니다리뷰 내용입니다리뷰 내용입니다리뷰 내용입니다
                    리뷰 내용입니다리뷰 내용입니다리뷰 내용입니다리뷰 내용입니다
                    리뷰 내용입니다리뷰 내용입니다리뷰 내용입니다리뷰 내용입니다
                  </p>
                </div>
                <!--end: .reviewContent-->
              </div>
              <!--end: .review-->
              <div class="profile">
                <div class="profileImg">
                  <img src="../resources/img/프로필이미지.png" width="60" />
                </div>
                <p class="nickname">닉네임</p>
                <p class="date">2023.01.25</p>
                <p class="reviewRecom">추천 0</p>
              </div>
              <!--end: .profile-->
            </li>
            <li>
              <div class="review">
                <div class="reviewImg"></div>
                <div class="reviewContent">
                  <a href="#"><h3>리뷰 제목입니다</h3></a>
                  <p>
                    리뷰 내용입니다리뷰 내용입니다리뷰 내용입니다리뷰 내용입니다
                    리뷰 내용입니다리뷰 내용입니다리뷰 내용입니다리뷰 내용입니다
                    리뷰 내용입니다리뷰 내용입니다리뷰 내용입니다리뷰 내용입니다
                    리뷰 내용입니다리뷰 내용입니다리뷰 내용입니다리뷰 내용입니다
                  </p>
                </div>
                <!--end: .reviewContent-->
              </div>
              <!--end: .review-->
              <div class="profile">
                <div class="profileImg">
                  <img src="../resources/img/프로필이미지.png" width="60" />
                </div>
                <p class="nickname">닉네임</p>
                <p class="date">2023.01.25</p>
                <p class="reviewRecom">추천 0</p>
              </div>
              <!--end: .profile-->
            </li>
            <li>
              <div class="review">
                <div class="reviewImg"></div>
                <div class="reviewContent">
                  <a href="#"><h3>리뷰 제목입니다</h3></a>
                  <p>
                    리뷰 내용입니다리뷰 내용입니다리뷰 내용입니다리뷰 내용입니다
                    리뷰 내용입니다리뷰 내용입니다리뷰 내용입니다리뷰 내용입니다
                    리뷰 내용입니다리뷰 내용입니다리뷰 내용입니다리뷰 내용입니다
                    리뷰 내용입니다리뷰 내용입니다리뷰 내용입니다리뷰 내용입니다
                  </p>
                </div>
                <!--end: .reviewContent-->
              </div>
              <!--end: .review-->
              <div class="profile">
                <div class="profileImg">
                  <img src="../resources/img/프로필이미지.png" width="60" />
                </div>
                <p class="nickname">닉네임</p>
                <p class="date">2023.01.25</p>
                <p class="reviewRecom">추천 0</p>
              </div>
              <!--end: .profile-->
            </li>
            <li>
              <div class="review">
                <div class="reviewImg"></div>
                <div class="reviewContent">
                  <a href="#"><h3>리뷰 제목입니다</h3></a>
                  <p>
                    리뷰 내용입니다리뷰 내용입니다리뷰 내용입니다리뷰 내용입니다
                    리뷰 내용입니다리뷰 내용입니다리뷰 내용입니다리뷰 내용입니다
                    리뷰 내용입니다리뷰 내용입니다리뷰 내용입니다리뷰 내용입니다
                    리뷰 내용입니다리뷰 내용입니다리뷰 내용입니다리뷰 내용입니다
                  </p>
                </div>
                <!--end: .reviewContent-->
              </div>
              <!--end: .review-->
              <div class="profile">
                <div class="profileImg">
                  <img src="../resources/img/프로필이미지.png" width="60" />
                </div>
                <p class="nickname">닉네임</p>
                <p class="date">2023.01.25</p>
                <p class="reviewRecom">추천 0</p>
              </div>
              <!--end: .profile-->
            </li>
            <li>
              <div class="review">
                <div class="reviewImg"></div>
                <div class="reviewContent">
                  <a href="#"><h3>리뷰 제목입니다</h3></a>
                  <p>
                    ㅁㄴㅇㅁ니암니아 ㅁㄴㅇㅁ니암니아 ㅁㄴㅇㅁ니암니아
                    ㅁㄴㅇㅁ니암니아 ㅁㄴㅇㅁ니암니아 ㅁㄴㅇㅁ니암니아
                    ㅁㄴㅇㅁ니암니아 ㅁㄴㅇㅁ니암니아 ㅁㄴㅇㅁ니암니아
                    ㅁㄴㅇㅁ니암니아 ㅁㄴㅇㅁ니암니아 ㅁㄴㅇㅁ니암니아
                    ㅁㄴㅇㅁ니암니아 ㅁㄴㅇㅁ니암니아 ㅁㄴㅇㅁ니암니아
                    ㅁㄴㅇㅁ니암니아 ㅁㄴㅇㅁ니암니아 ㅁㄴㅇㅁ니암니아
                  </p>
                </div>
                <!--end: .reviewContent-->
              </div>
              <!--end: .review-->
              <div class="profile">
                <div class="profileImg">
                  <img src="../resources/img/프로필이미지.png" width="60" />
                </div>
                <p class="nickname">수박이박수</p>
                <p class="date">2023.01.25</p>
                <p class="reviewRecom">추천 1358</p>
              </div>
              <!--end: .profile-->
            </li>
          </ul>
          <div id="boardOption">
            <div class="pager"><p>◀ pager가 들어갈 자리입니다 ▶</p></div>
            <!--end: .pager-->
            <button class="reviewWrite" onclick="location.href='<%=request.getContextPath()%>/food/reviewWrite.do'">
              <i class="xi-pen xi-1x"></i>&nbsp;리뷰쓰기
            </button>
          </div>
          <!--end: #boardOption-->
        </div>
        <!--end: .reviewList-->
      </div>
      <!--end: #board_2-->
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
   	<script>
	
	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places();
	
	
	var h2 = document.getElementById("h2");
	h2.innerHTML= '<h2>'+ps.address_name+'</h2>';
	
	</script>
  </body>
</html>