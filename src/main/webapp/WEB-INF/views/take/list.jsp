<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=lt1xd5ne5c"></script>
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
                // if(val2 === )
                console.log("val : "+val);
                $("#priceRange").attr("step", "1000");
                $("#priceText").text(val + "억" + val2 + "000 만");
                // $("#priceText").text(range.value);
            }else{
                $("#priceText").text(range.value + "만");
            }
        }
        
</script>

    <section class="container-fluid m-5">
        <div class="row">
            <div class="col-2"></div>
            <div class="col-8">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-6">
                            <div class="container-fluid">
                                <div class="mb-3 mt-3"><h3>인수 MAP</h3></div>
                                <div class="row">
                                    <div class="col-8 p-0">
                                        <div class="p-1" style="border: 1px solid rgb(192, 191, 191);">
                                            <input type="text" class="p-2" style="font-size: 18px; border-color: transparent;" placeholder="주소를 입력해주세요."/>
                                            <div class="float-right">
                                                <input id="leaseBtn" type="button" class="p-2 mr-1 mt-1 rounded" style="border-color: transparent; background-color: rgb(242, 101, 45); color: white;" value="임대" onclick="leaseBtnClick()"/>
                                                <input id="tradeBtn" type="button" class="p-2 mr-2 rounded" style="border-color: transparent;" value="매매" onclick="tradeBtnClick()"/>
                                            </div>
                                            
                                        </div>
                                    </div>
                                    <div class="col-3 p-0 pl-1">
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
                                    <div class="col-1 p-0 m-0">
                                        <button type="button" style="border-color: transparent; background-color: transparent;"><img src="${pageContext.request.contextPath}/resources/images/searchBtn.PNG" width="57px" /></button>
                                    </div>
                                </div>
                            </div>
                            <div id="map" class="mr-4 mt-3" style="width:100%;height:80%; border: 1px solid rgb(192, 191, 191); padding: 50px;"></div>
                        </div>
                        <div class="col-6" style="width:100%;height:600px;">
                            <div class="d-flex flex-column" style="z-index: 1;">
                                <div class="mb-3 mt-3 d-flex">
                                    <div><h3>인수 매물 목록</h3></div>
                                    <div class="p-2 float-right"><a href="enroll" class="border rounded p-2" style="background-color: rgb(242, 101, 45); color: white; text-decoration:none;">매물 등록</a></div>
                                </div>
                                <div style="width:90%;height:555px; border: 1px solid rgb(192, 191, 191); padding: 50px; overflow:auto;">
                                    <ul id="saleList" class="overflow-auto" style="list-style:none;">
                                    	<li>
                                    		gg
                                    	</li>
                                    </ul>
                                </div>
                                <div>
                                	<a href="enroll" class="border rounded" style="border-color: transparent; background-color: rgb(242, 101, 45); color: white;">매물 등록</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-2"></div>
        </div>
        
       
        <script>
	    	let markers = new Array();
	    	let infoWindows = new Array();
	    	let map;
	    	var marker;
            function getLocation() {
                if (navigator.geolocation) {
                    navigator.geolocation.getCurrentPosition(showPosition);
                } else { 
                    x.innerHTML = "Geolocation is not supported by this browser.";
                }
            }

            function showPosition(position) {
                lat = position.coords.latitude; 
                lon = position.coords.longitude;

                var p = new naver.maps.LatLng(lat, lon);
                var mapOptions = {
                    center: p,
                    scaleControl: false,
                    mapDataContorol:false,
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
                
                marker = new naver.maps.Marker(markerOptions);
                initMap();
            }
            
            function initMap(){
            	var areaArr = new Array();
            	areaArr.push(
            		{hospitalName : '하늘치과', lat : '37.495953' , lon : '127.121959'},
            		{hospitalName : '땅치과', lat : '37.515270' , lon : '127.107121'},
            		{hospitalName : '별치과', lat : '37.513853' , lon : '127.107577'},
            		{hospitalName : '뉴욕플란트치과', lat : '37.494802', lon : '127.122287'},
            		{hospitalName : '냠냠치과', lat : '37.494416', lon : '127.122826'},
            		{hospitalName : '충치사라져치과', lat : '37.494275' , lon : '127.122723'}
            	);
            	
            	for(var i=0; i< areaArr.length; i++){
            		marker = new naver.maps.Marker({
        				position: new naver.maps.LatLng(areaArr[i].lat, areaArr[i].lon),
                        map: map,
                        icon: {
                            content: '<img src="<c:url value="/resources/images/hosMarker.png"/>" alt="marker" style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; max-width: none; max-height: none; -webkit-user-select: none; position: absolute; width: 40px; height: 50px; left: 0px; top: 0px;">',
                             size: new naver.maps.Size(35, 30),
                             origin: new naver.maps.Point(0, 0),
                             anchor: new naver.maps.Point(16, 32)
                         }
            		});
            		var infoWindow = new naver.maps.InfoWindow({
            			content : '<div style="width:200px; text-align:center;padding:10px;"><b>' + areaArr[i].hospitalName + '</br><a href= "view" class="btn btn-info m-2">주변 매물 정보</a></div>'
            		});
            		
            		markers.push(marker);
            		infoWindows.push(infoWindow);
            		
            	}
            	for(var i=0, ii=markers.length; i<ii; i++) {
                	console.log(markers[i] , getClickHandler(i));
                    naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i)); // 클릭한 마커 핸들러
                }
            	
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

            function leaseBtnClick(){
                $("#leaseBtn").css("background-color", "rgb(242, 101, 45)");
                $("#leaseBtn").css("color", "white");
                $("#priceBtnText").text("월세");

                $("#tradeBtn").css("background-color","");
                $("#tradeBtn").css("color","");
            }

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