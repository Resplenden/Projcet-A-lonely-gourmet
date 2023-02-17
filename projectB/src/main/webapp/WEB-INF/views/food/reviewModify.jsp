<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>혼밥의 고수 리뷰 수정</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.1.min.js"></script>
<!-- Jquery 연결 -->
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
    <link href="${pageContext.request.contextPath}/resources/css/reviewModify.css?12" rel="stylesheet" />
    <!--css 연결-->
  
     <script>
      $(document).ready(function () {
        $(".title").keyup(function (e) {
          var content = $(this).val();
          $("#counter").html("(" + content.length + " / 35)"); //글자수 실시간 카운팅

          if (content.length > 35) {
            $(".titleErrorMsg").html("제목은 최대 35자까지 입력 가능합니다.");
            $(".titleErrorMsg").css("float", "right");
            $(".titleErrorMsg").css("color", "red");
            $(".titleErrorMsg").css("font-size", "15px");
            $(".titleErrorMsg").css("font-style", "italic");

            $(this).val(content.substring(0, 35));
            $("#counter").html("(35 / 35)");
          } else {
            $(".errorMsg").html("");
          }
        });

        $(".writezone").keyup(function (e) {
          var content = $(this).val();
          $("#contentCounter").html("(" + content.length + " / 1000)"); //글자수 실시간 카운팅

          if (content.length > 1000) {
            $(".contentErrorMsg").html(
              "본문은 최대 1000자까지 입력 가능합니다."
            );
            $(".contentErrorMsg").css("float", "right");
            $(".contentErrorMsg").css("color", "red");
            $(".contentErrorMsg").css("font-size", "15px");
            $(".contentErrorMsg").css("font-style", "italic");

            $(this).val(content.substring(0, 1000));
            $("#contentCounter").html("(1000 / 1000)");
          } else {
            $(".errorMsg").html("");
          }
        });
        
        $("#file").on('change',function(){
  		  var fileName = $("#file").val();
  		  $(".upload-name").val(fileName);
  		});
        
        
    	$(".write").click(function(){
    		var title = $(".title").val();		
    		var content = $(".writezone").val();
				
    		if((${login == null})){
    			alert("로그인을 하셔야 글을 쓰실 수 있습니다.");
    			location.href="<%=request.getContextPath()%>/member/memberLogin.do";
    			return false;
    		}else if(title == ""){
    			alert("제목을 입력해주세요.");
    			document.frm.title.focus();
    			return false;
    		}else if(content == ""){
    			alert("내용을 입력해주세요.");
    			document.frm.content.focus();
    			return false;
    		}
    			return true;
    	});
    	
      	$(".cancel").on("click", function(){
      		location.href ="review.do?vidx=${vo.vidx}"
      					  +"&name=${title}"
				  		  +"&category=${category}"
				  		  +"&addr=${addr}"
				  		  +"&phone=${phone}";
		});
      })
    </script>
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
      <h1 class="boardName">리뷰 수정</h1>
      <form action="reviewModify.do" method="post" enctype="multipart/form-data" name="frm">
      <input type="hidden" name="writer" value="${login.nickname}">
      <input type="hidden" name="midx" value="${login.midx}">
      <input type="hidden" name="vidx" value="${vo.vidx}">
      <input type="hidden" name="name" value="${title}">
      <input type="hidden" name="addr" value="${addr}">
      <input type="hidden" name="category" value="${category}">
      <input type="hidden" name="phone" value="${phone}">
        <div id="board_1">
          <div class="reviewInfo">
            <span
              >${category} &nbsp; &nbsp;<i class="xi-angle-right-min xi-1x"></i>
              &nbsp;&nbsp;${title}</span
            >
            <input
              type="text"
              class="title"
              name="title"
              minlength="2"
              maxlength="35"
              value="${vo.title}"
            />
            <span style="color: #aaa; font-size: 15.5px" id="counter"
              >(0 / 35)</span
            >
            <br />
            <span class="titleErrorMsg"></span>
          </div>
          <!--end: .reviewInfo-->
          <div class="foodImg">
        	<img src="<%=request.getContextPath()%>/resources/upload/${vo.filename}" width="700" height="550"/>
          </div>
          <!--end: .foodImg-->
          <div class="filebox">
		    <input class="upload-name" value="첨부파일" placeholder="첨부파일">
		    <label for="file">다른 사진으로 변경</label> 
		    <input type="file" name="file" id="file">
		  </div>
		  <!-- end: .filebox -->
          <div class="content">
            <textarea
              class="writezone"
              name="content"
            >${vo.content}</textarea>
            <span style="color: #aaa; font-size: 15.5px" id="contentCounter"
              >(0 / 1000)</span
            >
            <br />
            <span class="contentErrorMsg"></span>
          </div>
          <!--end: .content-->
          <button type="submit" class="write">등록</button>
          <a href="#" class="cancel">취소</a>
        </div>
        <!--end: #board_1-->
      </form>
      <!--end: form-->
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