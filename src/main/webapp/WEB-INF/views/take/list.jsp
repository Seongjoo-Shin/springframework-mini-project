<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script>
        $(function(){
            getLocation();
        });

        //매매가
        var tradePrice;
        
        //보증금
        var depositPrice;
        
        //월세
        var monthPrice;
        
        var tradeInfo = "";

        function priceBtn() {
        	if(tradeInfo == ""){
        		swal({
        			text : "임대 / 매매를 선택해주세요."
        		});
        		return;
        	}
        	
        	//창이 나와있지 않은 경우!
        	if($("#leaseDropDownMenu").css("display") === "none" && $("#tradeDropDownMenu").css("display") === "none"){
        		if(tradeInfo == '임대'){
            		$("#leaseDropDownMenu").show();
            		$("#tradeDropDownMenu").hide();
            	}else{
            		$("#tradeDropDownMenu").show();
            		$("#leaseDropDownMenu").hide();
            	}
        		$("#priceDiv").css("border", "1px solid rgb(242, 101, 45)");
                $("#priceBtn").css("color","rgb(242, 101, 45)");
        	}else {
        		if(tradeInfo == '임대'){
            		$("#leaseDropDownMenu").hide();
            	}else{
            		$("#tradeDropDownMenu").hide();
            	}
        		$("#priceDiv").css("border", "1px solid rgb(192, 191, 191)");
                $("#priceBtn").css("color","black");
        	}
            
        }
        
      	//임대 버튼을 클릭하면 실행되는 함수
        function leaseBtnClick(){
      		
      		//이미 임대라고 설정이 되어 있다는 것은, 이미 한번 클릭한 상태라는 의미이므로, 클릭한 것을 취소할 수 도 있어야 한다!
        	if(tradeInfo == "임대"){
        		$("#leaseBtn").css("background-color","");
                $("#leaseBtn").css("color","black");
                tradeInfo = "";
                $("#priceBtnText").text("");
                $("#leaseDropDownMenu").hide();
                $("#priceDiv").css("border", "1px solid rgb(192, 191, 191)");
                $("#priceBtn").css("color","black");
                
        	}else{
        		$("#leaseBtn").css("background-color", "rgb(242, 101, 45)");
                $("#leaseBtn").css("color", "white");
                $("#priceBtnText").text("월세");

                $("#tradeBtn").css("background-color","");
                $("#tradeBtn").css("color","");
                tradeInfo = "임대";
        	}
            
            //임대 버튼을 클릭했는데 만약, 매매의 가격을 설정할 수 있는 레인지가 떠있을 경우!
            if($("#tradeDropDownMenu").css("display") != "none"){
            	$("#leaseDropDownMenu").show();
        		$("#tradeDropDownMenu").hide();
        	}
        }

        //매매 버튼을 클릭하면 실행되는 함수
        function tradeBtnClick(){
        	
        	if(tradeInfo == "매매"){
        		$("#tradeBtn").css("background-color","");
                $("#tradeBtn").css("color","");
                tradeInfo = "";
                $("#priceBtnText").text("");
                $("#tradeDropDownMenu").hide();
                $("#priceDiv").css("border", "1px solid rgb(192, 191, 191)");
                $("#priceBtn").css("color","black");
        	}else{
        		$("#tradeBtn").css("background-color", "rgb(242, 101, 45)");
                $("#tradeBtn").css("color", "white");
                $("#priceBtnText").text("매매가");

                $("#leaseBtn").css("background-color","");
                $("#leaseBtn").css("color","black");
                
                tradeInfo = "매매";
        	}
        	
          	//매매 버튼을 클릭했는데 만약, 임대의 가격을 설정할 수 있는 레인지가 떠있을 경우!
            if($("#leaseDropDownMenu").css("display") != "none"){
            	$("#tradeDropDownMenu").show();
        		$("#leaseDropDownMenu").hide();
        	}
        }

        function setPriceValue(range){
        	tradePrice = range.value;
            console.log(tradePrice);
            if(tradePrice >= 1000 && tradePrice < 10000){
                $("#tradePriceText").text(tradePrice + "만");
            } else if(tradePrice >= 10000){
                val = tradePrice;
                val = val.replace("0", "");
                val = val.replace("0", "");
                val = val.replace("0", "");

                val2 = val.slice(-1);
                
                if(val >= 100 && val < 1000){
                    val = val.slice(0, 2);
                }else if(val < 100){
                    val = val.slice(0, 1);
                }else{
                	val = val.slice(0, 3);
                }
                $("#tradePriceRange").attr("step", "1000");
                $("#tradePriceText").text(val + "억" + val2 + "000 만");
            }else{
                $("#tradePriceText").text(tradePrice + "만");
            }
        }
        
        //보증금의 range를 움직일 때 변하는 가격을 설정하기 위한 함수
        function setDepositPriceValue(range){
        	depositPrice = range.value;
        	
        	if(depositPrice >= 1000 && depositPrice < 10000){
                $("#depositPriceText").text(depositPrice + "만");
            } else if(depositPrice >= 10000){
            	depositPriceVal = depositPrice;
            	depositPriceVal = depositPriceVal.replace("0", "");
            	depositPriceVal = depositPriceVal.replace("0", "");
            	depositPriceVal = depositPriceVal.replace("0", "");

            	depositPriceVal2 = depositPriceVal.slice(-1);
                
                if(depositPriceVal >= 100 && depositPriceVal < 1000){
                	depositPriceVal = depositPriceVal.slice(0, 2);
                }else if(depositPriceVal < 100){
                	depositPriceVal = depositPriceVal.slice(0, 1);
                }
                $("#depositPriceRange").attr("step", "1000");
                $("#depositPriceText").text(depositPriceVal + "억" + depositPriceVal2 + "000 만");
            }else{
                $("#depositPriceText").text(depositPrice + "만");
            }
        	
        }
        
        //월세의 range를 움직일 때 변하는 가격을 설정하기 위한 함수
        function setMonthPriceValue(range){
        	monthPrice = range.value;
        	
        	if(monthPrice < 10000){
        		$("#monthPriceText").text(monthPrice + "만");
        	}else{
        		monthPriceVal = monthPrice;
        		monthPriceVal = monthPriceVal.replace("0", "");
        		monthPriceVal = monthPriceVal.replace("0", "");
        		monthPriceVal = monthPriceVal.replace("0", "");

        		monthPriceVal2 = monthPriceVal.slice(-1);
        		
        		console.log("m : " + monthPriceVal);
        		console.log("m2 : " + monthPriceVal2);
        		
        		monthPriceVal = monthPriceVal.slice(0, 1);
        		
        		$("#monthPriceText").text(monthPriceVal + "억" + monthPriceVal2 + "000 만");
        	}
        }
        
</script>

    <section class="m-5" style="flex-grow: 1;">
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
	                                                <input id="leaseBtn" type="button" class="p-2 mr-1 rounded" style="border-color: transparent;" value="임대" onclick="leaseBtnClick()"/>
	                                                <input id="tradeBtn" type="button" class="p-2 mr-1 rounded" style="border-color: transparent;" value="매매" onclick="tradeBtnClick()"/>
	                                            </div>
	                                            
	                                        </div>
	                                    </div>
	                                    <div class="col-2 p-0 pl-2">
	                                        <div id="priceDiv" style="border: 1px solid rgb(192, 191, 191);">
	                                            <button id="priceBtn" type="button" onclick="priceBtn()" class="bg-white w-100" style="border-color: transparent; background-color: transparent; font-size: 18px; padding: 10px;">
	                                                <span style="font-size: 15px;" id="priceBtnText">&nbsp;</span>
	                                                <img class="ml-2" src="${pageContext.request.contextPath}/resources/images/arrowBtn1.png" width="30px" />
	                                            </button>
	                                        </div>
	                                        <div id="leaseDropDownMenu" class="border bg-white mt-1 p-3 text-center" style="position:absolute; display: none; z-index: 2;">
	                                            <div class="p-2" style="font-size: 20px;">
	                                                <span>보증금 : 0 &nbsp;~ &nbsp;</span>
	                                                <span id="depositPriceText"></span>
	                                                <span> 원</span>
	                                            </div>
	                                            <div>
	                                                <input type="range" id="depositPriceRange" value ="0" min="0" max="100000" oninput="setDepositPriceValue(this)" step="1000" style="width: 350px;"/>
	                                            </div>
	                                            <div class="p-2" style="font-size: 20px;">
	                                                <span>월세 : 0 &nbsp;~ &nbsp;</span>
	                                                <span id="monthPriceText"></span>
	                                                <span> 원</span>
	                                            </div>
	                                            <div>
	                                                <input type="range" id="monthPriceRange" value ="0" min="0" max="10000" oninput="setMonthPriceValue(this)" step="100" style="width: 350px;"/>
	                                            </div>
	                                        </div>
	                                        <div id="tradeDropDownMenu" class="border bg-white mt-1 p-3 text-center" style="position:absolute; display: none; z-index: 2;">
	                                            <div class="p-2" style="font-size: 20px;">
	                                                <span>0 &nbsp;~ &nbsp;</span>
	                                                <span id="tradePriceText"></span>
	                                                <span> 원</span>
	                                            </div>
	                                            <div>
	                                                <input type="range" id="tradePriceRange" value ="0" min="0" max="1000000" oninput="setPriceValue(this)" step="1000" style="width: 350px;"/>
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
	                                <div class="mb-2 mt-1 d-flex">
	                                    <div class="flex-grow-1">
	                                    	<h3>인수 매물 목록</h3>
	                               		</div>
	                                    <div class="p-1 flex-grow-1 ">
	                                    	<a href="enroll?type=newEnroll" class="border rounded p-2 float-right" style="background-color: rgb(242, 101, 45); color: white; text-decoration:none; font-size: 18px">매물 등록</a>
	                                   	</div>
	                                </div>
	                                <div style="width:100%;height:562px; border: 1px solid rgb(192, 191, 191); padding: 15px; overflow:auto;">
	                                    <ul id="saleList" class="overflow-auto" style="list-style:none;">
	                                    	<c:forEach var="building" items="${buildings}" varStatus="status">
	                                    		<li id="" name="building${building.buildingNo}" class="border rounded p-2 mb-1" style="cursor:pointer;" onclick="moveMap(this.id)">
		                                    		<div class="container-fluid">
		                                    			<div class="row">
		                                    				<div class="col-7 d-flex flex-column justify-content-center">
			                                    				<div class="mb-2"><b>${building.buildingName}</b></div>
					                                    		<div>${building.buildingAddr}&nbsp;&nbsp;${building.buildingAddrDetail}</div>
					                                    		<div class="p-1 m-1">
					                                    			<span class="border rounded p-1 text-center" style="background-color: rgb(164, 180, 235); color: white; width:60px;">${building.buildingTradeInfo}</span>
					                                    			<c:if test="${building.buildingTradeInfo eq '임대'}">
					                                    				<span class="m-1">보증금 / 월세 : </span>
					                                    				<span>${building.buildingDepositPrice}&nbsp;</span>
					                                    				<span>/&nbsp;</span>
					                                    				<span>${building.buildingMonthRent}&nbsp;만원</span>
					                                    			</c:if>
					                                    			<c:if test="${building.buildingTradeInfo eq '매매'}">
					                                    				<span class="m-1">매매가</span>
					                                    				<span id="price${status.index}"></span>
					                                    				<span >원</span>
					                                    				<script>
					                                    					var price = `${building.buildingPrice}`;
					                                    					if(price > 10000){
					                                    						pVal = price;
					                                    						
					                                    		                if(price >= 1000 && price < 10000){
					                                    		                	$("#price${status.index}").text(price + "만");
					                                    		                } else if(price >= 10000){
					                                    		                    pVal = price;
					                                    		                    pVal = pVal.replace("0", "");
					                                    		                    pVal = pVal.replace("0", "");
					                                    		                    pVal = pVal.replace("0", "");

					                                    		                    pVal2 = pVal.slice(-1);
					                                    		                    
					                                    		                    if(pVal >= 100 && pVal < 1000){
					                                    		                    	pVal = pVal.slice(0, 2);
					                                    		                    }else if(pVal < 100){
					                                    		                    	pVal = pVal.slice(0, 1);
					                                    		                    }else{
					                                    		                    	pVal = pVal.slice(0, 3);
					                                    		                    }
					                                    		                    var t = pVal + "억" + pVal2 + "000 만";
					                                    		                    $("#price${status.index}").text(t);
					                                    		                }else{
					                                    		                    $("#price${status.index}").text(price + "만");
					                                    		                }
					                                    					}
					                                    				</script>
					                                    			</c:if>
					                                    		</div>
			                                    			</div>
			                                    			<div class="col-5 p-0 m-0">
			                                    				<img class="border rounded" src="getBuildingImage?buildingNo=${building.buildingNo}&type=nomal&img=0" width="250px" height="150px"/>
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
	    	var map;
	    	var marker;
	    	var curMarker;
	    	
	    	var areaArr = new Array();
	    	
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
                    zoom: 15
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
            	var bounds;
            	
            	if(addr == ""){
            		swal({
            			text : "검색할 주소를 입력해주십시오."
            		});
            		return;
            	}
            	naver.maps.Service.geocode({address: addr}, function(status, response) {

                    if (status !== naver.maps.Service.Status.OK) {
                    	swal({
                    		text: myaddress + "의 검색 결과가 없거나 기타 네트워크 에러"
                    	});
                        return;
                    }
                 
                    var result = response.result;
                    
                    //검색한 것이 좌표로 변환할 수 없을 경우, 지역명으로 입력해달라고 팝업창을 띄워준다.
                    if(result.items[0] == null){
                    	swal({
                    		text: "지역명으로 검색해주셔야 합니다."
                    	});
                    	return;
                    }
                    var myaddr = new naver.maps.Point(result.items[0].point.x, result.items[0].point.y);
                    console.log(myaddr);
                    
                    curMarker.setPosition(myaddr);
                    
                    var location = new naver.maps.LatLng(myaddr);

                    map.setCenter(location);
                    console.log(map.center);
                    
                    bounds = map.getBounds(),
                    southWest = bounds.getSW(),
                    northEast = bounds.getNE(),
                    lngSpan = northEast.lng() - southWest.lng(),
                    latSpan = northEast.lat() - southWest.lat();
                    
                    console.log("h : " + bounds.hasPoint(myaddr));
                    
                  	//목록에서도 검색하기 위한 것
                    searchList(bounds);
                });
            }
            
            function searchList(bounds) {
            	var southWest = bounds.getSW(), //좌표의 남서쪽의 위경도 좌표를 반환한다.
                northEast = bounds.getNE(), 	//좌표의 북동쪽의 위경도 좌표를 반환한다.
                lngSpan = northEast.lng() - southWest.lng(),
                latSpan = northEast.lat() - southWest.lat();
            	
            	console.log("b : " + bounds);
            	
            	$("li").css("display", "none");
            	
            	$("#leaseDropDownMenu").css("display", "none");
            	$("#tradeDropDownMenu").css("display", "none");
            	$("#priceDiv").css("border", "1px solid rgb(192, 191, 191)");
                $("#priceBtn").css("color","black");
            	
            	<c:forEach var="building" items="${buildings}" varStatus="status">
	            	var addrPoint = new naver.maps.Point(${building.buildingLongitude}, ${building.buildingLatitude});
	            	console.log("areaArr : " + bounds.hasPoint(addrPoint));
	            	
	        		if(bounds.hasPoint(addrPoint)){
	        			if(tradeInfo == '임대'){
	        				if(`${building.buildingTradeInfo}` == '임대'){
		        				//보증금
		        				var v1 = Number(depositPrice);
		        				//월세
		        				var v2 = Number(monthPrice);
		        				
		        				var buildingDep = Number(`${building.buildingDepositPrice}`);
		        				var buildingMonth = Number(`${building.buildingMonthRent}`);
		        				
		        				if(buildingDep <= v1){
		        					console.log(v1);
		        					if(buildingMonth <= v2){
		        						$("li#"+${status.index}).show();
		        					}
		        				}
	        				}
	        			}else if(tradeInfo == '매매'){
	        				if(`${building.buildingTradeInfo}` == '매매'){
	        					var v3 = Number(tradePrice);
		        				var buildingPrice = Number(`${building.buildingPrice}`);
		        				
		        				if(buildingPrice <= v3){
		        					$("li#"+${status.index}).show();
		        				}
	        				}
	        			}else{
	        				$("li#"+${status.index}).show();
	        			}
	        		}
            	</c:forEach>
            	
			}
            
            //리셋버튼을 클릭하면 실행되는 함수로, 현재 사용자가 위치하는 곳으로 돌아온다.------------------------------------------------------------
            function resetMap(){
            	navigator.geolocation.getCurrentPosition(resetPosition);
            	tradeInfo = "";
            	
            	$("#leaseDropDownMenu").css("display", "none");
            	$("#tradeDropDownMenu").css("display", "none");
            	$("#priceDiv").css("border", "1px solid rgb(192, 191, 191)");
                $("#priceBtn").css("color","black");
                $("#searchInput").val("");
            	
            	$("#tradeBtn").css("background-color","");
                $("#tradeBtn").css("color","");
                
                $("#leaseBtn").css("background-color","");
                $("#leaseBtn").css("color","black");
                
                $("li").show();
            }
            
            function resetPosition(position) {
            	resetLat = position.coords.latitude; 
                resetLlon = position.coords.longitude;
            	
            	var resetPosition = new naver.maps.Point(resetLlon, resetLat);
            	
            	curMarker.setPosition(resetPosition);
            	
            	console.log("resetPosition : " + resetPosition);

            	var resetLocation = new naver.maps.LatLng(resetPosition);
                map.setCenter(resetLocation);
                
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
                map.setCenter(currentLoc);
            }
            
        </script>
    </section>
               				
<%@ include file="/WEB-INF/views/common/footer.jsp"%>