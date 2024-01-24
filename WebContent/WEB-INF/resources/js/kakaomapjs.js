
		// 마커를 담을 배열입니다
		var markers = [];

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center: new kakao.maps.LatLng(37.569422, 126.986022), // 지도의 중심좌표
				level: 5 // 지도의 확대 레벨
			};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places();

		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({zIndex: 1});

		// 원하는 항목 리스트 출력
		var places = [
			{
				place_name: "종로구 장소 1",
				road_address_name: "종로구 도로주소 1",
				address_name: "종로구 지번주소 1",
				phone: "010-1234-5678",
				description: "종로구 장소 1에 대한 설명",
				x: 126.981611,
				y: 37.571679
			},
			{
				place_name: "종로구 장소 2",
				road_address_name: "종로구 도로주소 2",
				address_name: "종로구 지번주소 2",
				phone: "010-2345-6789",
				description: "종로구 장소 2에 대한 설명",
				x: 126.981893,
				y: 37.571213
			},
			{
				place_name: "종로구 장소 3",
				road_address_name: "종로구 도로주소 3",
				address_name: "종로구 지번주소 3",
				phone: "010-3456-7890",
				description: "종로구 장소 3에 대한 설명",
				x: 126.983712,
				y: 37.570457
			},
			{
				place_name: "종로구 장소 4",
				road_address_name: "종로구 도로주소 4",
				address_name: "종로구 지번주소 4",
				phone: "010-4567-8901",
				description: "종로구 장소 4에 대한 설명",
				x: 126.983134,
				y: 37.570912
			},
			{
				place_name: "종로구 장소 5",
				road_address_name: "종로구 도로주소 5",
				address_name: "종로구 지번주소 5",
				phone: "010-5678-9012",
				description: "종로구 장소 5에 대한 설명",
				x: 126.981209,
				y: 37.572091
			},
			{
				place_name: "종로구 장소 6",
				road_address_name: "종로구 도로주소 6",
				address_name: "종로구 지번주소 6",
				phone: "010-6789-0123",
				description: "종로구 장소 6에 대한 설명",
				x: 126.980657,
				y: 37.572893
			},
			{
				place_name: "종로구 장소 7",
				road_address_name: "종로구 도로주소 7",
				address_name: "종로구 지번주소 7",
				phone: "010-7890-1234",
				description: "종로구 장소 7에 대한 설명",
				x: 126.983564,
				y: 37.569812
			},
			{
				place_name: "종로구 장소 8",
				road_address_name: "종로구 도로주소 8",
				address_name: "종로구 지번주소 8",
				phone: "010-8901-2345",
				description: "종로구 장소 8에 대한 설명",
				x: 126.984123,
				y: 37.570356
			},
			{
				place_name: "종로구 장소 9",
				road_address_name: "종로구 도로주소 9",
				address_name: "종로구 지번주소 9",
				phone: "010-9012-3456",
				description: "종로구 장소 9에 대한 설명",
				x: 126.982345,
				y: 37.571234
			},
			{
				place_name: "종로구 장소 10",
				road_address_name: "종로구 도로주소 10",
				address_name: "종로구 지번주소 10",
				phone: "010-0123-4567",
				description: "종로구 장소 10에 대한 설명",
				x: 126.980987,
				y: 37.571890
			},
			{
				place_name: "종로구 장소 11",
				road_address_name: "종로구 도로주소 11",
				address_name: "종로구 지번주소 11",
				phone: "010-2345-6789",
				description: "종로구 장소 11에 대한 설명",
				x: 126.982678,
				y: 37.571567
			},
			{
				place_name: "종로구 장소 12",
				road_address_name: "종로구 도로주소 12",
				address_name: "종로구 지번주소 12",
				phone: "010-3456-7890",
				description: "종로구 장소 12에 대한 설명",
				x: 126.984123,
				y: 37.570123
			},
			{
				place_name: "종로구 장소 13",
				road_address_name: "종로구 도로주소 13",
				address_name: "종로구 지번주소 13",
				phone: "010-4567-8901",
				description: "종로구 장소 13에 대한 설명",
				x: 126.982901,
				y: 37.571456
			},
			{
				place_name: "종로구 장소 14",
				road_address_name: "종로구 도로주소 14",
				address_name: "종로구 지번주소 14",
				phone: "010-5678-9012",
				description: "종로구 장소 14에 대한 설명",
				x: 126.983789,
				y: 37.570789
			},
			{
				place_name: "종로구 장소 15",
				road_address_name: "종로구 도로주소 15",
				address_name: "종로구 지번주소 15",
				phone: "010-6789-0123",
				description: "종로구 장소 15에 대한 설명",
				x: 126.980234,
				y: 37.572345
			},
			{
				place_name: "종로구 장소 16",
				road_address_name: "종로구 도로주소 16",
				address_name: "종로구 지번주소 16",
				phone: "010-5678-1234",
				description: "종로구 장소 16에 대한 설명",
				x: 126.983789,
				y: 37.570789
			},
			{
				place_name: "종로구 장소 17",
				road_address_name: "종로구 도로주소 17",
				address_name: "종로구 지번주소 17",
				phone: "010-5678-1234",
				description: "종로구 장소 17에 대한 설명",
				x: 126.982901,
				y: 37.571456
			},
			{
				place_name: "종로구 장소 18",
				road_address_name: "종로구 도로주소 18",
				address_name: "종로구 지번주소 18",
				phone: "010-5678-4321",
				description: "종로구 장소 18에 대한 설명",
				x: 126.984123,
				y: 37.570123
			},
			{
				place_name: "종로구 장소 19",
				road_address_name: "종로구 도로주소 19",
				address_name: "종로구 지번주소 19",
				phone: "010-7890-1234",
				description: "종로구 장소 19에 대한 설명",
				x: 126.983564,
				y: 37.569812
			},
			{
				place_name: "종로구 장소 20",
				road_address_name: "종로구 도로주소 20",
				address_name: "종로구 지번주소 20",
				phone: "010-6789-0123",
				description: "종로구 장소 20에 대한 설명",
				x: 126.980657,
				y: 37.572893
			}
		];



		// 페이지당 항목 수 설정
		var itemsPerPage = 15;

		// 현재 페이지 번호 초기값 설정
		var currentPage = 1;

		// 검색 결과 목록과 마커를 표출합니다
		displayPlaces(places);

		// 전체 페이지 수 계산
		var totalPages = Math.ceil(places.length / itemsPerPage);

		// 페이지 로드 시 지도를 초기화하는 함수
		function initializeMap() {
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div
				mapOption = {
					center: new kakao.maps.LatLng(37.569422, 126.986022), // 지도의 중심좌표
					level: 5 // 지도의 확대 레벨
				};
			var map = new kakao.maps.Map(mapContainer, mapOption);



			// 1페이지에 해당하는 장소를 표시합니다.
			displayPlaces(places);

			// 페이지네이션을 업데이트합니다.
			updatePagination();
		}

		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {
			var listEl = document.getElementById('placesList'),
				menuEl = document.getElementById('menu_wrap'),
				fragment = document.createDocumentFragment(),
				bounds = new kakao.maps.LatLngBounds(),
				listStr = '';

			// 검색 결과 목록에 추가된 항목들을 제거합니다
			removeAllChildNods(listEl);

			// 이전 페이지의 마커를 제거합니다
			removeMarker();

			// 현재 페이지에 해당하는 항목의 시작 인덱스와 끝 인덱스 계산
			var startIdx = (currentPage - 1) * itemsPerPage;
			var endIdx = Math.min(startIdx + itemsPerPage, places.length);

			for (var i = startIdx; i < endIdx; i++) {
				var place = places[i];

				// 마커를 생성하고 지도에 표시합니다
				var placePosition = new kakao.maps.LatLng(place.y, place.x),
					marker = addMarker(placePosition, i, place.place_name), // 수정된 부분: 인덱스와 장소명을 전달
					itemEl = getListItem(i, place); // 검색 결과 항목 Element를 생성합니다

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기 위해
				// LatLngBounds 객체에 좌표를 추가합니다
				bounds.extend(placePosition);

				// 마커와 검색결과 항목에 mouseover 했을 때
				// 해당 장소에 인포윈도우에 장소명을 표시합니다
				// mouseout 했을 때는 인포윈도우를 닫습니다
				(function (marker, place_name) {
					kakao.maps.event.addListener(marker, 'mouseover', function () {
						displayInfowindow(marker, place_name);
					});

					kakao.maps.event.addListener(marker, 'mouseout', function () {
						infowindow.close();
					});

					itemEl.onmouseover = function () {
						displayInfowindow(marker, place_name);
					};

					itemEl.onmouseout = function () {
						infowindow.close();
					};
				})(marker, place.place_name);

				fragment.appendChild(itemEl);
			}

			// 검색결과 항목들을 검색결과 목록 Element에 추가합니다
			listEl.appendChild(fragment);
			menuEl.scrollTop = 0;

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			map.setBounds(bounds);

			// 페이지네이션 업데이트
			updatePagination();
		}



		function getListItem(index, place) {
			var el = document.createElement('li'),
				itemStr = '<div class="markerbg marker_' + (index + 1) + '"></div>' +
					'<div class="info">' +
					'   <h5>' + place.place_name + '</h5>';

			if (place.road_address_name) {
				itemStr += '    <span>' + place.road_address_name + '</span>' +
					'    <span class="jibun gray">' + place.address_name + '</span>';
			} else {
				itemStr += '    <span>' + place.address_name + '</span>';
			}

			itemStr += '  <span class="tel">' + place.phone + '</span>' +
				'</div>';

			el.innerHTML = itemStr;
			el.className = 'item';

			el.onclick = function () {
				displayPlaceDetails(places[index]);
			};

			return el;
		}

		// 지도 리스트 클릭시 밑부분 나옴
		function displayPlaceDetails(place) {
			var detailsDiv = document.getElementById('placeDetails');

			detailsDiv.style.display = 'block';

			/*detailsDiv.style.display = 'block';
			detailsDiv.innerHTML = '<h4>' + place.place_name + '</h4>';
			detailsDiv.innerHTML += '<p>' + (place.road_address_name || place.address_name) + '</p>';
			detailsDiv.innerHTML += '<p>' + place.phone + '</p>';*/
		}


		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
			var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
				imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
				imgOptions = {
					spriteSize: new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
					spriteOrigin: new kakao.maps.Point(0, (idx % itemsPerPage * 46) + 10), // 수정된 부분: 목록의 인덱스를 이용하여 배경 이미지 위치 설정
					offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
				},
				markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
				marker = new kakao.maps.Marker({
					position: position, // 마커의 위치
					image: markerImage,
					title: title // 마커의 제목(이름)을 저장합니다
				});

			marker.setMap(map); // 지도 위에 마커를 표출합니다
			markers.push(marker);  // 배열에 생성된 마커를 추가합니다

			return marker;
		}



		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
			markers = [];
		}

		function updatePagination() {
			var paginationEl = document.getElementById('pagination');
			removeAllChildNods(paginationEl);

			// 이전 페이지 버튼
			var prevPage = document.createElement('a');
			prevPage.href = "#";
			prevPage.innerHTML = '이전';
			prevPage.onclick = function () {
				if (currentPage > 1) {
					currentPage--;
					displayPlaces(places);
				}
			};

			// 다음 페이지 버튼
			var nextPage = document.createElement('a');
			nextPage.href = "#";
			nextPage.innerHTML = '다음';
			nextPage.onclick = function () {
				if (currentPage < totalPages) {
					currentPage++;
					displayPlaces(places);
				}
			};

			paginationEl.appendChild(prevPage);

			// 페이지 번호 버튼들
			for (var i = 1; i <= totalPages; i++) {
				var pageButton = document.createElement('a');
				pageButton.href = "#";
				pageButton.innerHTML = i;
				if (i === currentPage) {
					pageButton.className = 'on';
				} else {
					pageButton.onclick = (function (page) {
						return function () {
							currentPage = page;
							displayPlaces(places);
						};
					})(i);
				}
				paginationEl.appendChild(pageButton);
			}

			paginationEl.appendChild(nextPage);
		}

		// 초기 페이지네이션 업데이트 호출
		updatePagination();

		// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
		// 인포윈도우에 장소명을 표시합니다
		function displayInfowindow(marker, place_name) {
			var content = '<div style="padding:5px;z-index:1;">' +
				'<h5>' + place_name + '</h5>' +
				'</div>';

			infowindow.setContent(content);
			infowindow.open(map, marker);
		}



		// 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {
			while (el.hasChildNodes()) {
				el.removeChild(el.lastChild);
			}
		}


