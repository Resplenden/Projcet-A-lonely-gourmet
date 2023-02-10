<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>

<html>
<head>
<link href="../resources/img/_꾸미기_혼밥의고수_파비콘-removebg-preview.png"
	rel="shortcut icon" />
<!--파비콘-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css" />
<!--검색 버튼 아이콘-->
<link href="<%=request.getContextPath()%>/resources/css/map.css"
	rel="stylesheet">
<!--css 연결 -->
<title>혼밥의 고수 맛집지도</title>
</head>
<body>
	<nav>
		<div id="topMenu">
			<div class="logo">
				<a href="<%=request.getContextPath()%>"> <img
					src="../resources/img/사본 -혼밥의고수 로고 초안_대지 1 사본.png" width="160px" />
				</a>
				<h1>맛집지도</h1>
			</div>
			<!--end:.logo -->
			<div class="loginInfo">
				<a href="<%=request.getContextPath()%>/member/memberLogin.do"
					class="login"><p>로그인</p></a> <a
					href="<%=request.getContextPath()%>/member/memberJoin.do"
					class="join"><p>회원가입</p></a>
			</div>
			<!--end:.loginInfo-->
		</div>
		<!--end: #topMenu-->
	</nav>
	<!--end: nav-->
	<div class="map_wrap">
		<div id="map"
			style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
		<div id="menu_wrap" class="bg_white">
			<div class="option"> 
				<div>
					<form onsubmit="searchPlaces(); return false;">
						<input type="text" value="전주 맛집" id="keyword">
						<button type="submit">
							<i class="xi-search xi-5x"></i>
						</button>
					</form>
				</div>
			</div>
			<ul id="placesList"></ul>
			<div id="pagination"></div>
		</div>
	</div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=637da4ce9c724b0a92d260712157c315&libraries=services"></script>
	<script>
		// 마커를 담을 배열입니다
		var markers = [];
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			level : 4
		// 지도의 확대 레벨
		};
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);
		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places();
		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
			zIndex : 1
		});
		// 키워드로 장소를 검색합니다
		searchPlaces();

		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces() {

			var keyword = document.getElementById('keyword').value;

			if (!keyword.replace(/^\s+|\s+$/g, '')) {
				alert('키워드를 입력해 주세요.');
				return false;
			} 

			// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
			ps.keywordSearch(keyword, placesSearchCB);
		}

		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {

				// 정상적으로 검색이 완료됐으면
				// 검색 목록과 마커를 표출합니다
				displayPlaces(data);

				// 페이지 번호를 표출합니다
				displayPagination(pagination);

			} else if (status === kakao.maps.services.Status.ZERO_RESULT) {

				alert('검색 결과가 존재하지 않습니다.');
				return;

			} else if (status === kakao.maps.services.Status.ERROR) {

				alert('검색 결과 중 오류가 발생했습니다.');
				return;

			}
		}

		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {

			var listEl = document.getElementById('placesList'), menuEl = document
					.getElementById('menu_wrap'), fragment = document
					.createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';

			// 검색 결과 목록에 추가된 항목들을 제거합니다
			removeAllChildNods(listEl);

			// 지도에 표시되고 있는 마커를 제거합니다
			removeMarker();

			for (var i = 0; i < places.length; i++) {

				// 마커를 생성하고 지도에 표시합니다
				var placePosition = new kakao.maps.LatLng(places[i].y,
						places[i].x), marker = addMarker(placePosition, i), itemEl = getListItem(
						i, places[i]); // 검색 결과 항목 Element를 생성합니다

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				bounds.extend(placePosition);

				// 마커와 검색결과 항목에 mouseover 했을때
				// 해당 장소에 인포윈도우에 장소명을 표시합니다
				// mouseout 했을 때는 인포윈도우를 닫습니다
				(function(marker, title) {
					kakao.maps.event.addListener(marker, 'mouseover',
							function() {
								displayInfowindow(marker, title, places);
							});

					/* kakao.maps.event.addListener(marker, 'mouseout',
							function() {
								infowindow.close();
							}); */

					itemEl.onmouseover = function() {
						displayInfowindow(marker, title, places);
					};

					itemEl.onmouseout = function() {
						infowindow.close();
					};
				})(marker, places[i].place_name);

				fragment.appendChild(itemEl);
			}

			// 검색결과 항목들을 검색결과 목록 Element에 추가합니다
			listEl.appendChild(fragment);
			menuEl.scrollTop = 0;

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			map.setBounds(bounds);
		}

		// 검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {

			var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
					+ (index + 1)
					+ '"></span>'
					+ '<div class="info">'
					+ '   <h5>' + places.place_name + '</h5>';

			if (places.road_address_name) {
				itemStr += '    <span>' + places.road_address_name + '</span>'
						+ '   <span class="jibun gray">' + places.address_name
						+ '</span>';
			} else {
				itemStr += '    <span>' + places.address_name + '</span>';
			}

			itemStr += '  <span class="tel">' + places.phone + '</span>'
					+ '</div>';

			el.innerHTML = itemStr;
			el.className = 'item';

			return el;
		}
		
		// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
		// 인포윈도우에 장소명을 표시합니다
		function displayInfowindow(marker, title, places) {
			
			// 마커 위에 커스텀오버레이를 표시합니다
			// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
			var overlay = new kakao.maps.CustomOverlay({
			    content: content,
			    map: map,
			    position: marker.getPosition()      
			});
			
			
			for (var i = 0; i < places.length; i++) {
				if(title == places[i].place_name) {
	
				console.log(places[i]);
				
				// 마커를 클릭했을 때 커스	텀 오버레이를 표시합니다
				kakao.maps.event.addListener(marker, 'click', function() {
				    overlay.setMap(map);
				});
				
			
			
			var content = '<div id="content">'
			+'</br>'
			+ '<p class="title">' 
			+ title
			+ '</p>' 
			+'<p class="address">'
			+ places[i].address_name
			+'</p>'	
			+'<p class="tel">'
			+ places[i].phone
			+'</p>'
			+'</br>'
			+'<a href="<%=request.getContextPath()%>/food/foodView.do?" class="view">'
			+'자세히 보기'
			+'<i class="xi-angle-right xi-2x">'
			+'</i>'
			+'</a>'	
			+'</div>' 
			
			infowindow.setContent(content);
			infowindow.open(map, marker, places);
			
			
				}
				//end: if(title == places[i].place_name)
				
				

			var closeBtn = document.createElement('button');
			var con = document.getElementById("content");
			
				closeBtn.innerHTML = '<i class="xi-close xi-2x"><i>';
				closeBtn.style.backgroundColor="#dfdfdf";
				closeBtn.style.border= "none";
				closeBtn.style.float="right";
				closeBtn.style.width="17px";
				closeBtn.style.height="17px";
				closeBtn.style.borderRadius="50%";
				closeBtn.style.textAlign="center";
				closeBtn.style.marginBottom="10px";
				
				closeBtn.onclick = function() {
					con.style.display="none";
					infowindow.close();	
					overlay.setMap(null);
				}
				
				// end: closeBtn.onclick 
			
				
			}
			con.insertAdjacentElement('afterbegin',closeBtn);
			//end: for문
		}
		//end: function displayInfoWindow()

		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title, places) {
			var imageSrc = "<%=request.getContextPath()%>/resources/img/marker_number_salmon.png";
			imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
			imgOptions = {
				spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
				spriteOrigin : new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
				offset : new kakao.maps.Point(13, 37)
			// 마커 좌표에 일치시킬 이미지 내에서의 좌표
			}, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
					imgOptions), marker = new kakao.maps.Marker({
				position : position, // 마커의 위치
				image : markerImage
			});

			marker.setMap(map); // 지도 위에 마커를 표출합니다
			markers.push(marker); // 배열에 생성된 마커를 추가합니다

			return marker;
		}

		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
			markers = [];
		}

		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
			var paginationEl = document.getElementById('pagination'), fragment = document
					.createDocumentFragment(), i;

			// 기존에 추가된 페이지번호를 삭제합니다
			while (paginationEl.hasChildNodes()) {
				paginationEl.removeChild(paginationEl.lastChild);
			}

			for (i = 1; i <= pagination.last; i++) {
				var el = document.createElement('a');
				el.href = "#";
				el.innerHTML = i;

				if (i === pagination.current) {
					el.className = 'on';
				} else {
					el.onclick = (function(i) {
						return function() {
							pagination.gotoPage(i);
						}
					})(i);
				}

				fragment.appendChild(el);
			}
			paginationEl.appendChild(fragment);
		}

	
		
	
		

		// 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) { 	
			while (el.hasChildNodes()) {
				el.removeChild(el.lastChild);
			}
		}	
		
		
	</script>

</body>
</html>
