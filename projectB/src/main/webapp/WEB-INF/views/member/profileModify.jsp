<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.1.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/css/profileModify.css" rel="stylesheet" />
    <!--css 연결-->
<title>혼밥의 고수 회원 정보 수정</title>

</head>
<body>
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
          <img src="<%=request.getContextPath()%>/resources/upload/${login.stname}" class="memberImage" style="width:45px; height:45px; border-r adius: 30px;"> <p class="welcome"><span>${vo.nickname}</span>&nbsp;님, 반갑습니다!</p>
          <a href="<%=request.getContextPath()%>/member/myPage.do?midx=${login.midx}" class="myPage"><p>마이페이지</p></a>
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
          <a href="<%=request.getContextPath()%>/member/myPage.do" class="myPage"><p>마이페이지</p></a>
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

          <li><a href="<%=request.getContextPath()%>/review/list.do">이벤트</a></li>

          <li><a href="<%=request.getContextPath()%>/food/foodList.do">식당</a></li>
        </ul>
      </div>
      <!--end: #bottMenu-->
    </nav>
    <!--end: nav-->
    <main>
      <div id="myPageMenu">
        <h3>마이페이지</h3>
        <ul>
          <li><a href="#">회원 정보</a></li>
          <li><a href="#">선물함</a></li>
          <li><a href="#">메시지 관리</a></li>
          <li><a href="#">리뷰 관리</a></li>
          <li><a href="#">게시물 관리</a></li>
          <li><a href="#">댓글 관리</a></li>
        </ul>
        <br />
        <br />
        <a href="#" class="unregister">회원 탈퇴</a>
      </div>
      <!--end: #myPageMenu-->
      <div id="inner">
        <h1>회원 정보 수정</h1>
        <form action="profileModify.do" method="post" enctype = "multipart/form-data">
        <div id="info">
          <div class="memberImage">	
          <img src="<%=request.getContextPath()%>/resources/upload/${login.stname}" class="memberImage" name="stname" style="width:200px; height:200px; border-radius: 100%;">
            <label class="profileImg" for="profileImg">
              <i class="xi-camera xi-2x"></i>
            </label>
            <input type="file" id="profileImg" name="profileImg"/>
          </div>
        </div>
        <!--end: #info-->
        <input type="hidden" name= "midx" value="${login.midx}"/>
          <table>
            <tbody>
              <tr>
                <td>이름</td>
                <td>${vo.name} </td>
              </tr>
              <tr>
                <td>닉네임</td>
                <td><input type="text" name="nickname" value="${vo.nickname}" /></td>
              </tr>
              <tr>
                <td>아이디</td>
                <td>${vo.id}</td>
             <!--  </tr>
              <tr>
                <td>비밀번호</td>		
                <td id="pwdChange">
                  <button
                    type="button"
                    class="pwdChange"
                  >
                    비밀번호 변경
                  </button>
     
                </td>
              </tr> -->
              <tr>
                <td>성별</td>
                <td>${vo.gender}</td>
              </tr>
              <tr>
                <td>생일</td>
                <td>
                  <input
                    type="date"
                    name="birth"
                    class="birthday"
                    id="date"
                    max="2099-12-31"
                    min="1910-01-01"
                    value="${vo.birth}"
                  />
                </td>
              </tr>
              <tr>
                <td>연락처</td>
                <td><input type="text" name="phone" value="${vo.phone}" /></td>
              </tr>
              <tr>
                <td>이메일</td>
                <td><input type="text" name="email" value="${vo.email}" /></td>
              </tr>
            </tbody>
          </table>
          <!--end: table-->
          <div id="btn">
            <button type="submit" class="profileModify">수정사항 저장</button>
          </div>
        </form>
        <!--end: form-->
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
</body>
</html>