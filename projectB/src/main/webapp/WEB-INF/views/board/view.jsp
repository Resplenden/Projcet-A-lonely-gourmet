<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
  	<script type="text/javascript">
  	
  	
	function not(){
		alert("서비스 준비중입니다.");
	}
	
  	
  	$(function(){
  		
  		$(".listBtn").on("click", function(){
  		
  			location.href ="list.do?page=${searchVo.page}"
  						  +"&category=${searchVo.category}"
  						  +"&order=${searchVo.order}"
  					 	  +"&perPageNum=${searchVo.perPageNum}" 
  					  	  +"&searchType=${searchVo.searchType}"
  					 	  +"&searchVal=${searchVo.searchVal}"; 
  		});
  		
  		$(".modifyBtn").on("click", function(){
  		
  			location.href ="modify.do?bidx=${list.bidx}"
  						  +"&page=${searchVo.page}"
  						  +"&category=${searchVo.category}"
  						  +"&order=${searchVo.order}"
  					 	  +"&perPageNum=${searchVo.perPageNum}"
  					  	  +"&searchType=${searchVo.searchType}"
  					  	  +"&searchVal=${searchVo.searchVal}"; 
  		});
  		
  		$(".deleteBtn").on("click", function(){
  		
  			location.href ="delete.do?bidx=${list.bidx}"
  						  +"&page=${searchVo.page}"
  						  +"&category=${searchVo.category}"
  						  +"&order=${searchVo.order}"
  					 	  +"&perPageNum=${searchVo.perPageNum}" 
  					  	  +"&searchType=${searchVo.searchType}"
  					  	  +"&searchVal=${searchVo.searchVal}"; 
  		});
  
  		//댓글 등록을 누를시
  		$(".commentWrite button").on("click", function(){
  
  			if(${login == null}){
  				alert("로그인을 하셔야 댓글을 다실 수 있습니다.");
  				location.href="../member/memberLogin.do";
  			}else{
  			
  			var bidx = $("#bidx").val();
  	  		var content = $("[name=content]").val();
			console.log(bidx);
			console.log(content);
  	  		$.ajax({
  	  			url:"../reply/write.do",
  	  			data:{"bidx":bidx,
  	  				  "content":content},
  	  			success:function(result){
  	  				if(result==1){
  	  					location.reload();	
  	  				}
  	  			}
  	  		})
  				return true;
  			}
  		});
  	
	})

  	//게시물의 추천 버튼 클릭 시
  	function like(){
  		
  		if(${login == null}){
			alert("로그인을 하셔야 추천을 누르실 수 있습니다.");
			location.href="<%=request.getContextPath()%>/member/memberLogin.do";
  		}else if(${login.nickname == list.writer}){
			alert("본인 글은 추천하실 수 없습니다.")
			return false;
		}else{
	  		
			var bidx = $("#bidx").val();
	  			
	  		$.ajax({
	  			url:"like.do",
	  			data:{"bidx":bidx},
	  			success:function(likeCheck){
	  					
	  				if(likeCheck == 0){
	  					location.reload();
	  				}else if(likeCheck == 1){
	  					alert("이미 추천하신 글입니다.");
	  					location.reload();
	  				}
	  			}	
	  		})
				return true;
		}
  		
  	}

  	//댓글의 추천버튼 클릭시
  	function replyLike(ridx,writer,nickname){
 
  		if(${login == null}){
			alert("로그인을 하셔야 추천을 누르실 수 있습니다.");
			location.href="../member/memberLogin.do";
  		}else if(nickname == writer){
			alert("본인 댓글은 추천하실 수 없습니다.")
			return false;
  		}else{
  		
	  		$.ajax({
	  			url:"../reply/replyLike.do",
	  			data:{"ridx":ridx},
	  			success:function(likeCheck){
	  					
	  			if(likeCheck == 0){
	  				location.reload();
	  			}else if(likeCheck == 1){
	  				alert("이미 추천하거나 비추천한 댓글입니다.");
	  				location.reload();
	  			}
	  			}	
	  		})
				return true;
		}
  	}
  
 

  	//댓글 수정버튼 클릭시 수정 폼 생성
  	function modifyBtn(ridx,content){

  		var reply = "";
  		reply += "<textarea rows='3' cols='30' name='replyContent' class='commentWrite reply'>";
  		reply += content;
  		reply += "</textarea><br>";
  		reply += "<button type='button' class='reply' onclick='modifyReply(";
  		reply += ridx;
  		reply += ")'><small>등록</small></button>";
  		reply += "<button type='button' class='reply' onclick='cancelReply()'><small>취소</small></button>";
  	
  		$(".buttons"+ridx).remove();
  		$(".reply").remove();
  		$("#reply_content"+ridx).html(reply);
  	}

  	//댓글 수정 폼에서 등록 클릭
  	function modifyReply(ridx){
  		
  		var content = $("[name=replyContent]").val();
  		
  		$.ajax({
  			url:"../reply/modify.do",
  			data:{"ridx":ridx,
  				  "content":content},
  			success:function(result){
  				if(result==1){
  					location.reload();
  				}
  			}
  		})
  	}

  	//댓글 수정 폼에서 취소 클릭
  	function cancelReply(){
  		
  		location.reload();
  	}

  	//댓글 삭제
  	function deleteBtn(ridx){
  		
  		var deleteReply = confirm("정말 삭제하시겠습니까?");
  		if(!deleteReply) return false;
  		
  		$.ajax({
  			url:"<%=request.getContextPath()%>/reply/delete.do",
  			data:{"ridx":ridx},
  			success:function(data){
  				if(data==1){
  					location.reload();	
  				}
  			}
  		})
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
      <div id="board">
        <div id="boardTitle">
          <div class="boardInfo">
          	<input type="hidden" id="bidx" name="bidx" value="${list.bidx}">
            <span>${list.category}</span>
            <h1>${list.title}</h1>
            <h2>${list.wdate.substring(0,16)}</h2>
            <p>조회수 ${list.hit}회</p>
          </div>
          <!--end: .boardInfo-->
          <div class="profile">
            <div class="profileImg">
              <img src="<%=request.getContextPath()%>/resources/upload/${list.stname}" width="60" />
            </div>
            <p>${list.writer}</p>
          </div>
          <!--end: .profile-->
        </div>
        <!--end: #boardTitle-->
        <div id="boardContent">
          <p>
          ${list.content}
          </p>
        </div>
        <!--end: #boardContent-->
        <div class="like">
          <a href="#" class="like-button" onclick="like()">
            <?xml version="1.0" encoding="utf-8"?>
            <svg width="30" height="30" viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg"><path d="M320 1344q0-26-19-45t-45-19q-27 0-45.5 19t-18.5 45q0 27 18.5 45.5t45.5 18.5q26 0 45-18.5t19-45.5zm160-512v640q0 26-19 45t-45 19h-288q-26 0-45-19t-19-45v-640q0-26 19-45t45-19h288q26 0 45 19t19 45zm1184 0q0 86-55 149 15 44 15 76 3 76-43 137 17 56 0 117-15 57-54 94 9 112-49 181-64 76-197 78h-129q-66 0-144-15.5t-121.5-29-120.5-39.5q-123-43-158-44-26-1-45-19.5t-19-44.5v-641q0-25 18-43.5t43-20.5q24-2 76-59t101-121q68-87 101-120 18-18 31-48t17.5-48.5 13.5-60.5q7-39 12.5-61t19.5-52 34-50q19-19 45-19 46 0 82.5 10.5t60 26 40 40.5 24 45 12 50 5 45 .5 39q0 38-9.5 76t-19 60-27.5 56q-3 6-10 18t-11 22-8 24h277q78 0 135 57t57 135z"/></svg>
            </a>
            <div class="likeCount">
              <span id="counter">추천&nbsp;&nbsp;&nbsp;${list.likeCnt}</span>
            </div>
          <!--end: #like-cnt-->
          </div>
        <!--end: .like-->
      <div class="Btn">    
		  	<button type="button" class="listBtn">목록</button>
          <c:if test="${login.midx == list.midx}">
			<button type="button" class="deleteBtn">삭제</button>
			<button type="button" class="modifyBtn">수정</button>	
		  </c:if>
      </div>
      <!-- end: .Btn -->
      </div>
      <!--end: #board-->
      <div id="commentPage">
        <h3 class="commentCount">댓글&nbsp;&nbsp;&nbsp;<span>${replyPageMaker.replyTotalCount}</span></h3>
        <div class="commentWrite">
          <textarea name="content" placeholder="댓글을 입력해주세요."></textarea>
          <button>등록</button>
        </div>
        <!--end: .commentWrite-->
       </div>
      <!--end: #commentPage-->
        <div class="commentList">
          <ul>
          	<c:forEach items="${replyList}" var="reply">
          	<input type="hidden" id="ridx" name="ridx" value="${reply.ridx}">						
            <li>
          <div class="comment">
          	
            <div class="member"><img src="<%=request.getContextPath()%>/resources/upload/${reply.stname}" width="42.5" />
            <p class="nickname">${reply.writer}</p>
            </div>
            <!--end: .member-->
            <div class="content"> 
              	${reply.content}
				<p id="reply_content${reply.ridx}" class="reply_content"></p>      
                <div class="commentOption">
                  <p>${reply.wdate}</p>
                  
                <c:if test="${login.nickname == reply.writer}">
				<button class="commentReply" onclick="modifyBtn(${reply.ridx},'${reply.content}')" class="buttons${reply.ridx}"><small>수정</small></button>
				<button class="commentReply" onclick="deleteBtn(${reply.ridx})" class="buttons${reply.ridx}"><small>삭제</small></button>
				</c:if>

				 <button type="button" class="commentReply" onclick="replyLike(${reply.ridx},'${reply.writer}','${login.nickname}');"><small>추천</small></button> <small>${reply.likeCnt}</small>
               

                

              </div>
              <!--end: .commentOption-->
            </div>
              <!--end: content-->
          </div>
          <!--end: .comment-->
        	</li>
        	</c:forEach>
       			 </ul>
    		</div>
        <!--end: .commentList-->
      <div id="listOption">
        <div class="pager">
			<ul class="pagination">
			<!-- 이전 페이지 -->	
			<c:if test="${replyPageMaker.prev}">
				<a href="<%=request.getContextPath() %>/board/view.do?replyPage=${replyPageMaker.replyStartPage-1}&bidx=${searchVo.bidx}&page=${searchVo.page}&category=${searchVo.category}&order=${searchVo.order}&replyPerPageNum=${searchVo.replyPerPageNum}&searchType=${searchVo.searchType}&searchVal=${searchVo.searchVal}">◀</a>
			</c:if>
			<!-- 현재 페이지 -->	
			<c:forEach begin="${replyPageMaker.replyStartPage}" end="${replyPageMaker.replyEndPage}" var="num">
				<c:choose>
					<c:when test="${replyPageMaker.replyEndPage == 0}">
						<p></p>
					</c:when>
					<c:when test="${num == searchVo.replyPage}">
						<b>${num}</b>
					</c:when>
					<c:when test="${num != searchVo.replyPage}">
						<a href="<%=request.getContextPath() %>/board/view.do?replyPage=${num}&bidx=${searchVo.bidx}&page=${searchVo.page}&category=${searchVo.category}&order=${searchVo.order}&replyPerPageNum=${searchVo.replyPerPageNum}&searchType=${searchVo.searchType}&searchVal=${searchVo.searchVal}">${num}</a>
					</c:when>
				</c:choose>
			</c:forEach>
			<!-- 다음 페이지 -->	
			<c:if test="${replyPageMaker.next}">
				<a href="<%=request.getContextPath() %>/board/view.do?replyPage=${replyPageMaker.replyEndPage+1}&bidx=${searchVo.bidx}&page=${searchVo.page}&category=${searchVo.category}&order=${searchVo.order}&replyPerPageNum=${searchVo.replyPerPageNum}&searchType=${searchVo.searchType}&searchVal=${searchVo.searchVal}">▶</a>
			</c:if>
			</ul>
		</div>
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
