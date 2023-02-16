<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%
String title = request.getParameter("title");
%>
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
    <script>
    $(function(){
    	var img = document.getElementsByClassName("foodImg");
    	var title = document.getElementById("title").value;
    	var menuInfo = document.getElementsByClassName("menuInfo");
    	
    	$(menuInfo).prepend('<li><p class="menuName1">안농</p><p class="price1">가격</p></li>');
    	$(menuInfo).prepend('<li><p class="menuName2">ㅎㅎ</p><p class="price2">가격</p></li>');
    	$(menuInfo).prepend('<li><p class="menuName3">ㅎㅎ</p><p class="price3">가격</p></li>');
    	$(menuInfo).prepend('<li><p class="menuName4">ㅎㅎ</p><p class="price4">가격</p></li>');
    				
		console.log("title:"+ title);
		console.log("img:" +img.length);
		console.log("menuInfo:"+menuInfo.length);

		

		
		if(title == "베테랑"){
			$(".foodImg").css("background","url('../resources/img/foodImg/베테랑.jpg')");
			$(".foodImg").css("backgroundPosition","center");
			$(".foodImg").css("backgroundSize","100%");
			$(".foodImg").css("backgroundRepeat","no-repeat");
			
			$(".menuName4").text("칼국수");
			$(".menuName3").text("쫄면");
			$(".menuName2").text("만두");
			$(".menuName1").text("콩국수");
			
			$(".price4").text("8,000원");
			$(".price3").text("7,000원");
			$(".price2").text("5,500원");
			$(".price1").text("9,000원");
			
			
		}else if(title == "삼백집 전주본점"){
			$(".foodImg").css("background","url('../resources/img/foodImg/삼백집 전주본점.jpg')");
			$(".foodImg").css("backgroundPosition","center");
			$(".foodImg").css("backgroundSize","100%");
			$(".foodImg").css("backgroundRepeat","no-repeat");
			
			$(".menuName4").text("콩나물국밥");
			$(".menuName3").text("고추군만두");
			$(".menuName2").text("한우선지온반");
			$(".menuName1").text("삼겹간장조림");
			
			$(".price4").text("8,000원");
			$(".price3").text("5,000원");
			$(".price2").text("10,000원");
			$(".price1").text("19,000원");
			
		}else if(title == "고궁 전주본점"){
			$(".foodImg").css("background","url('../resources/img/foodImg/고궁 전주본점.jpg')");
			$(".foodImg").css("backgroundPosition","center");
			$(".foodImg").css("backgroundSize","100%");
			$(".foodImg").css("backgroundRepeat","no-repeat");
			
			$(".menuName4").text("육회비빔밥");
			$(".menuName3").text("전주전통비빔밥");
			$(".menuName2").text("돌솥비빔밥");
			$(".menuName1").text("고궁상차림(1인)");
			
			$(".price4").text("15,000원");
			$(".price3").text("12,000원");
			$(".price2").text("12,000원");
			$(".price1").text("38,000원");
			
			
		}else if(title == "진미집 본점"){
			$(".foodImg").css("background","url('../resources/img/foodImg/진미집 본점.jpg')");
			$(".foodImg").css("backgroundPosition","center");
			$(".foodImg").css("backgroundSize","100%");
			$(".foodImg").css("backgroundRepeat","no-repeat");
			
			$(".menuName4").text("돼지불고기");
			$(".menuName3").text("양념족발");
			$(".menuName2").text("닭발볶음");
			$(".menuName1").text("오징어볶음");
			
			$(".price4").text("12,000원");
			$(".price3").text("12,000원");
			$(".price2").text("15,000원");
			$(".price1").text("15,000원");
			
		}else if(title == "한국집"){
			$(".foodImg").css("background","url('../resources/img/foodImg/한국집.jpeg')");
			$(".foodImg").css("backgroundPosition","center");
			$(".foodImg").css("backgroundSize","100%");
			$(".foodImg").css("backgroundRepeat","no-repeat");
			
			$(".menuName4").text("한국집 정식");
			$(".menuName3").text("갈비탕");
			$(".menuName2").text("된장찌개");
			$(".menuName1").text("육개장");
			
			$(".price4").text("35,000원");
			$(".price3").text("15,000원");
			$(".price2").text("8,000원");
			$(".price1").text("10,000원");
				
			
		}else if(title == "PNB풍년제과 전주 본점"){
			$(".foodImg").css("background","url('../resources/img/foodImg/PNB풍년제과 전주 본점.jpg')");
			$(".foodImg").css("backgroundPosition","center");
			$(".foodImg").css("backgroundSize","100%");
			$(".foodImg").css("backgroundRepeat","no-repeat");
			
			$(".menuName4").text("PNB 오리지널초코파이");
			$(".menuName3").text("PNB 화이트초코파이");
			$(".menuName2").text("콘붓세");
			$(".menuName1").text("땅콩센베");
			
			$(".price4").text("2,300원");
			$(".price3").text("2,500원");
			$(".price2").text("2,300원");
			$(".price1").text("10,000원");
			
		}else if(title == "전주왱이콩나물국밥전문점"){
			$(".foodImg").css("background","url('../resources/img/foodImg/전주왱이콩나물국밥전문점.jpg')");
			$(".foodImg").css("backgroundPosition","center");
			$(".foodImg").css("backgroundSize","100%");
			$(".foodImg").css("backgroundRepeat","no-repeat");
			
			$(".menuName4").text("전주왱이국밥");
			$(".menuName3").text("모주 한잔");
			$(".menuName2").text("모주 작은병");
			$(".menuName1").text("모주 큰병");
			
			$(".price4").text("8,000원");
			$(".price3").text("2,000원");
			$(".price2").text("5,000원");
			$(".price1").text("10,000원");
		
			
		}else if(title == "호남각"){
			$(".foodImg").css("background","url('../resources/img/foodImg/호남각.jpg')");
			$(".foodImg").css("backgroundPosition","center");
			$(".foodImg").css("backgroundSize","100%");
			$(".foodImg").css("backgroundRepeat","no-repeat");
			
			$(".menuName4").text("정찬 (한상차림 한정식)");
			$(".menuName3").text("불낙전골 정식");
			$(".menuName2").text("소불고기 비빔밥 정식");
			$(".menuName1").text("소갈비찜 비빔밥 정식");
			
			$(".price4").text("41,000원");
			$(".price3").text("25,000원");
			$(".price2").text("32,000원");
			$(".price1").text("35,000원");
			
			
		}else if(title == "풍년제과 본점"){
			$(".foodImg").css("background","url('../resources/img/foodImg/풍년제과 본점.jpg')");
			$(".foodImg").css("backgroundPosition","center");
			$(".foodImg").css("backgroundSize","100%");
			$(".foodImg").css("backgroundRepeat","no-repeat");
			
			$(".menuName4").text("우리밀 수제 초코파이 (10개)");
			$(".menuName3").text("우리밀 리얼 초코파이 (10개)");
			$(".menuName2").text("우리밀 화이트 초코파이 (10개)");
			$(".menuName1").text("우리밀 화이트 붓세 (10개)");
			
			$(".price4").text("23,000원");
			$(".price3").text("25,000원");
			$(".price2").text("25,000원");
			$(".price1").text("23,000원");
			
		
		}else if(title == "조점례남문피순대"){
			$(".foodImg").css("background","url('../resources/img/foodImg/조점례남문피순대.jpg')");
			$(".foodImg").css("backgroundPosition","center");
			$(".foodImg").css("backgroundSize","100%");
			$(".foodImg").css("backgroundRepeat","no-repeat");
			
			$(".menuName4").text("순대국밥");
			$(".menuName3").text("암뽕순대국밥 (특)");
			$(".menuName2").text("피순대 (소)");
			$(".menuName1").text("피순대 (대)");
			
			$(".price4").text("8,000원");
			$(".price3").text("9,000원");
			$(".price2").text("13,000원");
			$(".price1").text("18,000원");
			
			
		}else if(title == "한국관 본점"){
			$(".foodImg").css("background","url('../resources/img/foodImg/한국관 본점.jpg')");
			$(".foodImg").css("backgroundPosition","center");
			$(".foodImg").css("backgroundSize","100%");
			$(".foodImg").css("backgroundRepeat","no-repeat");
			
			$(".menuName4").text("육회비빔밥");
			$(".menuName3").text("놋그릇비빔밥");
			$(".menuName2").text("돌그릇비빔밥");
			$(".menuName1").text("인삼비빔밥");
			
			$(".price4").text("15,000원");
			$(".price3").text("13,000원");
			$(".price2").text("13,000원");
			$(".price1").text("16,000원");
			
			
		}else if(title == "가족회관"){
			$(".foodImg").css("background","url('../resources/img/foodImg/가족회관.jpg')");
			$(".foodImg").css("backgroundPosition","center");
			$(".foodImg").css("backgroundSize","100%");
			$(".foodImg").css("backgroundRepeat","no-repeat");
			
			$(".menuName4").text("육회비빔밥");
			$(".menuName3").text("전주비빔밥");
			$(".menuName2").text("가족회관 정식 (4인 기준 한상차림/예약필수)");
			$(".menuName1").text("육회비빔밥 (포장)");
			
			$(".price4").text("17,000원");
			$(".price3").text("14,000원");
			$(".price2").text("120,000원");
			$(".price1").text("12,000원");
		
		}else if(title == "소담촌 전주효자점"){
			$(".foodImg").css("background","url('../resources/img/foodImg/소담촌 전주효자점.jpg')");
			$(".foodImg").css("backgroundPosition","center");
			$(".foodImg").css("backgroundSize","100%");
			$(".foodImg").css("backgroundRepeat","no-repeat");
			
			$(".menuName4").text("월남쌈 버섯 샤브");
			$(".menuName3").text("월남쌈 샤브 정식");
			$(".menuName2").text("월남쌈 버섯 샤브 정식");
			$(".menuName1").text("명품 한우 샤브 정식");
			
			$(".price4").text("20,800원");
			$(".price3").text("13,900원");
			$(".price2").text("15,800원");
			$(".price1").text("18,000원");	
			
		}else if(title == "자매갈비전골"){
			$(".foodImg").css("background","url('../resources/img/foodImg/자매갈비전골.jpg')");
			$(".foodImg").css("backgroundPosition","center");
			$(".foodImg").css("backgroundSize","100%");
			$(".foodImg").css("backgroundRepeat","no-repeat");
			
			$(".menuName4").text("갈비전골");
			$(".menuName3").text("부추볶음밥");
			$(".menuName2").text("만두");
			$(".menuName1").text("라면사리");
			
			$(".price4").text("16,000원");
			$(".price3").text("3,000원");
			$(".price2").text("5,000원");
			$(".price1").text("2,000원");
			
		}else if(title == "전일갑오"){
			$(".foodImg").css("background","url('../resources/img/foodImg/전일갑오.jpg')");
			$(".foodImg").css("backgroundPosition","center");
			$(".foodImg").css("backgroundSize","100%");
			$(".foodImg").css("backgroundRepeat","no-repeat");
			
			$(".menuName4").text("황태포");
			$(".menuName3").text("계란말이");
			$(".menuName2").text("갑오징어 (크기별)");
			$(".menuName1").text("병맥주");
			
			$(".price4").text("12,000원");
			$(".price3").text("8,000원");
			$(".price2").text("20,000 ~ 30,000원");
			$(".price1").text("3,000원");
			
			
		}else if(title == "다문"){
			$(".foodImg").css("background","url('../resources/img/foodImg/다문.jpg')");
			$(".foodImg").css("backgroundPosition","center");
			$(".foodImg").css("backgroundSize","100%");
			$(".foodImg").css("backgroundRepeat","no-repeat");
			
			$(".menuName4").text("다문정식");
			$(".menuName3").text("굴비 한상");
			$(".menuName2").text("홍어 추가 (소)");
			$(".menuName1").text("홍어 추가 (대)");
			
			$(".price4").text("30,000원");
			$(".price3").text("25,000원");
			$(".price2").text("15,000원");
			$(".price1").text("30,000원");
			
			
		}
    });
	</script>

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
        <input type="hidden" value="${title}" id="title">
          <h2>${title}</h2>
          <h3>${category}</h3>
          <ul>
            <li>
              <p>
                <i class="xi-maker xi-1x"></i>&nbsp;&nbsp;&nbsp;${addr}
              </p>
            </li>
               <c:if test="${phone != ''}">
            <li>
              <p><i class="xi-call xi-1x"></i>&nbsp;&nbsp;&nbsp;${phone}</p>
            </li>
            </c:if>	
          </ul>
          <button class="reviewWrite" onclick="location.href='<%=request.getContextPath()%>/food/reviewWrite.do?name=${title}&category=${category}&addr=${addr}&phone=${phone}'">
            <i class="xi-pen xi-1x"></i>&nbsp;리뷰쓰기
          </button>
          <button class="recommend">추천 0</button>
        </div>
        <!--end: .info-->
        <div class="menu">
          <h3>대표 메뉴</h3>
          <ul class="menuInfo">
          </ul>
        </div>
        <!--end: .menu-->
      </div>
      <!--end: #board_1-->
      <div id="board_2">
        <div class="reviewList">
          <h3>방문자 리뷰</h3>
          <p class="count">${reviewPageMaker.reviewTotalCount}건</p>
          <ul>
           <c:forEach items="${review}" var="review">
          	<input type="hidden" id="vidx" name="vidx" value="${review.vidx}">
	            <li>
	              <div class="review">
	                <div class="reviewImg">
	                  <img src="<%=request.getContextPath()%>/resources/upload/${review.filename}" width="250" height="160"/>
	                </div>
	                <div class="reviewContent">
	                  <a href="<%=request.getContextPath()%>/food/review.do?vidx=${review.vidx}&name=${title}&category=${category}">${review.title}</a>
	                  <p>${review.content}</p>
	                </div>
	                <!--end: .reviewContent-->
	              </div>
	              <!--end: .review-->
	              <div class="profile">
	                <div class="profileImg">
	                  <img src="../resources/img/프로필이미지.png" width="60" />
	                </div>
	                <p class="nickname">${review.writer}</p>
	                <p class="date">${review.wdate}</p>
	                <p class="reviewRecom">추천 ${review.likecnt}</p>
	              </div>
	              <!--end: .profile-->
	            </li>
            </c:forEach>
          </ul>
          <div id="boardOption">
            <div class="pager">
            	<!-- 이전 페이지 -->	
				<c:if test="${reviewPageMaker.prev}">
					<a href="<%=request.getContextPath() %>/food/foodView.do?reviewPage=${reviewPageMaker.reviewStartPage-1}&page=${searchVo.page}&category=${searchVo.category}&order=${searchVo.order}&searchType=${searchVo.searchType}&searchVal=${searchVo.searchVal}">◀</a>
				</c:if>
				<!-- 현재 페이지 -->	
				<c:forEach begin="${reviewPageMaker.reviewStartPage}" end="${reviewPageMaker.reviewEndPage}" var="num">
					<c:choose>
						<c:when test="${reviewPageMaker.reviewEndPage == 0}">
							<p></p>
						</c:when>
						<c:when test="${num == searchVo.reviewPage}">
							<b>${num}</b>
						</c:when>
						<c:when test="${num != searchVo.reviewPage}">
							<a href="<%=request.getContextPath() %>/food/foodView.do?reviewPage=${num}&name=${title}&category=${category}&addr=${addr}&phone=${phone}">${num}</a>
						</c:when>
					</c:choose>
				</c:forEach>
				<!-- 다음 페이지 -->	
				<c:if test="${reviewPageMaker.next}">
					<a href="<%=request.getContextPath() %>/food/foodView.do?reviewPage=${reviewPageMaker.reviewEndPage+1}&page=${searchVo.page}&category=${searchVo.category}&order=${searchVo.order}&searchType=${searchVo.searchType}&searchVal=${searchVo.searchVal}">▶</a>
				</c:if>
            </div>
            <!--end: .pager-->
            <button class="reviewWrite" onclick="location.href='<%=request.getContextPath()%>/food/reviewWrite.do?name=${title}&category=${category}&addr=${addr}&phone=${phone}'">
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
  </body>
</html>