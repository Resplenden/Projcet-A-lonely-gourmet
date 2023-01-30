<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>혼밥의 고수 글쓰기</title>
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

    <!-- include libraries(jQuery, bootstrap) -->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

    <!-- include summernote css/js-->
    <link
      href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css"
      rel="stylesheet"
    />
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
    <script>
      $(document).ready(function () {
        $("#summernote").summernote({
          width: 1500,
          height: 600, // set editor height
          minHeight: 600, // set minimum height of editor
          maxHeight: 600, // set maximum height of editor
          focus: true, // set focus to editable area after initializing summernote
          lang: "ko-KR", // default: 'en-US'
          fontNames: [
            "Nanum Gothic",
            "sans-serif",
            "돋움",
            "Dotum",
            "Arial",
            "Arial Black",
            "Comic Sans MS",
            "Courier New",
            "Helvetica",
            "Impact",
            "Tahoma",
            "Times New Roman",
            "Verdana",
            "Roboto",
          ],
          defaultFontName: "Nanum Gothic",
          fontSizes: ["8", "9", "10", "11", "12", "14", "18"],
          toolbar: [
            ["style", ["style"]],
            ["font", ["bold", "italic", "underline", "clear"]],
            ["fontname", ["fontname"]],
            ["color", ["color"]],
            ["fontsize", ["fontsize"]],
            ["para", ["ul", "ol", "paragraph"]],
            ["height", ["height"]],
            ["table", ["table"]],
            ["insert", ["link", "picture", "hr"]],
            ["view", ["fullscreen", "codeview"]],
            ["help", ["help"]],
          ],
        });

        $(".title").keyup(function (e) {
          var content = $(this).val();
          $("#counter").html("(" + content.length + " / 40)"); //글자수 실시간 카운팅

          if (content.length > 40) {
            $(".errorMsg").html("제목은 최대 40자까지 입력 가능합니다.");
            $(".errorMsg").css("float", "right");
            $(".errorMsg").css("color", "red");
            $(".errorMsg").css("font-size", "15px");
            $(".errorMsg").css("font-style", "italic");

            $(this).val(content.substring(0, 40));
            $("#counter").html("(40 / 40)");
          } else {
            $(".errorMsg").html("");
          }
        });
        
        $(".logo").click(function(){	
        	if(!confirm("메인으로 돌아가시겠습니까? 작성하신 내용은 저장되지 않습니다.")){
				return false;
        	}else{
        		location.href="<%=request.getContextPath()%>";
        	}
        	
         });
        
      });
    </script>
    <link href="${pageContext.request.contextPath}/resources/css/writeBootstrap.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/css/boardWrite.css" rel="stylesheet" />

    <!--css 연결-->
  </head>
  <body>
    <form action="boardWrite.do" method="post">
      <div id="topMenu">
        <div class="leftElement">
          <a href="#" class="logo">
            <img
              src="../resources/img/사본_-혼밥의고수_로고_초안_대지_1_사본-removebg-previewhite.png"
              width="220px"
            />
          </a>
          <h1>글쓰기 Editor</h1>
        </div>
        <!--end: .leftElement-->
        <div class="rightElement">
          <a href="#" class="cancel">취소</a>
          <button type="submit" class="write">등록</button>
        </div>
        <!--end: .rightElement-->
      </div>
      <!--end: #topMenu-->
      <main>
        <div id="title">
          <select class="category">
            <option value="">카테고리</option>
            <option value="free">자유</option>
            <option value="review">후기</option>
          </select>
          <input
            type="text"
            name="title"
            class="title"
            minlength="2"
            maxlength="40"
            placeholder="제목을 입력하세요"
          />
          <span style="color: #aaa; font-size: 15.5px" id="counter"
            >(0 / 40)</span
          >
          <br />
          <span class="errorMsg"></span>
        </div>
        <!--end: title-->
        <div id="summernote">
          -----------자유게시판 이용 공지------------
          <br />
          아래의 사항을 지키지 못한 게시글은 무통보 삭제될 수 있습니다.
          <br />
          <br />
          1. 타인을 향한 욕설 및 비방, 근거없는 비난글
          <br />
          2. 광고가 포함된 (ex: 아르바이트 알선, 판매 등) 스팸 게시글
          <br />
          3. 사기·도박 및 매매성 게시글
          <br />
          <br />
          이외의 게시판의 의도와 맞지 않은 게시글은 정리 될 수 있다는 점
          유의하시기 바랍니다.
        </div>
      </main>
      <!--end: main-->
    </form>
    <!--end: form-->
    <footer>
      <div id="slogan">
        <img
          src="../resources/img/사본_-혼밥의고수_로고_초안_대지_1_사본-removebg-preview.png"
          width="180px"
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