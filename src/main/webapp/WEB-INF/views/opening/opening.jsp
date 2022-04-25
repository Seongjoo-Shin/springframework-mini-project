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

        function searchKeyword(){
            var elements = document.querySelectorAll("td > .active");
            document.querySelector("#msgBox").innerHTML = "";
            for(let element of elements){ 
                document.querySelector("#msgBox").innerHTML += "<li class='ml-5'>" + element.innerHTML +"</li>";
            }
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
						<div class="row d-flex justify-content-between flex-column"
							style="margin: 0 auto;">
							<table style="margin: 0 auto;">
								<tr>
									<td class="p-2"><div id="btn1" class="btn btn-outline-dark w-100 m-1 searchBtn" onclick="addActive(this.id);">임플란트</div></td>
									<td class="p-2"><div id="btn2" class="btn btn-outline-dark w-100 m-1 searchBtn" onclick="addActive(this.id);">역세권</div></td>
									<td class="p-2"><div id="btn3" class="btn btn-outline-dark w-100 m-1 searchBtn" onclick="addActive(this.id);">소아치료전문</div></td>
									<td class="p-2"><div id="btn4" class="btn btn-outline-dark w-100 m-1 searchBtn" onclick="addActive(this.id);">노인치료전문</div></td>
								</tr>
								<tr>
									<td class="p-2"><div id="btn5" class="btn btn-outline-dark w-100 m-1 searchBtn" onclick="addActive(this.id);">교정전문</div></td>
									<td class="p-2"><div id="btn6" class="btn btn-outline-dark w-100 m-1 searchBtn" onclick="addActive(this.id);">턱관절교정</div></td>
									<td class="p-2"><div id="btn7" class="btn btn-outline-dark w-100 m-1 searchBtn" onclick="addActive(this.id);">사랑니발치</div></td>
									<td class="p-2"><div id="btn8" class="btn btn-outline-dark w-100 m-1 searchBtn" onclick="addActive(this.id);">편의시설</div></td>
								</tr>
							</table>

							<div class="mr-5">
								<span class="text-dark pr-2 float-left ml-5">* 중복 선택이가능합니다.</span>
								<a href="#" class="float-right"><img src="/resources/images/resetBtn.png" width="40px" onclick="resetKeyword();" /> </a>
								<a href="#"class=" pr-4 float-right"><img src="/resources/images/searchBtn1.png" width="40px" onclick="searchKeyword();" /></a>
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
                               
                                let markers = new Array();
                                let infoWindows = new Array();
                                var marker;
                                var cmarker;
								
                                
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
                                			zoom: 11,
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
                                	 var positions = new Array();
                                	 positions.push(
                                         {location : '강남', lat : '37.4959854', lng : '127.0664091'},
                                         {location : '강동', lat : '37.5492077', lng : '127.1464824'},
                                         {location : '강북', lat : '37.6469954', lng : '127.0147158'},
                                         {location : '강서', lat : '37.5657617', lng : '126.8226561'},
                                         {location : '송파', lat : '37.5177941', lng : '127.1127078'},
                                     );
                                	 
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
                                		 var infoWindow = new naver.maps.InfoWindow({
                                             content: '<div class="p-2 gotoTake" style="width:200px;"><span>' + positions[i].location + '</span><br><div class="text-center w-100"><a class="btn btn-sm btn-outline-dark w-100 mt-2" href="/take/list?">주변매물 보러가기 -></a></div></div>',
                                         });
                                		 
                                		 markers.push(marker);
                                         infoWindows.push(infoWindow);
                                	 }
                                	 for (var i = 0, ii = markers.length; i < ii; i++) {
                                         naver.maps.Event.addListener(markers[i], "click", getClickHandler(i)); // 클릭한 마커 핸들러
                                     }
                                }
                                
                                function moveMapCurrentLoc(e){
                                    e.preventDefault();
                                    var curPosition = cmarker.position;
                                    var currentLoc = new naver.maps.LatLng(curPosition.y, curPosition.x);
                                    map.panTo(currentLoc);
                                }
                                
                                function moveMap(seq){
                               		var marker = markers[seq],
                               			infoWindow = infoWindows[seq];
                               		if(infoWindow.getMap()){
                               			infoWindow.close();
                               		}else {
                                        infoWindow.open(map, marker); // 표출
                                    }
                                }
                                
                                //지도위의 현재위치 버튼을 클릭하면 실행되는 함수로, 현재위치가 찍힌 마커로 지도가 이동한다.
                                function moveMapCurrentLoc(e){
                                    e.preventDefault();
                                    var curPosition = cmarker.position;
                                    var currentLoc = new naver.maps.LatLng(curPosition.y, curPosition.x);
                                    map.panTo(currentLoc);
                                }

                                function getClickHandler(seq){
                                	console.log(seq);
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

                                function searchMap(){
                                	var addr = $("#searchInput").val();
                                	naver.maps.Service.geocode({address: addr}, function(status, response) {

                                        if (status !== naver.maps.Service.Status.OK) {
                                            return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
                                        }
                                     
                                        var result = response.result;
                                        var myaddr = new naver.maps.Point(result.items[0].point.x, result.items[0].point.y);
                                        
                                        console.log("myaddr : "+myaddr);
                                        carker.setPosition(myaddr);
                                        
                                        var location = new naver.maps.LatLng(myaddr);
                                        map.panTo(location);
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