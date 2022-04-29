<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<script>
	    $(function(){
	        getLocation();
	    });
	    function addActive(id){
	        var btn = document.getElementById(id);
	        btn.classList.toggle("active");
	    }

        function resetKeyword(){
            if(document.querySelectorAll("table .active").length > 0){
                $(".searchBtn").removeClass("active");
                document.querySelector("#msgBox").innerHTML = "";
            }
        }
    </script>
<section>
	<div class="container-fluid h-100 mt-5">
		<div class="row mb-5">
			<div class="col-2"></div>
			<div class="col-8">
				<h4>개원 장소 키워드 추천</h4>
				<div class="row">
					<div class="col-6 mt-3">
							<div class="row d-flex justify-content-between flex-column" style="margin: 0 auto;">
								<table style="margin: 0 auto;">
									<tr>
										<td class="p-2">
											<div id="keyword1" class="btn btn-outline-dark w-100 m-1 searchBtn" onclick="addActive(this.id);">임플란트</div>
										</td>
										<td class="p-2">
											<div id="keyword2" class="btn btn-outline-dark w-100 m-1 searchBtn" onclick="addActive(this.id);">역세권</div>
										</td>
										<td class="p-2">
											<div id="keyword3" class="btn btn-outline-dark w-100 m-1 searchBtn" onclick="addActive(this.id);">소아치료전문</div>
										</td>
										<td class="p-2">
											<div id="keyword4" class="btn btn-outline-dark w-100 m-1 searchBtn" onclick="addActive(this.id);">노인치료전문</div>
										</td>
									</tr>
									<tr>
										<td class="p-2">
											<div id="keyword5" class="btn btn-outline-dark w-100 m-1 searchBtn" onclick="addActive(this.id);">교정전문</div>
										</td>
										<td class="p-2">
											<div id="keyword6" class="btn btn-outline-dark w-100 m-1 searchBtn" onclick="addActive(this.id);">턱관절교정</div>
										</td>
										<td class="p-2">
											<div id="keyword7" class="btn btn-outline-dark w-100 m-1 searchBtn" onclick="addActive(this.id);">사랑니발치</div>
										</td>
										<td class="p-2">
											<div id="keyword8" class="btn btn-outline-dark w-100 m-1 searchBtn" onclick="addActive(this.id);">편의시설</div>
										</td>
									</tr>
								</table>
							
								<div class="mr-5">
									<span class="text-dark pr-2 float-left ml-5">* 중복 선택이가능합니다.</span>
									<a href="#" class="float-right"><img src="/resources/images/resetBtn.png" width="40px" onclick="location.reload();" /> </a>
									<a href="javascript:keywordAjax();"class=" pr-4 float-right"><img src="/resources/images/searchBtn1.png" width="40px"/></a>
								</div>
							</div>
						<div class="row d-flex mt-5 ml-4">
							<img src="/resources/images/mascot.png" width="70px" height="70px" style="margin-top: auto;" />
							<div class="ml-3 mr-3" style="width: 450px; height: 300px; border-radius: 15px;">
								<img src="/resources/images/messageBox.png" width="480px" height="300px" class="float-right" style="z-index: -100000" />
								<ul class="mt-3" id="msgBox" style="position: absolute;">
								</ul>
							</div>
						</div>
					</div>
					<div class="col-6 d-flex flex-column">
						<div id="map" style="width: 100%; height: 490px; border-radius: 15px;" class="mt-4">
							<a title="현재위치" onclick="moveMapCurrentLoc(event)" class="border rounded p-1 m-1 shadow" style="z-index: 10; position: absolute; top: 0; left: 0; background-color: white; cursor: pointer;">
								<img src="${pageContext.request.contextPath}/resources/images/location.png" width="40px" />
							</a>
						</div>
						<script>
                               
                                var markers = new Array();
                                var infoWindows = new Array();
                                var marker;
                                var cmarker;
                                var result;
                                var positions = new Array();
                                var juso = new Array();
                                var infoWindow;
                                var keywords = ["임플란트", "역세권", "소아치료", "노인치료", "교정", "턱관절교정", "사랑니발치", "편의시설"];
                                var conhtml = '';
                                
                                function getLocation() {
                                    if (navigator.geolocation) {
                                        navigator.geolocation.getCurrentPosition(showPosition);
                                    } else { 
                                        x.innerHTML = "Geolocation is not supported by this browser.";
                                    }
                                }
                                
                                function showPosition(position){
                                	lat = position.coords.latitude;
                                	lng = position.coords.longitude;
                                	
                                	var curPos = new naver.maps.LatLng(lat, lng);
                                	var mapOptions = {
                                			center: curPos,
                                			scaleControl: false,
                                			mapDataControl: false,
                                			zoom: 10,
                                	};
                                	
                                	map = new naver.maps.Map('map', mapOptions);
                                	
                                	var markerOptions = {
                                			position: curPos.destinationPoint(90, 15),
                                			map: map,
                                			icon: {
                                				content: '<img src="<c:url value="/resources/images/ballMascot.png"/>" alt="marker" style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; max-width: none; max-height: none; -webkit-user-select: none; position: absolute; width: 60px; height: 65px; left: 0px; top: 0px;">',
                                				size: new naver.maps.Size(35, 30),
                                                origin: new naver.maps.Point(0, 0),
                                                anchor: new naver.maps.Point(16, 32),
                                			}
                                	};
                                	
                                	cmarker = new naver.maps.Marker(markerOptions);
                                	initMap();
                                }
                                
                                function initMap(){
                                	setTimeout(() => {
                                		
	                                	for(var i=0; i<positions.length; i++){
	                                	 	marker = new naver.maps.Marker({
	                                			map: map,
	                                			position: new naver.maps.LatLng(positions[i].lat, positions[i].lng),
	                                			icon: {
	                                				content: '<img src="<c:url value="/resources/images/hosMarker.png"/>" alt="marker" style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; max-width: none; max-height: none; -webkit-user-select: none; position: absolute; width: 32px; height: 32px; left: 0px; top: 0px;">',
	                                                size: new naver.maps.Size(20, 27),
	                                                origin: new naver.maps.Point(0, 0),
	                                                anchor: new naver.maps.Point(16, 32),
	                                			}
	                                	 	});
	                                	 	infoWindow = new naver.maps.InfoWindow({
	                                            content: '<form method="get" action="/take/list"><div class="p-2 gotoTake" style="width:300px;"><span>' + positions[i].location + '</span><br><div class="text-center w-100"><input type="hidden" value="' + positions[i].lat + '" name="latitude"/><input type="hidden" value="' + positions[i].lng+'" name="longitude"/><div></div><input type="submit" class="btn btn-sm btn-outline-dark w-100 mt-2" value="주변매물 보러가기 ->" /></div></div></form>',
	                                        });
	                                	 	markers.push(marker);
	                                	 	
	                                        infoWindows.push(infoWindow);
	                                	}
	                                	
	                                	for (var i = 0, ii = markers.length; i < ii; i++) {
	                                        naver.maps.Event.addListener(markers[i], "click", getClickHandler(i)); // 클릭한 마커 핸들러
	                                    }

                                	}, 1000);
                               }

                                //지도위의 현재위치 버튼을 클릭하면 실행되는 함수로, 현재위치가 찍힌 마커로 지도가 이동한다.
                                function moveMapCurrentLoc(e){
                                    e.preventDefault();
                                    var curPosition = cmarker.position;
                                    var currentLoc = new naver.maps.LatLng(curPosition.y, curPosition.x);
                                    map.panTo(currentLoc);
                                }

                                function getClickHandler(seq){
                                	return function(e){
                                		var marker = markers[seq],
                                			infoWindow = infoWindows[seq];
                                		if(infoWindow.getMap()){
                                			infoWindow.close();
                                		}else {
                                            infoWindow.open(map, marker); // 표출
                                        }
                                	}
                                }
                                
                                function keywordAjax(){
                                	var elements = document.querySelectorAll("td > .active");
                                	var keywordlst = new Array();
                                    var keyword = new Object();
                                    var jsonObject;
                                    document.querySelector("#msgBox").innerHTML = "";
                                    
                                    for(var i=0; i<elements.length; i++){
                                    	keyword["value"+i] = elements[i].id;
                                    	jsonObject = JSON.stringify(keyword);
                                    	document.querySelector("#msgBox").innerHTML += "<li class='ml-5'>" + elements[i].innerHTML +"</li>";
                                    } 
                                	callAjax(jsonObject);
                                }
                                
								function callAjax(json){
									$.ajax({
										type: "GET",
                                		url: "/opening/keyword",
                                		traditional: true,
                                		data: JSON.parse(json),
                                	}).done((data) => {
                                		positions = [];
                                		
                                		for(var i=0; i<markers.length; i++){
                                			markers[i].setMap(null);
                                		}

                                		for(var i=0; i<data.keywordsLength; i++){
	                                		naver.maps.Service.reverseGeocode({
	                                            location: new naver.maps.LatLng(data.keywords[i].latitude, data.keywords[i].longitude),
	                                        }, function(status, response) {
	                                            if (status !== naver.maps.Service.Status.OK) {
	                                                return alert('Something wrong!');
	                                            }
	                                            result = response.result; // 검색 결과의 컨테이너
	                                            items = result.items.address; // 검색 결과의 배열
	                                            addr = result.items[1].address;
	                                            juso.push(addr);
	                                        });
	                                	}
										console.log("juso : " + juso);
										setTimeout(() => {
											for(var i=0; i<data.keywordsLength; i++){
	                                			positions.push(
	                                				{
	                                					location: juso[i],
	                                					lat: data.keywords[i].latitude, 
	                                					lng: data.keywords[i].longitude,
	                                					keyword1: data.keywords[i].keyword1,
	                                					keyword2: data.keywords[i].keyword2,
	                                					keyword3: data.keywords[i].keyword3,
	                                					keyword4: data.keywords[i].keyword4,
	                                					keyword5: data.keywords[i].keyword5,
	                                					keyword6: data.keywords[i].keyword6,
	                                					keyword7: data.keywords[i].keyword7,
	                                					keyword8: data.keywords[i].keyword8,
	                                				},
	                                			);
	                                			console.log(positions[i]);
														
	                                		}	
										}, 1000);
                            			
                                		initMap();
                                	}).fail((data) => {
                                		console.log(data);
                                	});
								}
                            </script>
					</div>
				</div>
			</div>
			<div class="col-2"></div>
		</div>
	</div>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>