<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>혼밥의 고수 자유게시판</title>
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
    <link href="${pageContext.request.contextPath}/resources/css/boardList.css" rel="stylesheet" />
    <!--css 연결-->
    
  <script type="text/javascript">
  /* 게시판 작성 시간 초 단위 지우기 */
  
  //window.onload = function(){
	  		
		//var wdate = document.getElementsByClassName("wdate");
		
		//for(i=0; i<wdate.length+1; i++){
		//var text = wdate[i].innerText;
		//var sut = text.substring(0,16);
		//console.log(sut);
		

		
		//}

  //}
  
  /* 카테고리 변경시 정렬 */
  function changeCategory(){
  	
  	var category = document.getElementById("category").value;
  	
  	if(category == '자유'){
  		location.href = "list.do?page=1"
  			  		  +"&category=자유"
  			  		  +"&order=최신순"
  		 	  		  +"&perPageNum=${searchVo.perPageNum}" 
  		  	  		  +"&searchType=${searchVo.searchType}"
  		 	  		  +"&searchVal=${searchVo.searchVal}";
  	}else if(category == '후기'){
  		location.href = "list.do?page=1"
  					  +"&category=후기"
  					  +"&order=최신순"
  				 	  +"&perPageNum=${searchVo.perPageNum}" 
  				  	  +"&searchType=${searchVo.searchType}"
  				 	  +"&searchVal=${searchVo.searchVal}";
  	}else if(category == '전체게시판'){
  		location.href = "list.do?page=1"
  					  +"&category=전체게시판"
  			  		  +"&order=최신순"
  				 	  +"&perPageNum=${searchVo.perPageNum}" 
  				  	  +"&searchType=${searchVo.searchType}"
  				 	  +"&searchVal=${searchVo.searchVal}";
  	}
  }

  /* 순서 변경시 정렬 */
  function changeOrder(){
  	
  	var order = document.getElementById("order").value;
  	
  	if(order == '최신순'){
  		location.href = "list.do?page=1"
  				  	  +"&category=카테고리"
  				  	  +"&order=최신순"
  				  	  +"&perPageNum=${searchVo.perPageNum}" 
  				  	  +"&searchType=${searchVo.searchType}"
  				 	  +"&searchVal=${searchVo.searchVal}";
  	}else if(order == '조회순'){
  		location.href = "list.do?page=1"
  				  	  +"&category=카테고리"
  				  	  +"&order=조회순"
  				  	  +"&perPageNum=${searchVo.perPageNum}" 
  				  	  +"&searchType=${searchVo.searchType}"
  				 	  +"&searchVal=${searchVo.searchVal}";
  	}else if(order == '댓글순'){
  		location.href = "list.do?page=1"
  				  	  +"&category=카테고리"
  				  	  +"&order=댓글순"
  				  	  +"&perPageNum=${searchVo.perPageNum}" 
  				  	  +"&searchType=${searchVo.searchType}"
  				 	  +"&searchVal=${searchVo.searchVal}";
  	}else if(order == '추천순'){
  		location.href = "list.do?page=1"
  				  	  +"&category=카테고리"
  				  	  +"&order=추천순"
  				  	  +"&perPageNum=${searchVo.perPageNum}" 
  				  	  +"&searchType=${searchVo.searchType}"
  				 	  +"&searchVal=${searchVo.searchVal}";
  	}
  }
 
  $(function(){
	  
		//새로 검색할시 1페이지로 돌아가게 하기
	 	var searchForm = $("#searchForm");
		$("#searchForm button").on("click",function(e){
			searchForm.find("input[name='page']").val("1");
			e.preventDefault();
			
			searchForm.submit();
		});
  });
  
	function not(){
		alert("서비스 준비중입니다.");
	}
	
  </script>
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
        <!--end: .logo-->
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
          <li><a href="#" onclick="not()">공지사항</a></li>
          <li><a href="#" onclick="not()">이벤트</a></li>
        </ul>
      </div>
      <!--end: #bottMenu-->
    </nav>
    <!--end: nav-->
    <main>
      <h1 class="boardName">자유게시판</h1>
      <div id="inner">
        <div class="boardSet">
          <div class="boardSearch">
          <form action="list.do" method="get" id="searchForm">
		  <input type="hidden" name="page" value="${searchVo.page}"> 
		  <input type="hidden" name="perPageNum" value="${searchVo.perPageNum}">
            <select class="searchType" name="searchType">
              	<option value="title" <c:if test="${searchVo.searchType eq 'title'}">selected</c:if>>제목</option>
				<option value="content" <c:if test="${searchVo.searchType eq 'content'}">selected</c:if>>내용</option>
				<option value="writer" <c:if test="${searchVo.searchType eq 'writer'}">selected</c:if>>작성자</option>
            </select>
            <input type="text" placeholder="검색어를 입력하세요" name="searchVal" value="${searchVo.searchVal}"/><button
              type="submit"
              class="bSearchBtn"
            >
              	검색
            </button>
          </form>
          </div>
          <!--end: .boardSearch-->
          <div class="boardSelect">
            <select id="category" onchange = "changeCategory();">
              <option>전체게시판</option>
			  <option <c:if test="${searchVo.category eq '자유' }">selected</c:if>>자유</option>
			  <option <c:if test="${searchVo.category eq '후기' }">selected</c:if>>후기</option>
            </select>
            <select id="order" onchange = "changeOrder();">
              <option <c:if test="${searchVo.order eq '최신순' }">selected</c:if>>최신순</option>
              <option <c:if test="${searchVo.order eq '조회순' }">selected</c:if>>조회순</option>
              <option <c:if test="${searchVo.order eq '댓글순' }">selected</c:if>>댓글순</option>
              <option <c:if test="${searchVo.order eq '추천순' }">selected</c:if>>추천순</option>
            </select>
          </div>
          <!--end: .boardSelect-->
        </div>
        <!--end: .boardSet-->
        <div class="boardList">
          <ul>
          	<c:forEach items="${list}" var="vo">
	            <li>
	              <a href="<%=request.getContextPath()%>/board/view.do?bidx=${vo.bidx}&page=${searchVo.page}&category=${searchVo.category}&order=${searchVo.order}&perPageNum=${searchVo.perPageNum}&searchType=${searchVo.searchType}&searchVal=${searchVo.searchVal}">${vo.title}</a>
	              <div class="boardContent">
	                <span>${vo.category}</span>
	                <p>${vo.writer} &nbsp;&#124;&nbsp;
	               ${vo.wdate.substring(0,16)}
	               &nbsp;&#124;&nbsp; 조회수 ${vo.hit}&nbsp;&#124;&nbsp;
	                 댓글수 ${vo.replyCnt} &nbsp;&#124;&nbsp;
	                추천수 ${vo.likeCnt}</p>
	              </div>
	              <!--end: boardContent-->
	            </li>
            </c:forEach>
          </ul>
        </div>
        <!--end: .boardList-->
        <div id="boardOption">
          <div class="pager">
          	<ul class="pagination">
			<!-- 이전 페이지 -->	
			<c:if test="${pageMaker.prev}">
				<a href="<%=request.getContextPath() %>/board/list.do?page=${pageMaker.startPage-1}&category=${searchVo.category}&order=${searchVo.order}&perPageNum=${searchVo.perPageNum}&searchType=${searchVo.searchType}&searchVal=${searchVo.searchVal}">◀</a>
			</c:if>
			<!-- 현재 페이지 -->	
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
				<c:choose>
					<c:when test="${pageMaker.endPage == 0}">
					<p></p>
					</c:when>
					<c:when test="${num == searchVo.page}">
						<b>${num}</b>
					</c:when>
					<c:when test="${num != searchVo.page }">
						<a href="<%=request.getContextPath() %>/board/list.do?page=${num}&category=${searchVo.category}&order=${searchVo.order}&perPageNum=${searchVo.perPageNum}&searchType=${searchVo.searchType}&searchVal=${searchVo.searchVal}">${num}</a>
					</c:when>
				</c:choose>
			</c:forEach>
			<!-- 다음 페이지 -->	
			<c:if test="${pageMaker.next}">
				<a href="<%=request.getContextPath() %>/board/list.do?page=${pageMaker.endPage+1}&category=${searchVo.category}&order=${searchVo.order}&perPageNum=${searchVo.perPageNum}&searchType=${searchVo.searchType}&searchVal=${searchVo.searchVal}">▶</a>
			</c:if>
			</ul>
          </div>
          <!--end: .pager-->
          <c:if test="${login != null}">
          <div class="btnBar">
            <a href="<%=request.getContextPath()%>/board/write.do">글쓰기</a>
          </div>
          <!--end:.bthBar-->
          </c:if>
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