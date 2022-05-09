<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4070b0bed2718280ca7cda2da7bebf5e&libraries=services"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
 .ui-widget-header { border: 0px solid #dddddd; background: #fff; } 

 .ui-datepicker-calendar>thead>tr>th { font-size: 14px !important; } 

 .ui-datepicker .ui-datepicker-header { position: relative; padding: 10px 0; } 

 .ui-state-default,
 .ui-widget-content .ui-state-default,
 .ui-widget-header .ui-state-default,
 .ui-button,
 html .ui-button.ui-state-disabled:hover,
 html .ui-button.ui-state-disabled:active { border: 0px solid #c5c5c5; background-color: transparent; font-weight: normal; color: #454545; text-align: center; } 

 .ui-datepicker .ui-datepicker-title { margin: 0 0em; line-height: 16px; text-align: center; font-size: 14px; padding: 0px; font-weight: bold; } 

 .ui-datepicker { display: none; background-color: #fff; border-radius: 4px; margin-top: 10px; margin-left: 0px; margin-right: 0px; padding: 20px; padding-bottom: 10px; width: 300px; box-shadow: 10px 10px 40px rgba(0, 0, 0, 0.1); } 

 .ui-widget.ui-widget-content { border: 1px solid #eee; } 

 #datepicker:focus>.ui-datepicker { display: block; } 

 .ui-datepicker-prev,
 .ui-datepicker-next { cursor: pointer; } 

 .ui-datepicker-next { float: right; } 

 .ui-state-disabled { cursor: auto; color: hsla(0, 0%, 80%, 1); } 

 .ui-datepicker-title { text-align: center; padding: 10px; font-weight: 100; font-size: 20px; } 

 .ui-datepicker-calendar { width: 100%; } 

 .ui-datepicker-calendar>thead>tr>th { padding: 5px; font-size: 20px; font-weight: 400; } 

 .ui-datepicker-calendar>tbody>tr>td>a { color: #000; font-size: 12px !important; font-weight: bold !important; text-decoration: none;}

 .ui-datepicker-calendar>tbody>tr>.ui-state-disabled:hover { cursor: auto; background-color: #fff; } 

 .ui-datepicker-calendar>tbody>tr>td { border-radius: 100%; width: 44px; height: 30px; cursor: pointer; padding: 5px; font-weight: 100; text-align: center; font-size: 12px; } 

 .ui-datepicker-calendar>tbody>tr>td:hover { background-color: transparent; opacity: 0.6; } 

 .ui-state-hover,
 .ui-widget-content .ui-state-hover,
 .ui-widget-header .ui-state-hover,
 .ui-state-focus,
 .ui-widget-content .ui-state-focus,
 .ui-widget-header .ui-state-focus,
 .ui-button:hover,
 .ui-button:focus { border: 0px solid #cccccc; background-color: transparent; font-weight: normal; color: #2b2b2b; } 

 .ui-widget-header .ui-icon { background-image: url('${pageContext.request.contextPath}/resources/images/btns.png'); } 

 .ui-icon-circle-triangle-e { background-position: -20px 0px; background-size: 36px; } 

 .ui-icon-circle-triangle-w { background-position: -0px -0px; background-size: 36px; } 

 .ui-datepicker-calendar>tbody>tr>td:first-child a { color: red !important; } 

 .ui-datepicker-calendar>tbody>tr>td:last-child a { color: #0099ff !important; } 

 .ui-datepicker-calendar>thead>tr>th:first-child { color: red !important; } 

 .ui-datepicker-calendar>thead>tr>th:last-child { color: #0099ff !important; } 

 .ui-state-highlight,
 .ui-widget-content .ui-state-highlight,
 .ui-widget-header .ui-state-highlight { border: 0px; background: #f1f1f1; border-radius: 50%; padding-top: 10px; padding-bottom: 10px; } 

 .inp { padding: 10px 10px; background-color: #f1f1f1; border-radius: 4px; border: 0px; } 

 .inp:focus { outline: none; background-color: #eee; } 
 .ui-datepicker-trigger {	margin-bottom: 10px;	}
</style>

	<script>
        $(function() {
            //input을 datepicker로 선언
            $("#buildingAvailableDate").datepicker({
                dateFormat: 'yy-mm-dd' //달력 날짜 형태
                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서                
                ,showOn: "button" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
                ,buttonImage: "${pageContext.request.contextPath}/resources/images/dateImg.png" //버튼 이미지 경로
                ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
                ,buttonText: "선택" //버튼 호버 텍스트              
                ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
                ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
                ,minDate: "+1D" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
            });                    
            
            //만약, 수정하는 것이라면 데이트피커 날짜를 설정해준다.
            if(`${buildingInfo.buildingAvailableDate}` != ""){
            	var date = `<fmt:formatDate value="${buildingInfo.buildingAvailableDate}" pattern="yyyy-MM-dd" />`;
                console.log(date);
                console.log(new Date(date));
                
                var tempDate = new Date(date);
                
                console.log(tempDate.getFullYear());
                
                var availableDate = new Date(tempDate.getFullYear(), tempDate.getMonth() , tempDate.getDate(), 0, 0, 0 ,0);
                var today = new Date();
                
                //만약, 설정된 날짜가 현재 날짜보다 앞이라면, 현재 날짜로 설정해준다.
                if(availableDate < today){
                	$('#buildingAvailableDate').datepicker('setDate', 'today');
                }else{
                	$('#buildingAvailableDate').datepicker('setDate', availableDate);
                }
                
                
            }else{
            	$('#buildingAvailableDate').datepicker('setDate', 'today');
            }
               
            $('#buildingAvailableDate').addClass("p-2");
            $('#buildingAvailableDate').addClass("mt-2 mr-1");  
            $('#buildingAvailableDate').css("font-size", "20px");

            //update하는 경우!
            if(`${type}` == 'updateEnroll'){
            	console.log(`${type}`);
            	setAddr(`${buildingInfo.buildingAddr}`);
            	if(`${buildingInfo.buildingTradeInfo}` == '매매'){
            		tradeBtnClick();
            	}
            	
            	//옵션을 설정해준다.
            	setOptions();
            	
            	//만약 사진에 뭐가 있다면! 일단 미리보기에 사진 띄우기
            	if($("#nomalImgPreview").children().length != 0){
            		$("#explainNomal").css('display', 'none');
            		
            		const btn = createBtn();
                    const nomalImgField = document.getElementById("nomalImgField");
                    nomalImgField.appendChild(btn);
            		useYn = 1;
            		fileNo = $("#nomalImgPreview").children().length;
            		console.log("fn : " + fileNo);
            		
            	}
            }

        });

        var buildingTradeInfo = "임대";
        //거래 정보의 임대 버튼을 클릭했을 때 실행되는 함수
        function leaseBtnClick(){
            $("#leaseBtn").css("background-color", "rgb(242, 101, 45)");
            $("#leaseBtn").css("color", "white");
            $("#leaseDiv").css("display", "");
            
            $("#tradeBtn").css("background-color", "");
            $("#tradeBtn").css("color", "");

            $("#tradeDiv").hide();
            buildingTradeInfo = "임대";
            $("#tradeInfo").text("월세");
        }

        //거래정보의 매매 버튼을 클릭했을 때 실행되는 함수
        function tradeBtnClick(){
        	$("#tradeBtn").css("background-color", "rgb(242, 101, 45)");
            $("#tradeBtn").css("color", "white");
            $("#tradeBtn").css("display", "");
            
            $("#leaseBtn").css("background-color", "");
            $("#leaseBtn").css("color", "");

            $("#leaseDiv").hide();
            $("#tradeDiv").show();
            buildingTradeInfo = "매매";
            $("#tradeInfo").text("전세");
        }

        //상세정보의 옵션 항목에 있는 버튼을 클릭하면 실행되는 함수로, 옵션의 모든 버튼에 적용되는 함수!
        function optionBtnClick(btn){
            if(btn.value == 3 && $("#equipDiv").css("display") === "none"){
                $("#equipDiv").show();
            }else if(btn.value == 3 && $("#equipDiv").css("display") !== "none"){
                $("#equipDiv").hide();
            }

            if(btn.style.backgroundColor !== "rgb(242, 101, 45)"){
                btn.style.backgroundColor = "rgb(242, 101, 45)";
                btn.style.color = "white";
                btn.name = "check";
            }else{
                btn.style.backgroundColor = "";
                btn.style.color = "";
                btn.name = "";
            }
        }
        
        //수정할 경우, DB에 저장된 옵션들을 가져와 설정해준다.
        function setOptions(){
        	var optionsList = `${buildingInfo.buildingOption}`.split(",");
        	console.log(optionsList);
        	
        	for(option of optionsList){
        		$(".optionBtn[value=" + option + "]").trigger('click');
        	}
        	
        	//만약 optionsList안에 3을 포함하고 있다면..!
        	if(optionsList.indexOf("3") != -1){
        		<c:forEach var="equip" items="${equipments}" varStatus="status">
        			equipmentSave(`${equip.equipmentName}`, `${equip.equipmentCount}`);
	        	</c:forEach>
        	}
        }
    </script>
    <style>
    	.error::placeholder{color:red;}
    	
         .optionBtn{
            width: 100px; 
            height: 50px;
            margin-top: 5px;
            margin-left: 5px;
            margin-right: 5px;
            border: 1px solid rgb(231, 231, 236);
            border-radius: 5px;
         }

         .image::-webkit-scrollbar {
            display: none; /* Chrome, Safari, Opera*/
        }
        #panorama {
            width: 500px;
            height: 300px;
            position: relative;
            z-index: 1000;
            display: table;
            -moz-transform-origin: top left;
            -webkit-transform-origin: top left;
            -ms-transform-origin: top left;
            transform-origin: top left;
        }
    </style>
    
    <section class="p-3 mt-4 container-fluid" style="flex-grow:1;">
        <div class="row">
            <div class="col-2"></div>
            <div class="col-8">
            	<form action="" id="frm" method="POST" enctype="multipart/form-data">
	                <div class="text-center">
	                    <h3 class="m-2">매물 등록</h3>
	                    <h4 class="border rounded mt-4 p-3 w-100" style="color: gray; background-color: rgb(238, 238, 241);">등록된 매물은 목록에 30일간 나타납니다.</h4>
	                </div>
	                <div>
	                    <h4 class="mt-5">이름</h4>
	                    <input id="buildingName" name="buildingName" type="text" class="p-2 border rounded" style="font-size: 20px; border-color: transparent; width: 100%;"placeholder="등록하려는 매물의 이름을 입력해주세요." value="${buildingInfo.buildingName}"/>
	                </div>
	                <div>
	                    <h4 class="mt-5">위치 정보</h4>
	                    <div class="border rounded text-center d-flex" style="width: 100%;">
	                        <div class="d-flex flex-column justify-content-center" style="background-color: rgb(231, 231, 236); width: 70px;">
	                            <div>
	                                주소
	                            </div>
	                        </div>
	                        <div class="m-4 d-flex flex-column justify-content-center">
	                            <div class="mb-2">* 도로명, 건물명, 지번에 대해 통합 검색이 가능합니다.</div>
	                            <div class="mb-2">
	                                <input class="p-2" type="text" id="buildingAddr" name="buildingAddr" placeholder="주소" style="width: 300px;" value="${buildingInfo.buildingAddr}" readonly>
	                                <input class="p-2" type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
	                            </div>
	                            <input id="buildingAddrDetail" name="buildingAddrDetail" class="p-2" placeholder="상세 주소를 입력해주세요." value="${buildingInfo.buildingAddrDetail}"/>
	                            
	                        </div>
	                        <div class="border-left d-flex justify-content-center flex-grow-1">
	                            <div id="addrDes">
	                                <div class="d-flex flex-column justify-content-center" style="width:100%; height: 400px;margin:10px;">
	                                    주소 검색을 하시면 해당 위치에 지도가 뜹니다! :D 
	                                </div>
	                            </div>
	                            <div id="map" class="border rounded" style="width:100%;height:400px;margin:10px; display: none;">지도</div>
	                            <script>
	                            	//매물의 위치에 대한 위경도를 저장하기 위한 변수들
	                            	var buildingLat;
	                            	var buildingLng;
	                            
	                                var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	                                    mapOption = {
	                                        center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
	                                        draggable: false,
	                                        level: 5 // 지도의 확대 레벨
	                                    };
	    
	                                //지도를 미리 생성
	                                var map = new daum.maps.Map(mapContainer, mapOption);
	                                //주소-좌표 변환 객체를 생성
	                                var geocoder = new daum.maps.services.Geocoder();
	    
	                                var imageSrc = "${pageContext.request.contextPath}/resources/images/hosMarker.png", // 마커이미지의 주소입니다    
	                                imageSize = new daum.maps.Size(40, 55), // 마커이미지의 크기입니다
	                                imageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	    
	                                // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	                                var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption),
	                                    markerPosition = new daum.maps.LatLng(37.54699, 127.09598); // 마커가 표시될 위치입니다
	    
	                                // 마커를 생성합니다
	                                var marker = new daum.maps.Marker({
	                                    position: markerPosition, 
	                                    image: markerImage // 마커이미지 설정 
	                                });
	    
	                                // 마커가 지도 위에 표시되도록 설정합니다
	                                marker.setMap(map);
	    
	                                //주소검색 버튼을 클릭하게 되면 실행되는 함수입니다.
	                                //주소를 검색하면 해당 주소를 필드에 넣고, map에서 찾아서 지도와 마커를 출력합니다.
	                                function sample5_execDaumPostcode() {
	                                    new daum.Postcode({
	                                        oncomplete: function(data) {
	                                            var addr = data.address; // 최종 주소 변수
	    
	                                            // 주소 정보를 해당 필드에 넣는다.
	                                            document.getElementById("buildingAddr").value = addr;
	                                            // 주소로 상세 정보를 검색
	                                            geocoder.addressSearch(data.address, function(results, status) {
	                                                // 정상적으로 검색이 완료됐으면
	                                                if (status === daum.maps.services.Status.OK) {
	    
	                                                    var result = results[0]; //첫번째 결과의 값을 활용
	    
	                                                    // 해당 주소에 대한 좌표를 받아서 변수에 저장합니다.
	                                                    var coords = new daum.maps.LatLng(result.y, result.x);
	                                                    buildingLat = result.y;
	                                                    buildingLng = result.x;
	                                                    
	                                                    // 지도를 보여줍니다.
	                                                    mapContainer.style.display = "block";
	                                                    $("#addrDes").css("display","none");
	                                                    map.relayout();
	                                                    // 지도 중심을 검색한 위치로 변경합니다.
	                                                    map.setCenter(coords);
	                                                    // 마커를 결과값으로 받은 위치로 옮깁니다.
	                                                    marker.setPosition(coords)
	                                                }
	                                            });
	                                        }
	                                    }).open(); //주소검색을 클릭하게 되면 주소를 검색할 수 있는 팝업창을 열기 때문에 open!
	                                }
	                                
	                                //수정할 때, 지도에 해주는 작업
	                                function setAddr(addr){
                                        // 주소 정보를 해당 필드에 넣는다.
                                        document.getElementById("buildingAddr").value = addr;
                                        // 주소로 상세 정보를 검색
                                        geocoder.addressSearch(addr, function(results, status) {
                                            // 정상적으로 검색이 완료됐으면
                                            if (status === daum.maps.services.Status.OK) {

                                                var result = results[0]; //첫번째 결과의 값을 활용

                                                // 해당 주소에 대한 좌표를 받아서 변수에 저장합니다.
                                                var coords = new daum.maps.LatLng(result.y, result.x);
                                                buildingLat = result.y;
                                                buildingLng = result.x;
                                                
                                                // 지도를 보여줍니다.
                                                mapContainer.style.display = "block";
                                                $("#addrDes").css("display","none");
                                                map.relayout();
                                                // 지도 중심을 검색한 위치로 변경합니다.
                                                map.setCenter(coords);
                                                // 마커를 결과값으로 받은 위치로 옮깁니다.
                                                marker.setPosition(coords)
                                            }
                                        });
	                                }
	                            </script>
	                        </div>
	                    </div>
	                </div>
	                <div>
	                    <h4 class="mt-5">거래 정보</h4>
	                    <div class="border rounded">
	                        <div class="text-left p-2">
	                            <input id="leaseBtn" name="leaseBtn" type="button" class="p-2 mr-1 mb-2 rounded" style="border-color: transparent; color:white; background-color: rgb(242, 101, 45);" onclick="leaseBtnClick()" value="임대"/>
	                            <input id="tradeBtn" name="tradeBtn" type="button" class="p-2 mr-2 rounded" style="border-color: transparent;" onclick="tradeBtnClick()" value="매매"/>
	                        </div>
	                        <div>
	                            <div class="d-flex">
	                                <div class="pl-3 d-flex flex-column m-2 text-right">
	                                    <div class="m-2 p-2" style="font-size: 20px;">인수 비용</div>
	                                    <div id="tradeInfo" class="m-1 p-2" style="font-size: 20px;">월세</div>
	                                </div>
	                                <div class="pl-3 d-flex flex-column m-2">
	                                    <div class="d-flex m-2">
	                                        <input type="number" min="1" id="buildingTakeoverPrice" name="buildingTakeoverPrice" class="p-1 border rounded" style="font-size: 18px; color: rgb(88, 90, 95); border-color: transparent;" placeholder="인수 비용을 입력해주세요." value="${buildingInfo.buildingTakeoverPrice}"/>
	                                        <div class="mr-2 p-2" style="font-size: 20px; color: rgb(131, 133, 139);">만원(예. 1000만원)</div>
	                                    </div>
	                                    <div id="leaseDiv" style="display: block;">
		                                    <div class="d-flex m-2" >
		                                        <input type="number" min="1" id="buildingDepositPrice" name="buildingDepositPrice" class="p-1 border rounded" style="font-size: 18px; color: rgb(88, 90, 95); border-color: transparent;" placeholder="보증금" value="${buildingInfo.buildingDepositPrice}"/>
		                                        <div style="font-size: 30px;">&nbsp;&nbsp;/&nbsp;&nbsp;</div>
		                                        <input type="number" min="1" id="buildingMonthRent" name="buildingMonthRent" class="p-1 border rounded" style="font-size: 18px; color: rgb(88, 90, 95); border-color: transparent;" placeholder="월세" value="${buildingInfo.buildingMonthRent}"/>
		                                        <div class="mr-2 p-2" style="font-size: 20px; color: rgb(131, 133, 139);">만원(예. 1000만원)</div>
		                                    </div>
	                                    </div>
	                                    <div id="tradeDiv" style="display:none;">
	                                    	<div class="d-flex m-2" >
		                                        <input type="number" min="1" id="buildingPrice" name="buildingPrice" class="p-1 border rounded" style="font-size: 18px; color: rgb(88, 90, 95); border-color: transparent;" placeholder="매매가" value="${buildingInfo.buildingPrice}"/>
		                                        <div class="mr-2 p-2" style="font-size: 20px; color: rgb(131, 133, 139);">만원(예. 1000만원)</div>
		                                    </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <div>
	                    <h4 class="mt-5">상세 정보</h4>
	                    <div class="border rounded d-flex">
	                        <div class="text-center p-4 d-flex flex-column justify-content-center" style="background-color: rgb(231, 231, 236); width:160px;">
	                            <div>건물 크기<br/>(1P = 3.3058㎡)</div>
	                        </div>
	                        <div class="p-2 d-flex flex-column justify-content-center mr-6">
	                            <div class="d-flex m-2">
	                                <div class="m-2">공급 면적</div>
	                                <span><input type="number" min="1" onchange="supplyChange(this)" id="buildingSupplyArea" name="buildingSupplyArea" class="ml-2 p-2 border" style="width: 100px; border-color: transparent;" placeholder="공급면적" value="${buildingInfo.buildingSupplyArea}"/>&nbsp;&nbsp;&nbsp;평</span>
	                                <span style="font-size:18px;"><input id="buildingSupplyAreaM" class="ml-2 p-2 border" style="width: 100px; border-color: transparent;" disabled/>&nbsp;&nbsp;&nbsp;㎡</span>
	                            </div>
	                            <div class="border-bottom m-1"></div>
	                            <div class="d-flex m-2 mt-3">
	                                <div class="m-2">전용 면적</div>
	                                <span><input type="number" min="1" onchange="dedicatedChange(this)" id="buildingDedicatedArea" name="buildingDedicatedArea" class="ml-2 p-2 border" style="width: 100px; border-color: transparent;" placeholder="전용면적" value="${buildingInfo.buildingDedicatedArea}"/>&nbsp;&nbsp;&nbsp;평</span>
	                                <span style="font-size:18px;"><input id="buildingDedicatedAreaM" class="ml-2 p-2 border" style="width: 100px; border-color: transparent;" disabled/>&nbsp;&nbsp;&nbsp;㎡</span>
	                            </div>
	                        </div>
	                        <div class="text-center p-4 d-flex flex-column justify-content-center" style="background-color: rgb(231, 231, 236);">
	                            <div>건물 층수</div>
	                        </div>
	                        <div class="p-2 d-flex flex-column mr-6">
	                            <div class="d-flex m-2 mb-1">
	                                <div class="m-2 p-1 pr-2">건물 층수</div>
	                                <input type="number" min="1" id="buildingTotalFloor" name="buildingTotalFloor" class="p-1 border" style="border-color: transparent;" placeholder="건물 층수 입력" value="${buildingInfo.buildingTotalFloor}"/>
	                            </div>
	                            <div class="border-bottom m-1"></div>
	                            <div class="d-flex m-2 mt-3">
	                                <div class="m-2 p-1 pr-2">해당 층수</div>
	                                <input type="number" id="buildingFloor" name="buildingFloor" class="p-1 border" style="border-color: transparent;" placeholder="해당 층수 입력" value="${buildingInfo.buildingFloor}"/>
	                            </div>
	                        </div>
	                    </div>
	    
	                    <div class="d-flex mt-2">
	                        <div class="border rounded d-flex justify-content-center p-4" style="background-color: rgb(231, 231, 236); width: 160px;">
	                            <div>옵션 항목</div>
	                        </div>
	                        <div class="border rounded d-flex flex-grow-1 ml-2">
	                            <button type="button" class="optionBtn ml-2" value="1" onclick="optionBtnClick(this)">엘리베이터</button>
	                            <button type="button" class="optionBtn" value="2" onclick="optionBtnClick(this)">주차 가능</button>
	                            <button type="button" class="optionBtn" value="3" onclick="optionBtnClick(this)">장비</button>
	                            <button type="button" class="optionBtn" value="4" onclick="optionBtnClick(this)">화장실</button>
	                            <button type="button" class="optionBtn" value="5" onclick="optionBtnClick(this)">CCTV</button>
	                            <button type="button" class="optionBtn" value="6" onclick="optionBtnClick(this)">주변 약국</button>
	                        </div>
	                    </div>
	                    <div id="equipDiv" style="display: none;" class="d-flex h-100 mt-2">
                            <div class="border rounded p-4" style="background-color: rgb(231, 231, 236); width: 194px; position: relative;">
                                <div style="transform: translate(-50%,-50%); position: absolute;left: 50%;top: 50%;">장비</div>
                            </div>
                            <div class="border rounded d-flex flex-column ml-2 flex-grow-1">
                                <div class="p-2">
                                    <input id="equipmentName" class="p-2 rounded border" type="text" placeholder="가지고 있는 장비를 추가해주세요!" style="width: 270px;"/>
                                    <input id="equipmentCnt" class="p-2 rounded border" type="number" min="1" placeholder="장비 개수" style="width: 110px;"/>
                                    <button type="button" onclick="equipmentSave()" class="btn btn-info mb-1">+</button>
                                </div>
                                <div id="equipmentList" class="m-2" style="display: inline-block;">
                                </div>
                            </div>
	                    </div>
	                    
	                </div>
	                <div>
	                    <h4 class="mt-5">입주 가능일</h4>
	                    <input type="text" class="border rounded" id="buildingAvailableDate" name="buildingAvailableDate" value="${buildingInfo.buildingAvailableDate}" readonly />
	                </div>
	                <div>
	                    <h4 class="mt-5">상세 설명</h4>
	                    <textarea id="buildingDetailContent" name="buildingDetailContent" class="border rounded w-100 p-2" style="resize:none; height: 300px; font-size: 20px;" maxlength="500" placeholder=' [상세 설명 작성 주의 사항]&#13;&#10;&#13;&#10; - 매물 정보와 관련이 없는 홍보성 정보는 입력할 수 없습니다.&#13;&#10; - 비속어를 입력할 수 없습니다.&#13;&#10;&#13;&#10; ** 위 주의 사항을 위반할 경우, 해당 매물이 삭제될 수 있습니다.'>${buildingInfo.buildingDetailContent}</textarea>
	                </div>
	                <div>
	                    <h4 class="mt-5">사진 등록</h4>
	                    <div class="border rounded">
	                        <div class="m-2">
	                            <span><button type="button" id="nomalImageBtn" class="border rounded p-3 mr-1 btn-info" onclick="nomalImage()">일반 사진</button></span>
	                            <span><button type="button" id="aroundImageBtn" class="border rounded p-3" onclick="aroundImage()">360도 사진</button></span>
	                        </div>
	                        <div id="nomalImageText"> <!-- 일반 사진에 대한 태그 -->
	                            <div class="border rounded m-2">
	                                <div>
	                                    <div class="m-2">- 사진은 가로로 찍은 사진을 권장합니다!</div>
	                                    <div class="m-2">- 사진은 최소 2장 이상 등록해야 하며, 최대 15장까지 가능합니다.</div>
	                                </div>
	                            </div>
	                            <div class="border rounded m-2" style="background-color: rgb(231, 231, 236);">
	                                <div id="explainNomal" class="p-5 text-center">
	                                    <img id="mas" src="${pageContext.request.contextPath}/resources/images/mascot.png" width="100px"/>
	                                    <h6>최소 2장 이상 등록해야 하며, 가로 사진을 권장합니다.</h6>
	                                    <label for="chooseNomalImg" class="btn btn-info m-2">사진 등록</label>
	                                    <input type="file" id="chooseNomalImg"  name="chooseNomalImg" accept="image/*" style="display: none;" onchange="getImageFiles(event)" multiple>
	                                </div>
	                                <div id="nomalImgField">
	                                    <div id="nomalImgPreview" class="w-100" style="align-items: center; display: inline;">
	                                    	<c:if test="${not empty nomalCnt}">
	                                    		<c:forEach var="image" items="${imageFile}" varStatus="status">
	                                    			<c:if test="${image.panoramaCheck eq '0'}">
	                                    				<span id="file${status.index}">
		                                    				<img id="${status.index}" name="exist" src="getImageByteArrayToFile?buildingNo=${buildingInfo.buildingNo}&type=nomal&img=${status.index}" data-file="${image.attachOriginalName}" seq="${image.buildingFileNo}" width="300px" height="220px" class="m-1 border rounded" style="border: 1px solid gainsboro; padding: 10px; background-color :white;" />
		                                    				<a class="btn btn-danger" onclick="deleteImg(${status.index})" style="margin-right:8px; cursor:pointer;">X</a>
		                                    			</span>
	                                    			</c:if>
	                                    		</c:forEach>
	                                    	</c:if>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                        <div id="aroundImageText" style="display: none;"> <!-- 360도 사진에 대한 태그 -->
	                            <div class="border rounded m-2">
	                                <div>
	                                    <div class="m-2">- 사진은 '구글 스트리트 뷰' 애플리케이션으로 촬영한 사진을 업로드하실 것을 권장합니다.</div>
	                                    <div class="m-2">- 사진 등록 버튼을 클릭하고 선택해주세요!</div>
	                                </div>
	                            </div>
	                            <div class="border rounded m-2" style="background-color: rgb(231, 231, 236);">
	                                <div id="explainAround" class="p-5 text-center">
	                                    <img src="${pageContext.request.contextPath}/resources/images/mascot.png" width="100px"/>
	                                    <h6>사진을 등록해주세요!</h6>
	                                    <label for="chooseAroundImg" class="btn btn-info m-2">사진 등록</label>
	                                    <input type="file" id="chooseAroundImg"  name="chooseAroundImg" accept="image/*" style="display: none;" onchange="get360ImageFile(event)">
	                                </div>
	                                <div id="aroundImgField" class="d-flex">
	                                    <div id="aroundImgPreview" class="d-flex" style="align-items: center;">
	                                    	<c:if test="${not empty panoCnt}">
	                                    		<c:forEach var="image" items="${imageFile}" varStatus="status">
	                                    			<c:if test="${image.panoramaCheck eq '1'}">
	                                    				<div seq="${image.buildingFileNo}" class="m-1" name="exist" id="panorama" style="border-radius: 10px; object-fit: cover;"></div>
	                                    				<script>
		                                    				pannellum.viewer("panorama", {
		                	                                    type: "equirectangular",
		                	                                    panorama: `getImageByteArrayToFile?buildingNo=${buildingInfo.buildingNo}&type=nomal&img=${status.index}`,
		                	                                    autoLoad: true
		                	                                });
		                	                                $("#explainAround").css('display', 'none');
		                	                                
		                	                                const delete360Btn = document.createElement('a');
		                	                                delete360Btn.setAttribute('onclick', 'delete360Img(this)');
		                	                                delete360Btn.setAttribute("class", "btn btn-danger ml-2");
		                	                                delete360Btn.innerHTML = "X";
		                	                                delete360Btn.style.padding = "10px";
		                	                                delete360Btn.style.cursor = "pointer";
		                	                                delete360Btn.style.fontSize = "25px";
		                	
		                	                                aroundImgPreview.appendChild(delete360Btn);
		                	
		                	                                $("#chooseAroundImg").val("");
	                                    				</script>
	                                    			</c:if>
	                                    		</c:forEach>
	                                    	</c:if>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                        <script>
	                        	//이미지 첨부파일을 저장하기 위한 배열
	                            var uploadFiles = [];
	                        	//360도 이미지를 저장하기 위한 변수
	                            var uploadAroundFile;
	                        	
	                        	//수정하는 상태일 경우, DB에 저장된 사진 중, 삭제할 것들의 seq를 저장하는 배열이다.
	                        	var deleteDBImgBySeq = [];
	                        	
	                        	//첨부파일에 번호를 붙이기 위해 사용하는 변수로, id에 붙여준다.
	                            var fileNo = 0;
	                        	
	                        	//만약, checkNum과 fileNo가 같아지면, 업로드되어 있는 파일이 아무것도 없게 됨!
	                            var checkNum = 0;
	                        	
	                        	//장비에 번호를 붙이기 위해 사용하는 함수로, id에 붙여준다.
	                            var equipNo = 0;
	                        	
	                        	//이미지를 등록하게 되면 미리보기를 보여주는 엘리먼트를 id로 가져온다.
	                            const nomalImgPreview = document.getElementById("nomalImgPreview");
	                            const aroundImgPreview = document.getElementById("aroundImgPreview");
	
	                            //360도 이미지의 미리보기를 출력하는 곳의 상위 엘리먼트를 가져온다.
	                            const aroundImgField = document.getElementById("aroundImgField");
	
	                            //이미지를 추가하는 버튼을 제어하기 위한 변수
	                            var useYn = 0;
	                            
	                            //일반 사진을 등록할 때 실행되는 함수이다.
	                            function getImageFiles(e) {
	                            	//첨부된 이미지 파일들을 가져온다.
	                                const files = e.currentTarget.files;
	                            	console.log(files);
	                            	
	                            	//이미지 미리보기 엘리먼트에 추가된 자식노드의 수가 15개가 넘어가거나, 미리보기 엘리먼트의 자식노드와 첨부된 파일의 갯수가 15개를 넘어가게 되면 업로드할 수 없다!(최대 15장이기 때문에)
	                                if(nomalImgPreview.childElementCount > 15 || (nomalImgPreview.childElementCount + files.length) > 15){
	                                	swal({
	                                		icon:"${pageContext.request.contextPath}/resources/images/errorMascot.png",
	                                		text:"이미지는 최대 15장까지만 업로드가 가능합니다."
	                                	});
	                                    return;
	                                }
	                            	
	                            	//모든 첨부 파일들에 대해 파일 각각을 처리하기 위해 forEach를 사용했다.
	                                [...files].forEach(file => {
	                                	//첨부파일의 형식이 이미지가 아니라면, 
	                                    if(!file.type.match("image/.*")){
	                                    	swal({
	                                    		icon:"${pageContext.request.contextPath}/resources/images/errorMascot.png",
	                                    		text:"이미지파일만 입력해 주세요.(예 - .jpg .png )"
	                                    	});
	                                        alert("이미지 파일만 업로드 가능합니다.", {title:'START:DEN'});
	                                        return;
	                                    }
	                                    $("#explainNomal").css('display', 'none');
	                                    if(files.length <= 15){
	                                        const reader = new FileReader();
	                                        reader.onload = (e) => {
	                                        	uploadFiles.push(file);
	                                            const preview = createImagePreview(e, file);
	                                            nomalImgPreview.appendChild(preview);
	                                            useYn++;
	                                        };
	                                        reader.readAsDataURL(file);
	                                    }
	                                });
	                                if(useYn === 0){
	                                    const btn = createBtn();
	                                    const nomalImgField = document.getElementById("nomalImgField");
	                                    nomalImgField.appendChild(btn);
	                                }
	                            }
	
	                            //360도 사진 등록
	                            function get360ImageFile(e) {
	                                const files = e.currentTarget.files;
	                                
	                                uploadAroundFile = files[0];
	                                const name = uploadAroundFile.name;
	                                const panoName = "${pageContext.request.contextPath}/resources/images/"+name;

	                                console.log(uploadAroundFile);
	                                aroundImgPreview.innerHTML += '<span id="panorama" class="m-2" style="border-radius: 10px; object-fit: cover;"></span>';
	
	                                pannellum.viewer("panorama", {
	                                    type: "equirectangular",
	                                    panorama: panoName,
	                                    autoLoad: true
	                                });
	                                $("#explainAround").css('display', 'none');
	
	                                const delete360Btn = document.createElement('a');
	                                delete360Btn.setAttribute('onclick', 'delete360Img(this)');
	                                delete360Btn.setAttribute("class", "btn btn-danger ml-2");
	                                delete360Btn.innerHTML = "X";
	                                delete360Btn.style.padding = "10px";
	                                delete360Btn.style.cursor = "pointer";
	                                delete360Btn.style.fontSize = "25px";
	
	                                aroundImgPreview.appendChild(delete360Btn);
	
	                                $("#chooseAroundImg").val("");
	                            }
	
	                            function delete360Img(_this){
	                            	if($("#panorama").attr("name") == 'exist'){
	                            		console.log("db에 저장된 것 삭제할 경우");
	                            		deleteDBImgBySeq.push($("#panorama").attr("seq"));
	                            		
	                            		$(_this).remove();
		                                $("#panorama").remove();
		                                $("#explainAround").css('display', 'block');
		                                console.log(deleteDBImgBySeq);
		                                
	                            	}else{
	                            		
	                            		$(_this).remove();
		                                $("#panorama").remove();
		                                uploadAroundFile = "";
		                                $("#explainAround").css('display', 'block');
	                            	}
	                            }
	
	                            function createImagePreview(e, file){
	                                const span = document.createElement('span');
	                                const img = document.createElement('img');
	                                const deleteBtn = document.createElement('a');
	
	                                img.setAttribute('src', e.target.result);
	                                img.setAttribute('data-file', file.name);
	                                img.setAttribute('class', "m-1 border rounded");
	                                img.setAttribute('width', '300px');
	                                img.setAttribute('height', '220px');
	                                img.style.border = '1px solid gainsboro';
	                                img.style.padding = '10px';
	                                img.style.backgroundColor = 'white';
	
	                                
	                                deleteBtn.setAttribute("class", "btn btn-danger");
	                                deleteBtn.setAttribute('onclick', 'deleteImg(' + fileNo + ')');
	                                deleteBtn.style.marin = "10px";
	                                deleteBtn.innerHTML = "X";
	                                deleteBtn.style.marginRight = "5px";
	                                deleteBtn.style.cursor = "pointer";
	
	                                span.setAttribute("id","file" + fileNo);
	                                span.setAttribute("class","m-2");
	                                span.appendChild(img);
	                                span.appendChild(deleteBtn);
	                                
	                                fileNo++;
	                                
	                                return span;
	                            }
	
	                            function createBtn(){
	                                const span = document.createElement('span');
	                                span.setAttribute('id','addBtn');
	
	                                const addBtnLabel = document.createElement('label');
	                                addBtnLabel.setAttribute('width', '200px');
	                                addBtnLabel.setAttribute('height', '150px');
	                                addBtnLabel.style.alignContent = "center";
	
	                                const img = document.createElement('img');
	                                img.setAttribute('src', "${pageContext.request.contextPath}/resources/images/plusBtn.png");
	                                img.setAttribute('width', '110px');
	                                img.setAttribute('height', '100px');
	                                img.style.padding = '10px';
	                                img.style.margin = '5px';
	
	                                addBtnLabel.appendChild(img);
	                                addBtnLabel.setAttribute('for','chooseNomalImg');
	                                addBtnLabel.style.cursor = 'pointer';
	
	                                span.appendChild(addBtnLabel);
	                                return span;
	                            }
	                            
	                            function deleteImg(fnum){
	                            	if($("img#"+fnum).attr("name") == 'exist'){
	                            		console.log("db에 저장된 것 삭제할 경우");
	                            		deleteDBImgBySeq.push($("img#"+fnum).attr("seq"));
	                            		document.querySelector("#file" + fnum).remove();
	                            		
	                            		
	                            	}else{
	                            		document.querySelector("#file" + fnum).remove();
	                            		var DBImgCnt = 0;
	                            		if(`${type}` == 'updateEnroll'){
	                            			var DBImgCnt = `${nomalCnt}`;
			                            	DBImgCnt++;
	                            		}
		                            	console.log(fnum-DBImgCnt);
		                            	uploadFiles[fnum-DBImgCnt] = "";
		                            	console.log(uploadFiles);
		                            	
	                            	}
	                            	console.log($("#nomalImgPreview").children().length);
	                            	if($("#nomalImgPreview").children().length == 0){
		                            	$("#addBtn").remove();
	                                    $("#explainNomal").css('display', 'block');
	                                    useYn = 0;
		                            }
	                            }
	                            
	                            //공급 면적을 입력하게 되면, 알아서 m^2으로 변환한다!
	                            function supplyChange(sup) {
									var supplyValue = (sup.value)*3.3058;
									
									$("#buildingSupplyAreaM").val(supplyValue);
								}
	                            
	                            //전용 면적을 입력하게 되면, 알아서 m^2으로 변환
	                            function dedicatedChange(ded) {
									var dedicatedValue = (ded.value)*3.3058;
									
									$("#buildingDedicatedAreaM").val(dedicatedValue);
								}
	                            
	                            //장비를 추가를 위해 + 버튼을 클릭했을 때 실행되는 함수(equipNo)
	                            function equipmentSave(equipName, equipCnt) {
	                            	//만약, 수정할 경우, 옵션을 추가해줘야 하기 때문에..!
	                            	
	                            	var equipmentName;
									var equipmentCnt;
	                            	
	                            	if(equipName != null){
	                            		console.log(equipName);
	                            		equipmentName = equipName;
	                            		equipmentCnt = equipCnt;
	                            		
	                            	}else{
	                            		equipmentName = $("#equipmentName").val();
										equipmentCnt = $("#equipmentCnt").val();
	                            	}
									
									if(equipmentName === ""){
										swal({
											title:"장비 이름을 입력해주십시오.",
											text: "정확하게 입력해주세요!",
											icon:"${pageContext.request.contextPath}/resources/images/errorMascot.png"
										});
										return;
									}
									if(equipmentCnt === ""){
										swal({
											title:"장비 개수를 입력해주십시오.",
											text: "정확하게 입력해주세요!",
											icon:"${pageContext.request.contextPath}/resources/images/errorMascot.png"
										});
										return;
									}
									
									//만약, 지금 등록하는 장비와 등록되어 있는 장비의 이름이 같은 경우, 등록된 부분에 갯수를 더해서만 나타낸다!
									var tempList = $("#equipmentList").children();
									
									if(tempList != null){
										for(t of tempList){
											var tempId = t.getAttribute("id");
											
											//만약, 등록된 장비와 지금 등록하는 장비의 이름이 같아면, 개수를 더해서 출력하도록 한다!
											if(equipmentName == $("#"+tempId+"Name").text()){
												var tempCnt = $("#"+tempId+"Cnt").text();
												var saveCnt = parseInt(tempCnt) + parseInt(equipmentCnt);
												$("#"+tempId+"Cnt").text(saveCnt);
												$("#equipmentName").val("");
												$("#equipmentCnt").val("");
												return;
											}
										}
									}
									
									//이름이 같은 장비가 없다면 새로 만들어서 equipList에 추가해준다.
									var equipDiv = document.createElement("div");
						            var equipName = document.createElement("span");
						            
						            var equipCntName = document.createElement("span");
						            var equipCnt = document.createElement("span");
						            var equipDel = document.createElement("button");
	
						            equipDiv.setAttribute("class", "border rounded m-1");
						            equipDiv.style.padding = "6px";
						            equipDiv.setAttribute("id", "equip"+equipNo);
						            equipDiv.style.display = "inline-block";
	
						            equipName.setAttribute("class", "ml-2 p-1");
						            equipName.setAttribute("id", "equip"+equipNo+"Name");
						            equipName.innerHTML = equipmentName;
						            
						            equipCntName.innerHTML = " / 개수 : ";
	
						            equipCnt.setAttribute("class","p-1");
						            equipCnt.setAttribute("id","equip"+equipNo+"Cnt");
						            equipCnt.innerHTML = equipmentCnt;
	
						            equipDel.setAttribute("onclick","equipmentDel(this)");
						            equipDel.setAttribute("class","btn btn-danger mb-1 ml-2");
						            equipDel.innerHTML = "X";
	
						            equipDiv.appendChild(equipName);
						            equipDiv.appendChild(equipCntName);
						            equipDiv.appendChild(equipCnt);
						            equipDiv.appendChild(equipDel);
	
						            $("#equipmentList").append(equipDiv);
						            $("#equipmentName").val("");
									$("#equipmentCnt").val("");
									equipNo++;
								}
	                            
	                            //추가한 장비를 삭제하기 위한 함수
	                            function equipmentDel(e){
	                            	var equipEle = e.parentNode;
	                            	$(equipEle).remove();
	                            }
	
	                        </script>
	                    </div>
	                </div>
                </form>
                <div class="d-flex justify-content-center mt-5 mb-4">
                	<c:if test="${type eq 'newEnroll'}">
                		<button onclick="submitBtnClick(this)" class="btn btn-outline-info border rounded m-2 p-2" style="font-size: 25px; width: 130px;">등록</button>
	                	<button onclick="cancle()" class="btn btn-outline-dark border rounded m-2 p-2" style="font-size: 25px; width: 130px;">취소</button>
                	</c:if>
                	<c:if test="${type eq 'updateEnroll'}">
                		<button onclick="submitBtnClick(this)" class="btn btn-outline-info border rounded m-2 p-2" style="font-size: 25px; width: 130px;">수정 완료</button>
                		<button onclick="history.back()" class="btn btn-outline-dark border rounded m-2 p-2" style="font-size: 25px; width: 130px;">취소</button>
                		<button class="btn border rounded m-2 p-2 btn-outline-danger" style="font-size: 25px; width: 130px;">삭제</button>
                	</c:if>
                </div>
            </div>
            <div class="col-2"></div>
        </div>
    </section>
    <script>
        function aroundImage(){
            $("#nomalImageBtn").removeClass("btn-info");
            $("#aroundImageBtn").addClass("btn-info");
            $("#nomalImageText").css("display", "none");
            $("#aroundImageText").css("display", "block");
        }

        function nomalImage(){
            $("#aroundImageBtn").removeClass("btn-info");
            $("#nomalImageBtn").addClass("btn-info");
            $("#aroundImageText").css("display", "none");
            $("#nomalImageText").css("display", "block");
        }
        
        function cancle() {
        	$(location).attr("href", "enrollCancle");
		}
        
        function alertShow(){
        	swal({
				title:"입력되지 않은 곳이 존재합니다.",
				text: "모든 정보를 입력해주십시오.",
				icon:"${pageContext.request.contextPath}/resources/images/errorMascot.png"
			});
        }
        
        function submitBtnClick(btn){
        	btn.disabled = true;
        	var form = document.getElementById("frm");
        	
        	console.log(form);
            var formData = new FormData(form);
            
            var errorNum = 0;
            
            if($("#buildingName").val() == ""){
            	$("#buildingName").addClass("error");
            	errorNum = 1;
            }
            if($("#buildingAddr").val() == ""){
            	$("#buildingAddr").addClass("error");
            	$("#buildingAddrDetail").addClass("error");
            	errorNum = 1;
            }
            if($("#buildingTakeoverPrice").val() == ""){
            	$("#buildingTakeoverPrice").addClass("error");
            	errorNum = 1;
            }
            
            if(buildingTradeInfo == "임대"){
            	if($("#buildingDepositPrice").val() == ""){
                	$("#buildingDepositPrice").addClass("error");
                	errorNum = 1;
                }
            	if($("#buildingMonthRent").val() == ""){
                	$("#buildingMonthRent").addClass("error");
                	errorNum = 1;
                }
            }else{
            	if($("#buildingPrice").val() == ""){
                	$("#buildingPrice").addClass("error");
                	errorNum = 1;
                }
            }
            
            if($("#buildingSupplyArea").val() == ""){
            	$("#buildingSupplyArea").addClass("error");
            	errorNum = 1;
            }
            if($("#buildingDedicatedArea").val() == ""){
            	$("#buildingDedicatedArea").addClass("error");
            	errorNum = 1;
            }
            if($("#buildingTotalFloor").val() == ""){
            	$("#buildingTotalFloor").addClass("error");
            	errorNum = 1;
            }
            if($("#buildingFloor").val() == ""){
            	$("#buildingFloor").addClass("error");
            	errorNum = 1;
            }
            
            if(errorNum == 1){
            	alertShow();
            	errorNum = 0;
            	btn.disabled = false;
            	return;
            }
            
            //이미지 첨부파일이 있다면 formData에 담기----------
            if($("#nomalImgPreview").children().length == 0 || $("#nomalImgPreview").children().length == 1){
            	swal({
					title:"이미지를 등록해주십시오.",
					text: "이미지를 최소 2장은 등록해야 합니다.",
					icon:"${pageContext.request.contextPath}/resources/images/errorMascot.png"
					
				});
            	btn.disabled = false;
				return;
            }else{
            	for (var i = 0; i < uploadFiles.length; i++) {
            		
                    // 삭제되지 않은 파일만 폼데이터에 담기
                    if (uploadFiles[i] != "") {
                        formData.append("attach_file", uploadFiles[i]);
                    }
                }
            }
            
            if (uploadAroundFile != "") {
                formData.append("attach_aroundFile", uploadAroundFile);
            }else{
            	formData.append("attach_aroundFile", null);
            }
            //-----------------------------------------
            
            //그외, input태그가 따로 없는 애들은 formData에 append해준다.
            formData.append("buildingTradeInfo", buildingTradeInfo);
            formData.append("buildingLatitude", buildingLat);
            formData.append("buildingLongitude", buildingLng);
            
            //선택한 option도 담아준다.
            var optionList = $(".optionBtn[name='check']").get();
            var optionValueList = [];
            for(option of optionList){
            	optionValueList.push(option.value);
            }
            
            formData.append("optionValueList", optionValueList);
            
            formData.append("type", `${type}`);
            formData.append("updateBuildingNo", `${buildingInfo.buildingNo}`);
            formData.append("buildingRegistDate", `${buildingInfo.buildingRegistDate}`);
            formData.append("buildingLikeCount", `${buildingInfo.buildingLikeCount}`);
            
            //DB상에 존재하는 이미지 파일을 삭제하기 위해 시퀀스들을 저장한 배열을 append한다!
            formData.append("deleteDBImgBySeq",deleteDBImgBySeq);
            
            //만약, 장비 옵션을 선택하였다면 내가 추가한 장비의 데이터도 formData에 담아준다.
            var equipList = [];
            if(optionValueList.indexOf("3") != -1){
            	var tempList = $("#equipmentList").children();
            	if(tempList.length == 0){
            		swal({
    					title:"장비 옵션을 선택했습니다.",
    					text: "가지고 계신 장비 정보를 입력해주세요.",
    					icon:"${pageContext.request.contextPath}/resources/images/errorMascot.png"
    				});
            		btn.disabled = false;
            		return;
            	}else{
            		for(equip of tempList){
            			console.log(equip);
            			var equipId = equip.getAttribute("id");
            			var name = $("#"+equipId + "Name").text();
            			var cnt = $("#"+equipId + "Cnt").text();
            			var equipInfo = '{' + '"name":"' + name + '",' + '"cnt":"'+cnt+'"}';
            			formData.append("equipList", equipInfo);
            		}
            	}
            }
            
            $.ajax({
            	method: 'POST',
            	url:'takeoverEnroll',
            	data:formData,
            	contentType: false,
            	processData:false
            })
            .done((data) => {
            	var message;
            	if(data == 'updateEnroll'){
            		message = "매물 수정이 완료 되었습니다.";
            	}else{
            		message = "매물 등록이 완료 되었습니다.";
            	}
            	swal({
					text: message
				}).then(()=>{
					location.href = document.referrer;
				});
			});
        }
        $('input').keydown(function() {
        	  if (event.keyCode === 13) {
        	    event.preventDefault();
        	  };
       	});
        
        $("input[type='number']").keyup(function(event){
            var inputVal = $(this).val();
            $(this).val(inputVal.replace(/[^0-9]/gi,''));
        });
    </script>
               				
<%@ include file="/WEB-INF/views/common/footer.jsp"%>