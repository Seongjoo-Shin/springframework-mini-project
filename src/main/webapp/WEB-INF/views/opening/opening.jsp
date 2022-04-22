<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
    
    <script>
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
                            <div class="row d-flex justify-content-between flex-column" style="margin: 0 auto;">
                                <table style="margin:0 auto;">
                                    <tr>
                                        <td class="p-2"><div id="btn1" class="btn btn-outline-dark w-100 m-1 searchBtn" onclick="addActive(this.id);">임플란트</div></td>
                                        <td class="p-2"><div id="btn2" class="btn btn-outline-dark w-100 m-1 searchBtn" onclick="addActive(this.id);">역세권</div></td>
                                        <td class="p-2"><div id="btn3" class="btn btn-outline-dark w-100 m-1 searchBtn" onclick="addActive(this.id);">소아치료전문</d></td>
                                        <td class="p-2"><div id="btn4" class="btn btn-outline-dark w-100 m-1 searchBtn" onclick="addActive(this.id);">노인치료전문</div></td>
                                    </tr>
                                    <tr>
                                        <td class="p-2"><div id="btn5" class="btn btn-outline-dark w-100 m-1 searchBtn" onclick="addActive(this.id);">교정전문</div></td>
                                        <td class="p-2"><div id="btn6" class="btn btn-outline-dark w-100 m-1 searchBtn" onclick="addActive(this.id);">턱관절교정</d></td>
                                        <td class="p-2"><div id="btn7" class="btn btn-outline-dark w-100 m-1 searchBtn" onclick="addActive(this.id);">사랑니발치</div></td>
                                        <td class="p-2"><div id="btn8" class="btn btn-outline-dark w-100 m-1 searchBtn" onclick="addActive(this.id);">편의시설</div></td>
                                    </tr>
                                </table>
                            
                                <div class="mr-5">
                                    <span class="text-dark pr-2 float-left ml-5">* 중복 선택이 가능합니다.</span>
                                    <a href="#" class="float-right"><img src="/resources/images/resetBtn.png" width="40px" height="40px" onclick="resetKeyword();"/> </a>
                                    <a href="#" class=" pr-4 float-right"><img src="/resources/images/searchBtn1.png" width="40px" height="40px" onclick="searchKeyword();"/></a>
                                </div>
                            </div>
                            <div class="row d-flex mt-5 ml-4">
                                <img src="/resources/images/mascot.png" width="70px" height="70px" style="margin-top: auto;"/>
                                <div class="ml-3 mr-3" style="width:450px; height:300px; border-radius: 15px;">
                                <img src="/resources/images/messageBox.png" width="480px" height="300px" class="float-right" style="z-index: -100000"/>
                                
                                    <ul class="mt-3" id="msgBox" style="position: absolute;">
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-6 d-flex flex-column">
                            <div id="map" style="width:100%;height: 490px; border-radius: 15px;" class="mt-4"></div>    
                            <script>
                                var positions = new Array();
                                let markers = new Array();
                                let infoWindows = new Array();

                                positions.push(
                                    {location : '강남', lat : '37.4959854', lng : '127.0664091'},
                                    {location : '강동', lat : '37.5492077', lng : '127.1464824'},
                                    {location : '강북', lat : '37.6469954', lng : '127.0147158'},
                                    {location : '강서', lat : '37.5657617', lng : '126.8226561'},
                                    {location : '송파', lat : '37.5177941', lng : '127.1127078'}
                                );
                                var position = new naver.maps.LatLng(37.5714, 126.9848);

                                var map = new naver.maps.Map('map', {
                                    center: position,
                                    zoom: 11
                                });

                                for(var i=0; i<positions.length; i++){
                                    var marker = new naver.maps.Marker({
                                        map: map,
                                        title: positions[i].location,
                                        position: new naver.maps.LatLng(positions[i].lat, positions[i].lng),
                                        icon: {
                                        	content: '<img src="<c:url value="/resources/images/hosMarker.png"/>" alt="marker" style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; max-width: none; max-height: none; -webkit-user-select: none; position: absolute; width: 32px; height: 32px; left: 0px; top: 0px;">',
                                            size: new naver.maps.Size(20, 27),
                                            origin: new naver.maps.Point(0, 0),
                                            anchor: new naver.maps.Point(16, 32)
                                        } 
                                    });
                                    var infoWindow = new naver.maps.InfoWindow({
                                        content: '<div class="p-2" style="width:200px;"><span >' + positions[i].location + '</span><br><div class="text-center w-100"><a class="btn btn-sm btn-outline-dark w-100 mt-2" href="/take/list?">주변매물 보러가기 -></a></div></div>'
                                    });

                                    markers.push(marker);
                                    infoWindows.push(infoWindow);
                                }

                                function getClickHandler(seq) {
                                    return function (e) {
                                    
                                    var marker = markers[seq], 
                                        infoWindow = infoWindows[seq];

                                    if (infoWindow.getMap()) {
                                        infoWindow.close();
                                    } else {
                                        infoWindow.open(map, marker); // 표출
                                    }
                                    };
                                }

                                for (var i = 0, ii = markers.length; i < ii; i++) {
                                    naver.maps.Event.addListener(markers[i], "click", getClickHandler(i)); // 클릭한 마커 핸들러
                                }

                            </script>
                        </div>
                    </div>
                </div>
                <div class="col-2"></div>
            </div>
        </div>
    </section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>