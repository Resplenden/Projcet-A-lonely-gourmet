<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>혼밥의 고수 공지사항</title>
     <script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.1.min.js"></script>
    <link
      href="../resources/img/_꾸미기_혼밥의고수_파비콘-removebg-preview.png"
      rel="shortcut icon"
    />
    <!--파비콘-->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"
    />
    <!--검색 버튼 아이콘-->
   <link href="${pageContext.request.contextPath}/resources/css/noticeList.css" rel="stylesheet" />
    <!--css 연결-->
  </head>
  <body>
    <nav>
      <div id="topMenu">
        <div class="logo">
          <a href="<%=request.getContextPath()%>">
            <img
              src="../resources/img/사본 -혼밥의고수 로고 초안_대지 1 사본.png"
              width="200px"
            />
          </a>
        </div>
        <!--end: #topMenu-->
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
      </div>
      <!--end: #topMenu-->
      <hr />
      <div id="bottMenu">
   		<ul>
          <li><a href="<%=request.getContextPath()%>/map/map.do">맛집지도</a></li>
          <li><a href="<%=request.getContextPath()%>/board/boardList.do">자유게시판</a></li>
          <li><a href="<%=request.getContextPath()%>/board/noticeList.do">공지사항</a></li>
          <li><a href="<%=request.getContextPath()%>/board/eventList.do">이벤트</a></li>
        </ul>
      </div>
      <!--end: #bottMenu-->
    </nav>
    <!--end: nav-->
    <main>
      <h1>공지사항</h1>
      <div id="inner">
        <div class="boardSet">
          <div class="boardSearch">
            <select class="searchFilter">
              <option>제목</option>
              <option>내용</option>
              <option>관리자</option>
            </select>
            <input type="text" placeholder="검색어를 입력하세요" /><button
              type="submit"
              class="bSearchBtn"
            >
              검색
            </button>
          </div>
          <!--end: .boardSearch-->
          <div class="boardSelect">
            <select>
              <option>최신순</option>
              <option>조회순</option>
              <option>댓글순</option>
              <option>추천순</option>
            </select>
          </div>
          <!--end: .boardSelect-->
        </div>
        <!--end: .boardSet-->
        <div class="boardList">
          <ul>
            <li>
              <a href="#">제목을 입력하세요</a>
              <div class="boardContent">
                <span>필독</span>
                <p>
                  관리자 &nbsp;&#124;&nbsp; 2023.01.16 &nbsp;&#124;&nbsp; 조회수
                  0 &nbsp;&#124;&nbsp; 댓글수 0 &nbsp;&#124;&nbsp; 추천수 0
                </p>
              </div>
              <!--end: boardContent-->
            </li>
            <li>
              <a href="#">Stay foolish, Stay hungry</a>
              <div class="boardContent">
                <p>
                  관리자 &nbsp;&#124;&nbsp; 2023.01.16 &nbsp;&#124;&nbsp; 조회수
                  0 &nbsp;&#124;&nbsp; 댓글수 0 &nbsp;&#124;&nbsp; 추천수 0
                </p>
              </div>
              <!--end: boardContent-->
            </li>
            <li>
              <a href="#">
                흐르는강물을거꾸로거슬러오르는연어들의도무지알수없는 그들만의
                신비한 이유처럼 그 언제 서부터인가 걸어 걸어 걸어오는 이길
                앞으로 얼마나 더 많이 가야만 하는지
              </a>
              <div class="boardContent">
                <p>
                  관리자 &nbsp;&#124;&nbsp; 2023.01.16 &nbsp;&#124;&nbsp; 조회수
                  0 &nbsp;&#124;&nbsp; 댓글수 0 &nbsp;&#124;&nbsp; 추천수 0
                </p>
              </div>
              <!--end: boardContent-->
            </li>
            <li>
              <a href="#">안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕</a>
              <div class="boardContent">
                <p>
                  관리자 &nbsp;&#124;&nbsp; 2023.01.16 &nbsp;&#124;&nbsp; 조회수
                  20930 &nbsp;&#124;&nbsp; 댓글수 1000 &nbsp;&#124;&nbsp; 추천수
                  2000
                </p>
              </div>
              <!--end: boardContent-->
            </li>
            <li>
              <a href="#">coffeecoffeecoffeecoffeecoffeecoffeecoffee</a>
              <div class="boardContent">
                <p>
                  관리자 &nbsp;&#124;&nbsp; 2023.01.16 &nbsp;&#124;&nbsp; 조회수
                  0 &nbsp;&#124;&nbsp; 댓글수 0 &nbsp;&#124;&nbsp; 추천수 0
                </p>
              </div>
              <!--end: boardContent-->
            </li>
            <li>
              <a href="#">FONTFONTFONTFONTFONTFONTFONTFONTFONTFONTFONT</a>
              <div class="boardContent">
                <p>
                  관리자 &nbsp;&#124;&nbsp; 2023.01.16 &nbsp;&#124;&nbsp; 조회수
                  0 &nbsp;&#124;&nbsp; 댓글수 0 &nbsp;&#124;&nbsp; 추천수 0
                </p>
              </div>
              <!--end: boardContent-->
            </li>
            <li>
              <a href="#">글 제목</a>
              <div class="boardContent">
                <p>
                  관리자 &nbsp;&#124;&nbsp; 2023.01.16 &nbsp;&#124;&nbsp; 조회수
                  0 &nbsp;&#124;&nbsp; 댓글수 0 &nbsp;&#124;&nbsp; 추천수 0
                </p>
              </div>
              <!--end: boardContent-->
            </li>
            <li>
              <a href="#">글 제목</a>
              <div class="boardContent">
                <p>
                  관리자 &nbsp;&#124;&nbsp; 2023.01.16 &nbsp;&#124;&nbsp; 조회수
                  0 &nbsp;&#124;&nbsp; 댓글수 0 &nbsp;&#124;&nbsp; 추천수 0
                </p>
              </div>
              <!--end: boardContent-->
            </li>
            <li>
              <a href="#">글 제목</a>
              <div class="boardContent">
                <p>
                  관리자 &nbsp;&#124;&nbsp; 2023.01.16 &nbsp;&#124;&nbsp; 조회수
                  0 &nbsp;&#124;&nbsp; 댓글수 0 &nbsp;&#124;&nbsp; 추천수 0
                </p>
              </div>
              <!--end: boardContent-->
            </li>
            <li>
              <a href="#">글 제목</a>
              <div class="boardContent">
                <p>
                  관리자 &nbsp;&#124;&nbsp; 2023.01.16 &nbsp;&#124;&nbsp; 조회수
                  0 &nbsp;&#124;&nbsp; 댓글수 0 &nbsp;&#124;&nbsp; 추천수 0
                </p>
              </div>
              <!--end: boardContent-->
            </li>
            <li>
              <a href="#">글 제목</a>
              <div class="boardContent">
                <p>
                  관리자 &nbsp;&#124;&nbsp; 2023.01.16 &nbsp;&#124;&nbsp; 조회수
                  0 &nbsp;&#124;&nbsp; 댓글수 0 &nbsp;&#124;&nbsp; 추천수 0
                </p>
              </div>
              <!--end: boardContent-->
            </li>
            <li>
              <a href="#">글 제목</a>
              <div class="boardContent">
                <p>
                  관리자 &nbsp;&#124;&nbsp; 2023.01.16 &nbsp;&#124;&nbsp; 조회수
                  0 &nbsp;&#124;&nbsp; 댓글수 0 &nbsp;&#124;&nbsp; 추천수 0
                </p>
              </div>
              <!--end: boardContent-->
            </li>
            <li>
              <a href="#">글 제목</a>
              <div class="boardContent">
                <p>
                  관리자 &nbsp;&#124;&nbsp; 2023.01.16 &nbsp;&#124;&nbsp; 조회수
                  0 &nbsp;&#124;&nbsp; 댓글수 0 &nbsp;&#124;&nbsp; 추천수 0
                </p>
              </div>
              <!--end: boardContent-->
            </li>
            <li>
              <a href="#">글 제목</a>
              <div class="boardContent">
                <p>
                  관리자 &nbsp;&#124;&nbsp; 2023.01.16 &nbsp;&#124;&nbsp; 조회수
                  0 &nbsp;&#124;&nbsp; 댓글수 0 &nbsp;&#124;&nbsp; 추천수 0
                </p>
              </div>
              <!--end: boardContent-->
            </li>
            <li>
              <a href="#">글 제목</a>
              <div class="boardContent">
                <p>
                  관리자 &nbsp;&#124;&nbsp; 2023.01.16 &nbsp;&#124;&nbsp; 조회수
                  0 &nbsp;&#124;&nbsp; 댓글수 0 &nbsp;&#124;&nbsp; 추천수 0
                </p>
              </div>
              <!--end: boardContent-->
            </li>
          </ul>
        </div>
        <!--end: .boardList-->
        <div id="boardOption">
          <div class="pager"><p>◀ pager가 들어갈 자리입니다 ▶</p></div>
          <!--end: .pager-->
          <div class="btnBar">
            <a href="#">글쓰기</a>
          </div>
          <!--end:.bthBar-->
        </div>
        <!--end: #boardOption-->
      </div>
      <!--end: #inner-->
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
