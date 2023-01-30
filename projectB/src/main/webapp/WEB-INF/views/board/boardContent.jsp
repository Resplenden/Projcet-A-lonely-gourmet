<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>글제목</title>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/boardLike.js"></script>
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
    <link href="${pageContext.request.contextPath}/resources/css/boardContent.css" rel="stylesheet" />
    <!--css 연결-->
    <!-- <script>
      $(function(){
       $('.commentReply').on('click',function(){
        
       });
    });
    </script> -->
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
      <h1 class="boardName">자유게시판</h1>
      <div id="board">
        <div id="boardTitle">
          <div class="boardInfo">
            <span>자유</span>
            <h1>안녕하세요</h1>
            <h2>2023. 01. 19</h2>
            <p>조회수 1회</p>
          </div>
          <!--end: .boardInfo-->
          <div class="profile">
            <div class="profileImg">
              <img src="../resources/img/프로필이미지.png" width="60" />
            </div>
            <p>관리자</p>
          </div>
          <!--end: .profile-->
        </div>
        <!--end: #boardTitle-->
        <div id="boardContent">
          <p>
          BoardContent입니다
          </p>
        </div>
        <!--end: #boardContent-->
        <div class="like">
          <a href="#" class="like-button">
            <?xml version="1.0" encoding="utf-8"?>
            <svg width="30" height="30" viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg"><path d="M320 1344q0-26-19-45t-45-19q-27 0-45.5 19t-18.5 45q0 27 18.5 45.5t45.5 18.5q26 0 45-18.5t19-45.5zm160-512v640q0 26-19 45t-45 19h-288q-26 0-45-19t-19-45v-640q0-26 19-45t45-19h288q26 0 45 19t19 45zm1184 0q0 86-55 149 15 44 15 76 3 76-43 137 17 56 0 117-15 57-54 94 9 112-49 181-64 76-197 78h-129q-66 0-144-15.5t-121.5-29-120.5-39.5q-123-43-158-44-26-1-45-19.5t-19-44.5v-641q0-25 18-43.5t43-20.5q24-2 76-59t101-121q68-87 101-120 18-18 31-48t17.5-48.5 13.5-60.5q7-39 12.5-61t19.5-52 34-50q19-19 45-19 46 0 82.5 10.5t60 26 40 40.5 24 45 12 50 5 45 .5 39q0 38-9.5 76t-19 60-27.5 56q-3 6-10 18t-11 22-8 24h277q78 0 135 57t57 135z"/></svg>
            </a>
            <div class="likeCount">
              <span id="counter">추천&nbsp;&nbsp;&nbsp;0</span>
            </div>
          </div>
          <!--end: #like-cnt-->
        </div>
        <!--end: .like-->
      </div>
      <!--end: #board-->
      <div id="commentPage">
        <h3 class="commentCount">댓글&nbsp;&nbsp;&nbsp;<span>0</span></h3>
        <div class="commentWrite">
          <textarea placeholder="댓글을 입력해주세요."></textarea>
          <button type="submit" method="post">등록</button>
        </div>
        <!--end: .commentWrite-->
        <div class="commentList">
          <ul>
            <li>
          <div class="comment">
            <div class="member"><img src="../resources/img/프로필이미지.png" width="42.5" />
            <p class="nickname">닉네임</p>
            </div>
            <!--end: .member-->
            <div class="content">
              <p> 댓글창입니다 댓글창에 오신 여러분 환영합니다 댓글창에서 즐거운 소통 시간을 나눠보시길 바랍니다 감사합니다 
                </p>
                <div class="commentOption">
                  <p>2023.01.20</p>
                <button type="button" class="commentReply"><i class="xi-share xi-1x"></i>답변</button>
              </div>
              <!--end: .commentOption-->
            </div>
              <!--end: content-->
          </div>
          <!--end: .comment-->
        </li>
        <li>
      <div class="comment">
        <div class="member"><img src="../resources/img/프로필이미지.png" width="42.5" />
        <p class="nickname">닉네임</p>
        </div>
        <!--end: .member-->
        <div class="content">
          <p> 
            댓글창입니다 댓글창에 오신 여러분 환영합니다 댓글창에서 즐거운 소통 시간을 나눠보시길 바랍니다 감사합니다 
            </p>
            <div class="commentOption">
              <p>2023.01.20</p>
            <button type="button" class="commentReply"><i class="xi-share xi-1x"></i>답변</button>
          </div>
          <!--end: .commentOption-->
        </div>
          <!--end: content-->
      </div>
      <!--end: .comment-->
    </li>
    <li>
  <div class="comment">
    <div class="member"><img src="../resources/img/프로필이미지.png" width="42.5" />
    <p class="nickname">닉네임</p>
    </div>
    <!--end: .member-->
    <div class="content">
      <p> 댓글창입니다 댓글창에 오신 여러분 환영합니다 댓글창에서 즐거운 소통 시간을 나눠보시길 바랍니다 감사합니다 
        </p>
        <div class="commentOption">
          <p>2023.01.20</p>
        <button type="button" class="commentReply"><i class="xi-share xi-1x"></i>답변</button>
      </div>
      <!--end: .commentOption-->
    </div>
      <!--end: content-->
  </div>
  <!--end: .comment-->
</li>
<li>
  <div class="comment">
    <div class="member"><img src="../resources/img/프로필이미지.png" width="42.5" />
    <p class="nickname">닉네임</p>
    </div>
    <!--end: .member-->
    <div class="content">
      <p> 댓글창입니다 댓글창에 오신 여러분 환영합니다 댓글창에서 즐거운 소통 시간을 나눠보시길 바랍니다 감사합니다 
        </p>
        <div class="commentOption">
          <p>2023.01.20</p>
        <button type="button" class="commentReply"><i class="xi-share xi-1x"></i>답변</button>
      </div>
      <!--end: .commentOption-->
    </div>
      <!--end: content-->
  </div>
  <!--end: .comment-->
</li>
<li>
  <div class="comment">
    <div class="member"><img src="../resources/img/프로필이미지.png" width="42.5" />
    <p class="nickname">닉네임</p>
    </div>
    <!--end: .member-->
    <div class="content">
      <p> 댓글창입니다 댓글창에 오신 여러분 환영합니다 댓글창에서 즐거운 소통 시간을 나눠보시길 바랍니다 감사합니다 
        </p>
        <div class="commentOption">
          <p>2023.01.20</p>
        <button type="button" class="commentReply"><i class="xi-share xi-1x"></i>답변</button>
      </div>
      <!--end: .commentOption-->
    </div>
      <!--end: content-->
  </div>
  <!--end: .comment-->
</li>
<li>
  <div class="comment">
    <div class="member"><img src="../resources/img/프로필이미지.png" width="42.5" />
    <p class="nickname">닉네임</p>
    </div>
    <!--end: .member-->
    <div class="content">
      <p> 댓글창입니다 댓글창에 오신 여러분 환영합니다 댓글창에서 즐거운 소통 시간을 나눠보시길 바랍니다 감사합니다 
        </p>
        <div class="commentOption">
          <p>2023.01.20</p>
        <button type="button" class="commentReply"><i class="xi-share xi-1x"></i>답변</button>
      </div>
      <!--end: .commentOption-->
    </div>
      <!--end: content-->
  </div>
  <!--end: .comment-->
</li>
<li>
  <div class="comment">
    <div class="member"><img src="../resources/img/프로필이미지.png" width="42.5" />
    <p class="nickname">닉네임</p>
    </div>
    <!--end: .member-->
    <div class="content">
      <p> 댓글창입니다 댓글창에 오신 여러분 환영합니다 댓글창에서 즐거운 소통 시간을 나눠보시길 바랍니다 감사합니다 
        </p>
        <div class="commentOption">
          <p>2023.01.20</p>
        <button type="button" class="commentReply"><i class="xi-share xi-1x"></i>답변</button>
      </div>
      <!--end: .commentOption-->
    </div>
      <!--end: content-->
  </div>
  <!--end: .comment-->
</li>
<li>
  <div class="comment">
    <div class="member"><img src="../resources/img/프로필이미지.png" width="42.5" />
    <p class="nickname">닉네임</p>
    </div>
    <!--end: .member-->
    <div class="content">
      <p> 댓글창입니다 댓글창에 오신 여러분 환영합니다 댓글창에서 즐거운 소통 시간을 나눠보시길 바랍니다 감사합니다 
        </p>
        <div class="commentOption">
          <p>2023.01.20</p>
        <button type="button" class="commentReply"><i class="xi-share xi-1x"></i>답변</button>
      </div>
      <!--end: .commentOption-->
    </div>
      <!--end: content-->
  </div>
  <!--end: .comment-->
</li>
<li>
  <div class="comment">
    <div class="member"><img src="../resources/img/프로필이미지.png" width="42.5" />
    <p class="nickname">닉네임</p>
    </div>
    <!--end: .member-->
    <div class="content">
      <p> 댓글창입니다 댓글창에 오신 여러분 환영합니다 댓글창에서 즐거운 소통 시간을 나눠보시길 바랍니다 감사합니다 
        </p>
        <div class="commentOption">
          <p>2023.01.20</p>
        <button type="button" class="commentReply"><i class="xi-share xi-1x"></i>답변</button>
      </div>
      <!--end: .commentOption-->
    </div>
      <!--end: content-->
  </div>
  <!--end: .comment-->
</li>
<li>
  <div class="comment">
    <div class="member"><img src="../resources/img/프로필이미지.png" width="42.5" />
    <p class="nickname">닉네임</p>
    </div>
    <!--end: .member-->
    <div class="content">
      <p> 댓글창입니다 댓글창에 오신 여러분 환영합니다 댓글창에서 즐거운 소통 시간을 나눠보시길 바랍니다 감사합니다 
        </p>
        <div class="commentOption">
          <p>2023.01.20</p>
        <button type="button" class="commentReply"><i class="xi-share xi-1x"></i>답변</button>
      </div>
      <!--end: .commentOption-->
    </div>
      <!--end: content-->
  </div>
  <!--end: .comment-->
</li>
</ul>
    </div>
        <!--end: .commentList-->
      </div>
      <!--end: #commentPage-->
      <div id="listOption">
        <div class="pager"><p>◀ pager가 들어갈 자리입니다 ▶</p></div>
        <!--end: .pager-->
        <div class="btnBar">
          <a href="#">홈으로</a>
        </div>
        <!--end:.bthBar-->
      </div>
      <!--end: #boardOption-->
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
