<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.1.min.js"></script>
<script>
	function callStr(){
		$.ajax({
			url:"callString.do",
			success:function(data){
				$("div").html(data);
			}
			
		});
	}
	
	function callClick(){
		var test1 = $("#test1").val();
		var test2 = $("#test2").val();
		
		$.ajax({
			url:"callClick.do",
			data:"test1="+test1+"&test2="+test2,
			success:function(data){
				$("div").html(data);
			}
		});
	}
	
	function selectBidx(){
		var bidx = $("#bidx").val();
		
		$.ajax({
			url:"findBidx.do",
			data:"bidx="+bidx,
			success:function(data){
				console.log(data);
			}
		});
	}
	
	function searchClick(){
		var param = $("#searchFrm").serialize();
		console.log(param);
		
		$.ajax({
			url:"searchClick.do",
			data:param,
			success:function(data){
				console.log(data);
				var html = "";
				html += "<table border=1>";
				html += "<tr>";
				html += "<th>글번호</th><th>제목</th><th>작성일</th>";
				html += "</tr>";
				
				for(var i=0; i<data.length; i++){
					html += "<tr>";
					html += "<td>"+data[i].bidx+"</td>";
					html += "<td>"+data[i].title+"</td>";
					html += "<td>"+data[i].wdate+"</td>";
					html += "</tr>";
				}
				
				html += "</table>";
				
				$("div").html(html);
			}
		})
		
		
		
	}
</script>
</head>
<body>
	<h2>ajax 예제 메인페이지</h2>
	
	<button onclick="callStr()">string</button>
	<hr>
		test1 : <input type="text" id="test1">
		/
		test2 : <input type="text" id="test2">
		<button onclick="callClick()">click!!</button>	
			
		<!-- 위 버튼 클릭시 두 텍스트를 하나의 문자열로 만들어 출력하는 ajax 기능을 구현하세요 -->
		<!-- ex) text : data1 / test2 : data2인경우 출력 값 data1_data_ajax!! -->
	<hr>
		<input type="number" id = "bidx">
		<button onclick="selectBidx()">조회</button>	
	<hr>
		<form id="searchFrm">
		<select name="searchType">
			<option value="title">제목</option>
			<option value="content">내용</option>		
		</select>
		<input type="text" name="searchVal" >	
		</form>
		<button onclick="searchClick()">검색</button>
	<hr>
	
	<div></div>
</body>
</html>











