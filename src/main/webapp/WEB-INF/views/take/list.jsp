<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script>
        $(function(){
            getLocation();
        });

        var price;

        function priceBtn(){
            if($("#dropDownMenu").css("display") === "none"){
                $("#dropDownMenu").show();
                $("#priceDiv").css("border", "1px solid rgb(242, 101, 45)");
                $("#priceBtn").css("color","rgb(242, 101, 45)");
            }else{
                $("#dropDownMenu").hide();
                $("#priceDiv").css("border", "1px solid rgb(192, 191, 191)");
                $("#priceBtn").css("color","black");
            }
            
        }

        function setValue(range){
            price = range.value;
            if(range.value >= 1000){
                $("#priceRange").attr("step", "500");
                $("#priceText").text(range.value + "만");
            }
            if(range.value >= 10000){
                val = `${range.value}`;
                val = val.replace("0", "");
                val = val.replace("0", "");
                val = val.replace("0", "");

                val2 = val.slice(-1);
                console.log("val2 : "+val2);
                if(val >= 100){
                    val = val.slice(0, 2);
                }else{
                    val = val.slice(0, 1);
                }
                console.log("val : "+val);
                $("#priceRange").attr("step", "1000");
                $("#priceText").text(val + "억" + val2 + "000 만");
                // $("#priceText").text(range.value);
            }else{
                $("#priceText").text(range.value + "만");
            }
        }
        
</script>

    <section class="m-5">
    	<div class="container-fluid">
    		<div class="row">
	            <div class="col-1"></div>
	            <div class="col-10">
	                <div class="container-fluid">
	                    <div class="row">
	                        <div class="col-6">
	                            <div class="container-fluid">
	                                <div class="mb-3 mt-3"><h3>인수 MAP</h3></div>
	                                <div class="row">
	                                    <div class="col-7 p-0">
	                                        <div class="p-1" style="border: 1px solid rgb(192, 191, 191);">
	                                            <input id="searchInput" type="text" class="p-2" style="font-size: 18px; border-color: transparent;" placeholder="주소를 입력해주세요."/>
	                                            <div class="float-right">
	                                                <input id="leaseBtn" type="button" class="p-2 mr-1 rounded" style="margin-top:1px; border-color: transparent; background-color: rgb(242, 101, 45); color: white;" value="임대" onclick="leaseBtnClick()"/>
	                                                <input id="tradeBtn" type="button" class="p-2 mr-1 rounded" style="border-color: transparent;" value="매매" onclick="tradeBtnClick()"/>
	                                            </div>
	                                            
	                                        </div>
	                                    </div>
	                                    <div class="col-2 p-0 pl-2">
	                                        <div id="priceDiv" style="border: 1px solid rgb(192, 191, 191);">
	                                            <button id="priceBtn" type="button" onclick="priceBtn()" class="bg-white w-100" style="border-color: transparent; background-color: transparent; font-size: 18px; padding: 10px;">
	                                                <span id="priceBtnText">월세</span>
	                                                <img class="ml-3" src="${pageContext.request.contextPath}/resources/images/arrowBtn1.png" width="30px" />
	                                            </button>
	                                        </div>
	                                        <div id="dropDownMenu" class="border bg-white mt-1 p-3 text-center" style="position:absolute; display: none; z-index: 2;">
	                                            <div class="p-2" style="font-size: 20px;">
	                                                <span>가격 : 0 &nbsp;~ &nbsp;</span>
	                                                <span id="priceText"></span>
	                                                <span> 원</span>
	                                            </div>
	                                            <div>
	                                                <input type="range" id="priceRange" value ="0" min="0" max="100000" oninput="setValue(this)" step="100" style="width: 300px;"/>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <div class="col-1 p-0 pl-2 m-0">
	                                        <div style="cursor: pointer;" onclick="searchMap()"><img src="${pageContext.request.contextPath}/resources/images/searchBtn.png" width="58px"/></div>
	                                    </div>
	                                    <div class="col-1 p-0 pl-1 m-0 ml-2">
	                                        <div style="cursor: pointer;" onclick="resetMap()"><img src="${pageContext.request.contextPath}/resources/images/resetBtn.png" width="58px"/></div>
	                                    </div>
	                                </div>
	                            </div>
	                            <div id="map" class="mr-4 mt-3" style="width:100%;height:490px; border: 1px solid rgb(192, 191, 191); padding: 50px;" onchange="getMarkers()">
	                            	<a title="현재위치" onclick="moveMapCurrentLoc(event)" class="border rounded p-1 m-1 shadow" style="z-index:10;position:absolute; top:0; left:0; background-color: white; cursor: pointer; ">
	                            		<img src="${pageContext.request.contextPath}/resources/images/location.png" width="40px" />
                            		</a>
	                            </div>
	                        </div>
	                        <div class="col-6" style="width:100%;height:600px;">
	                            <div class="d-flex flex-column" style="z-index: 1;">
	                                <div class="mb-2 mt-3 d-flex">
	                                    <div class="flex-grow-1">
	                                    	<h3>인수 매물 목록</h3>
	                               		</div>
	                                    <div class="p-1 flex-grow-1 ">
	                                    	<a href="enroll?type='newEnroll'" class="border rounded p-2 float-right" style="background-color: rgb(242, 101, 45); color: white; text-decoration:none; font-size: 18px">매물 등록</a>
	                                   	</div>
	                                </div>
	                                <div style="width:100%;height:555px; border: 1px solid rgb(192, 191, 191); padding: 15px; overflow:auto;">
	                                    <ul id="saleList" class="overflow-auto" style="list-style:none;">
	                                    	<c:forEach var="building" items="${buildings}">
	                                    		<li id="" name="building${building.buildingNo}" class="border rounded p-2 mb-1" style="cursor:pointer;" onclick="moveMap(this.id)">
		                                    		<div class="container-fluid">
		                                    			<div class="row">
		                                    				<div class="col-7 d-flex flex-column justify-content-center">
			                                    				<div class="mb-2"><b>${building.buildingName}</b></div>
					                                    		<div>${building.buildingAddr}&nbsp;&nbsp;${building.buildingAddrDetail}</div>
					                                    		<div class="p-1 m-1">
					                                    			<span class="border rounded p-1 text-center" style="background-color: rgb(164, 180, 235); color: white; width:60px;">${building.buildingTradeInfo}</span>
					                                    			<c:if test="${building.buildingTradeInfo eq '임대'}">
					                                    				<span class="m-1">월세</span>
					                                    				<span>${building.buildingMonthRent}&nbsp;만원</span>
					                                    			</c:if>
					                                    			<c:if test="${building.buildingTradeInfo eq '매매'}">
					                                    				<span class="m-1">매매가</span>
					                                    				<span>${building.buildingPrice}&nbsp;만원</span>
					                                    			</c:if>
					                                    		</div>
			                                    			</div>
			                                    			<div class="col-5 p-0 m-0">
			                                    				<img class="border rounded" src="getBuildingImage?buildingNo=${building.buildingNo}" width="250px" height="150px"/>
			                                    			</div>
		                                    			</div>
		                                    		</div>
		                                    	</li>
	                                    	</c:forEach>
	                                    </ul>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="col-1"></div>
	        </div>
    	</div>

        <script>
	    	let markers = new Array();
	    	let infoWindows = new Array();
	    	let map;
	    	var marker;
	    	var curMarker;
	    	
            let lat;
            let lon; 
            
            //병원 마커를 생성하기 위해 병원 정보들을 담을 배열
            var areaArr = new Array();
            
            //초기에 실행되는 함수들로, 현재 위치를 얻고, map을 만들어 마커를 세팅하기 위한 함수로 실행순서는 아래로 쭈르륵 이다! -------------------------------------------
            function getLocation() {
                if (navigator.geolocation) {
                    navigator.geolocation.getCurrentPosition(showPosition);
                } else { 
                    x.innerHTML = "Geolocation is not supported by this browser.";
                }
            }

            function showPosition(position) { //map을 만들고 현재 위치 마커를 추가하는 함수
            	if(${latitude} != 0){
            		lat = ${latitude};
            		lon = ${longitude};
            	}else{
            		lat = position.coords.latitude; 
                    lon = position.coords.longitude;
            	}

                var p = new naver.maps.LatLng(lat, lon);
                var mapOptions = {
                    center: p,
                    scaleControl: false,
                    mapDataContorol:false,
                    location,
                    zoom: 17
                };
                map = new naver.maps.Map('map', mapOptions); // id와 option
                
                var markerOptions = {
                    position: p.destinationPoint(90, 15),
                    map: map,
                    icon: {
                       	 content: '<img src="<c:url value="/resources/images/ballMascot.png"/>" alt="marker" style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; max-width: none; max-height: none; -webkit-user-select: none; position: absolute; width: 60px; height: 65px; left: 0px; top: 0px;">',
                         size: new naver.maps.Size(35, 30),
                         origin: new naver.maps.Point(0, 0),
                         anchor: new naver.maps.Point(16, 32)
                     }
                };
                
                curMarker = new naver.maps.Marker(markerOptions);
                initMap();
            }
            
            function initMap(){ //처음에 병원 마커를 생성하는 함수
            	var areaArr = new Array();
            	var num = 0;
            	<c:forEach items="${buildings}" var="buildingInfo">
            		var temp = new Object();
            		temp.buildingNo = ${buildingInfo.buildingNo};
            		temp.hospitalName = `${buildingInfo.buildingName}`;
            		temp.lat = ${buildingInfo.buildingLatitude};
            		temp.lon = ${buildingInfo.buildingLongitude};
            		temp.location = `${buildingInfo.buildingAddr}  ${buildingInfo.buildingAddrDetail}`;
            		areaArr.push(temp);
            		
            		var card = $("li[name='building${buildingInfo.buildingNo}']");
            		card.attr("id", num);
            		console.log(card);
            		num++;
            	</c:forEach>
            	
            	console.log(areaArr);
            	
            	for(var i=0; i< areaArr.length; i++){
            		marker = new naver.maps.Marker({
        				position: new naver.maps.LatLng(areaArr[i].lat, areaArr[i].lon),
                        map: map,
                        icon: {
                            content: '<img src="<c:url value="/resources/images/hosMarker.png"/>" alt="marker" style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; max-width: none; max-height: none; -webkit-user-select: none; position: absolute; width: 35px; height: 50px; left: 0px; top: 0px;">',
                             size: new naver.maps.Size(35, 30),
                             origin: new naver.maps.Point(0, 0),
                             anchor: new naver.maps.Point(16, 32)
                         }
            		});
            		var infoWindow = new naver.maps.InfoWindow({
            			content : '<div id="hosMark'+ i + '" style="width:300px; padding:13px;"><b style="font-size:20px;">' + areaArr[i].hospitalName + '</b><br/><div>'+ areaArr[i].location + '</div><a href= "view?buildingNo='+ areaArr[i].buildingNo +'" class="btn btn-sm mt-2 w-100 p-1" style="background-color: rgb(242, 101, 45); color: white; text-decoration:none;">매물 상세 정보</a></div>'
            		});
            		
            		markers.push(marker);
            		infoWindows.push(infoWindow);
            		
            	}
            	console.log(markers[0]);
            	for(var i=0, ii=markers.length; i<ii; i++) {
                    naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i)); // 클릭한 마커 핸들러
                }
            	
            }
            
            //초기에 생성한 마커들을 클릭하면 실행하는 함수로, 마커를 클릭하면 해당 마커의 정보창을 보여준다.
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
            //초기에 실행되는 함수 끝--------------------------------------------------------------------------------------------------------------
            
            //검색 버튼을 클릭하면 실행되는 함수이다.
            function searchMap(){
            	var addr = $("#searchInput").val();
            	naver.maps.Service.geocode({address: addr}, function(status, response) {

                    if (status !== naver.maps.Service.Status.OK) {
                        return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
                    }
                 
                    var result = response.result;
                    var myaddr = new naver.maps.Point(result.items[0].point.x, result.items[0].point.y);
                    
                    console.log("myaddr : "+myaddr);
                    curMarker.setPosition(myaddr);
                    
                    var location = new naver.maps.LatLng(myaddr);
                    map.panTo(location);
                });
            }
            
            //리셋버튼을 클릭하면 실행되는 함수로, 현재 사용자가 위치하는 곳으로 돌아온다.------------------------------------------------------------
            function resetMap(){
            	navigator.geolocation.getCurrentPosition(resetPosition);
            }
            
            function resetPosition(position) {
            	resetLat = position.coords.latitude; 
                resetLlon = position.coords.longitude;
            	
            	var resetPosition = new naver.maps.Point(resetLlon, resetLat);
            	
            	curMarker.setPosition(resetPosition);
            	
            	console.log("resetPosition : " + resetPosition);

            	var resetLocation = new naver.maps.LatLng(resetPosition);
                map.panTo(resetLocation);
                
            	console.log(curMarker);
            	console.log(resetLocation);
            }
            //리셋 버튼 클릭하면 실행되는 함수 끝------------------------------------------------------------------------------------------
            
            //인수매물 목록에 있는 병원의 카드를 클릭하면 실행되는 함수로, 해당 마커가 생성된 곳으로 지도가 이동한다!
            function moveMap(seq){
            	console.log(seq);
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
                var curPosition = curMarker.position;
                var currentLoc = new naver.maps.LatLng(curPosition.y, curPosition.x);
                map.panTo(currentLoc);
            }

            //임대 버튼을 클릭하면 실행되는 함수
            function leaseBtnClick(){
                $("#leaseBtn").css("background-color", "rgb(242, 101, 45)");
                $("#leaseBtn").css("color", "white");
                $("#priceBtnText").text("월세");

                $("#tradeBtn").css("background-color","");
                $("#tradeBtn").css("color","");
            }

            //매매 버튼을 클릭하면 실행되는 함수
            function tradeBtnClick(){
                $("#tradeBtn").css("background-color", "rgb(242, 101, 45)");
                $("#tradeBtn").css("color", "white");
                $("#priceBtnText").text("전세");

                $("#leaseBtn").css("background-color","");
                $("#leaseBtn").css("color","black");
            }
            
        </script>
    </section>
               				
<%@ include file="/WEB-INF/views/common/footer.jsp"%>