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

    <section class="container-fluid h-100 m-4">
        <div class="row">
            <div class="col-2"></div>
            <div class="col-8">
                <div class="d-flex mb-2">
                    <div class="mr-2" style="border: 1px solid rgb(192, 191, 191);">
                        <input type="text" class="p-2" style="font-size: 20px; border-color: transparent; width: 290px;" placeholder="주소를 입력해주세요."/>
                        <input id="leaseBtn" type="button" class="p-2 mr-1 mt-2 mb-2 rounded text-white" style="border-color: transparent; background-color: rgb(242, 101, 45);" value="임대"/>
                        <input id="tradeBtn" type="button" class="p-2 mr-2 rounded" style="border-color: transparent;" value="매매"/>
                    </div>
                    <div>
                        <div id="priceDiv" style="font-size: 20px; border: 1px solid rgb(192, 191, 191);">
                            <button id="priceBtn" type="button" onclick="priceBtn()" class="bg-white" style="border-color: transparent; background-color: transparent; padding: 12px;">월세
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
                    <div>
                        <button type="button" style="border-color: transparent; background-color: transparent;"><img src="${pageContext.request.contextPath}/resources/images/searchBtn.PNG" width="57px" /></button>
                    </div>
                </div>

                <div class="d-flex" style="z-index: 1;">
                    <div id="map" class="mr-4" style="width:600px;height:500px; border: 1px solid rgb(192, 191, 191); padding: 50px;"></div>
                    <div style="width:500px;height:500px; border: 1px solid rgb(192, 191, 191); padding: 50px; overflow:auto;">
                        <ul>
                            <li>냥1</li>
                            <hr/>
                            <li>냥2</li>
                            <hr/>
                            <li>냥3</li>
                            <hr/>
                            <li>냥4</li>
                            <hr/>
                            <li>냥5</li>
                            <hr/>
                            <li>냥6</li>
                            <hr/>
                            <li>냥7</li>
                            <hr/>
                            <li>냥8</li>
                            <hr/>
                            <li>냥9</li>
                            <hr/>
                            <li>냥10</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-2"></div>
        </div>
        
       
        <script>
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
                console.log(lat + " | " + lon);
                var mapOptions = {
                    center: new naver.maps.LatLng(lat, lon),
                    scaleControl: false,
                    mapDataContorol:false,
                    zoom: 17
                };
                var map = new naver.maps.Map('map', mapOptions); // id와 option
                var marker = new naver.maps.Marker({
                    position: new naver.maps.LatLng(lat, lon),
                    map: map
                });

                naver.maps.Event.addListener(map, 'click', function(e) {
                    marker.setPosition(e.latlng);
                });
            }
            
        </script>
    </section>
               				
<%@ include file="/WEB-INF/views/common/footer.jsp"%>