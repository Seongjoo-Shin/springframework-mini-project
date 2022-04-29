<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=lt1xd5ne5c"></script>
    <script>
        function showPopUp(a){
            var url;
            var name = "test";
            var option;
            console.log(a);
            if(a.name === 'allImg'){
                url = "<%=request.getContextPath() %>/take/popUpImg";
                option = "width = 900, height = 900, top = 100, left = 200, location = no";
            }else{
                url = "<%=request.getContextPath() %>/take/popUp360Img";
                option = "width = 900, height = 550, top = 100, left = 200, location = no"
            }
            console.log(url);
            window.open(url, name, option);
        }
        
        $( document ).ready(function() {
        	showOption();
        	
        	hospitalLocation();
        });
    </script>
    
    <section class="container-fluid">
        <div class="row">
            <div class="col-2"></div>
            <div class="col-8">
                <div>
                    <h2 class="mt-5 mb-5 text-center">매물 정보</h2>
                </div>
                <div>
                    <div class="col-12 row d-flex justify-content-center" style="padding-right: 0;">
                        <div class="col-6 d-flex flex-column row-cols-sm-1">
                            <img class="rounded" src="${pageContext.request.contextPath}/resources/images/hosImg1.jpg">
                        </div>
                        <div class="col-6 d-flex flex-column row-cols-sm-1">
                            <img class="rounded" src="${pageContext.request.contextPath}/resources/images/hosImg2.jpg">
                        </div>
                    </div>
                    <div class="mt-1 mr-4 p-2 float-right">
                            <span><button class="btn border rounded p-2" name="allImg" style="text-decoration: none; color:black;" onclick="showPopUp(this)">모든 사진 보기 →</button></span>
                            <span class="ml-1"><button class="btn border rounded p-2" name="360Img" style="text-decoration: none; color:black;" onclick="showPopUp(this)">360도 사진 보기 →</button></span>
                    </div>
                </div>
                <div class="ml-2" style="margin-top: 100px;">
                    <div class="mt-5">
                        <span class="mt-5" style="font-size: 30px;">${buildingInfo.buildingName}</span>
                        <span class="mr-4 mt-2 float-right" style="font-size: 20px;">건물 번호 : ${buildingInfo.buildingNo}</span>
                    </div>
                    <div class="mt-1">
                        <span style="font-size: 23px;">작성자 : ${buildingInfo.buildingWriter}</span>
                        <span class="mr-4 float-right" style="font-size: 20px;">작성 일자 : ${buildingInfo.buildingRegistDate}</span>
                    </div>
                </div>

                <div class="mt-5 container-fluid">
                    <div class="row">
                        <div class="col-7">
                            <div class="mb-3 font-weight-bold" style="font-size: 23px;">
                                상세 정보
                            </div>
                            <hr/>
                            <div class="container-fluid p-0">
                                <div class="row">
                                    <div class="col-4">
                                        <div class="mb-5" style="font-size: 20px;">
                                            <span class="font-weight-bold">인수</span>
                                        </div>
                                        <div class="mb-5" style="font-size: 20px;">
                                            <span class="font-weight-bold">
                                            	<c:if test="${buildingInfo.buildingTradeInfo eq '임대'}">
                                            		보증금 / 월세
                                            	</c:if>
                                            	<c:if test="${buildingInfo.buildingTradeInfo eq '매매'}">
                                            		매매가
                                            	</c:if>
                                            </span>
                                        </div>
                                        <div class="mb-5" style="font-size: 20px;">
                                            <span class="font-weight-bold">관리비</span>
                                        </div>
                                        <div class="mb-5" style="font-size: 20px;">
                                            <span class="font-weight-bold">주차</span>
                                        </div>
                                        <div class="mb-5" style="font-size: 20px;">
                                            <span class="font-weight-bold">해당층 / 전체층</span>
                                        </div>
                                        <div class="mb-5" style="font-size: 20px;">
                                            <span class="font-weight-bold">전용/공급 면적</span>
                                        </div>
                                        <div class="mb-5" style="font-size: 20px;">
                                            <span class="font-weight-bold">엘리베이터</span>
                                        </div>
                                        <div class="mb-5" style="font-size: 20px;">
                                            <span class="font-weight-bold">입주 가능일</span>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="mb-5" style="font-size: 20px;">
                                            <span class="ml-5">${buildingInfo.buildingTakeoverPrice} 만원</span>
                                        </div>
                                        <div class="mb-5" style="font-size: 20px;">
                                            <span class="ml-5">
                                            	<c:if test="${buildingInfo.buildingTradeInfo eq '임대'}">
                                            		${buildingInfo.buildingDepositPrice} / ${buildingInfo.buildingMonthRent} 만원
                                            	</c:if>
                                            	<c:if test="${buildingInfo.buildingTradeInfo eq '매매'}">
                                            		${buildingInfo.buildingPrice} 만원
                                            	</c:if>
                                            </span>
                                        </div>
                                        <div class="mb-5" style="font-size: 20px;">
                                            <span class="ml-5">${buildingInfo.buildingTakeoverPrice} 만원</span>
                                        </div>
                                        <div class="mb-5" style="font-size: 20px;">
                                            <span class="ml-5">
                                            	<c:forTokens var="option" items="${buildingInfo.buildingOption}" delims=",">
                                            		<c:if test="${option eq '2'}">
                                            			주차 가능
                                            		</c:if>
                                            	</c:forTokens>
                                            </span>
                                        </div>
                                        <div class="mb-5" style="font-size: 20px;">
                                            <span class="ml-5">${buildingInfo.buildingFloor}층 / ${buildingInfo.buildingTotalFloor}층</span>
                                        </div>
                                        <div class="mb-5" style="font-size: 20px;">
                                            <span class="ml-5">${buildingInfo.buildingDedicatedArea} / ${buildingInfo.buildingSupplyArea}</span>
                                        </div>
                                        <div class="mb-5" style="font-size: 20px;">
                                            <span class="ml-5">
                                            	<c:forTokens var="option" items="${buildingInfo.buildingOption}" delims=",">
                                            		<c:if test="${option eq '1'}">
                                            			있음
                                            		</c:if>
                                            	</c:forTokens>
                                            </span>
                                        </div>
                                        <div class="mb-5" style="font-size: 20px;">
                                            <span class="ml-5">${buildingInfo.buildingAvailableDate}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="mb-4 font-weight-bold" style="font-size: 23px;">
                                옵션
                            </div>
                            <div id="optionList" class="d-flex mb-2">
                            </div>
                            
                            <div class="mb-4 mt-5 font-weight-bold" style="font-size: 23px;">
                                상세 설명
                            </div>
                           	<textarea class="p-2 mb-5" style="border-radius: 10px; resize:none; width:100%; height: 300px; font-size: 20px;" maxlength="500" color: rgb(97, 97, 100); disabled="disabled">상세 설명칸 입니다!</textarea>
                            <div class="mb-4 font-weight-bold" style="font-size: 23px;">
                                지도 위치
                            </div>
                            <div>
                            	<div id="map" class="mr-4 mt-3" style="width:100%;height:400px; border: 1px solid rgb(192, 191, 191); padding: 50px;" onchange="getMarkers()"></div>
                            </div>
                        </div>
                        <div id="quickmenu" class="col-5">
                            <div id="box" class="border shadow w-100 float-right">
                                <div class="border text-center p-1 m-2 mb-5" style="width: 130px;">
                                    건물번호 - ${buildingInfo.buildingNo}
                                </div>
                                <div class="ml-3">
                                    <div class="p-1 m-2">
                                        <h3>${buildingInfo.buildingName}</h3>
                                    </div>
                                    <div class="p-1 m-2">
                                    	${buildingInfo.buildingAddr} ${buildingInfo.buildingAddrDetail}
                                    </div>
                                    
                                    <div class="p-1 m-2 container-fluid">
                                    	<div class="row">
                                    		<div class="col-4 mb-2">
                                    			<div style="font-size: 23px;">인수</div>
                                    			<c:if test="${buildingInfo.buildingTradeInfo eq '임대'}">
		                                       		<div style="font-size: 23px;">보증금 / 월세</div>
	                                          	</c:if>
	                                          	<c:if test="${buildingInfo.buildingTradeInfo eq '매매'}">
	                                          		<div style="font-size: 23px;">매매가</div>
		                                       	</c:if>
	                                    		</div>
                                    		<div class="col-7">
                                    			<div>
                                    				<div class="ml-5" style="font-size: 23px;">
		                                       			${buildingInfo.buildingTakeoverPrice} 만원
		                                       		</div>
                                    			</div>
                                    			<c:if test="${buildingInfo.buildingTradeInfo eq '임대'}">
		                                       		<span class="ml-5" style="font-size: 23px;">
		                                       			${buildingInfo.buildingDepositPrice} / ${buildingInfo.buildingMonthRent} 만원
		                                       		</span>
	                                          	</c:if>
	                                          	<c:if test="${buildingInfo.buildingTradeInfo eq '매매'}">
		                                       		<span class="ml-5 " style="font-size: 23px;"><span>
		                                       			${buildingInfo.buildingPrice} 만원
		                                       		</span>
		                                       	</c:if>
                                    		</div>
                                    	</div>
                                    </div>
                                    
                                    <div class="container-fluid mt-2">
                                        <div class="row">
                                            <div class="col-4 p-1 m-2 d-flex">
                                                <span><img src="${pageContext.request.contextPath}/resources/images/elevatorImg.png" width="37px" /></span>
                                                <span style="font-size: 23px; margin-top: 8px; margin-left: 15px;">6층</span>
                                            </div>
                                            <div class="col-5 p-1 m-2 d-flex">
                                                <span><img src="${pageContext.request.contextPath}/resources/images/areaImg.png" width="37px" /></span>
                                                <span style="font-size: 23px; margin-top: 8px; margin-left: 15px;">24.88㎡</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="container-fluid mt-2 mb-2">
                                        <div class="row">
                                            <div class="col-4 p-1 m-2 d-flex">
                                                <span><img src="${pageContext.request.contextPath}/resources/images/carImg1.png" width="37px" /></span>
                                                <span style="font-size: 23px; margin-left: 15px;">6층</span>
                                            </div>
                                            <div class="col-5 p-1 m-2 d-flex">
                                                <span><img src="${pageContext.request.contextPath}/resources/images/equipImg.png" width="35px" /></span>
                                                <span style="font-size: 23px; margin-left: 15px;">장비O</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="container-fluid mt-4 mb-4">
                                        <div class="row align-content-center">
                                            <div class="col-6 p-1 m-1">
                                                <button onclick="openMsgForm('${buildingInfo.buildingWriter}')" class="btn border p-3 text-center" style="width:100%; background-color: rgb(242, 101, 45); color: white; font-size: 30px; border-radius: 8px; cursor: pointer;">문의 하기</button>
                                            </div>
                                            <div class="col-4 p-1 m-1">
                                                <button class="btn btn-outline-dark ml-3 p-3" style="width:100%; font-size: 30px;" onclick="changeImg(this);">
                                                	<img id="interImg" class="mr-2" src="/resources/images/interestBefore.png" width="30px;"/>
                                                	<span id="interCnt">12</span>
                                               	</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="d-flex justify-content-center mt-5 mb-4">
                	<c:if test="${sessionUserId eq buildingInfo.buildingWriter}">
                		<button class="btn btn-info border rounded m-2 p-2" style="font-size: 25px; width: 130px;">수정</button>
                	</c:if>
                    <c:if test="${from ne 'mypage'}">
						<button onclick="viewCancle()" class="btn border rounded m-2 p-2" style="font-size: 25px; width: 130px;">목록</button>
					</c:if>
					<c:if test="${from eq 'mypage'}">
						<a href="/mypage/myboard/building?pageNo=${pageNo}" class="btn border rounded m-2 p-2" style="width:100px;">목록</a>
					</c:if>
					<c:if test="${sessionUserId eq buildingInfo.buildingWriter}">
						<button class="btn border rounded m-2 p-2 btn-danger" style="font-size: 25px; width: 130px;">삭제</button>
					</c:if>
                    
                </div>
            </div>
            <div class="col-2"></div>
        </div>
    </section>
    <script>
    
    	function hospitalLocation(){
    		var lat = '37.494802';
    		var lon = '127.122287';
    		
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
    	}
    	
	    function openMsgForm(receiver){
	        var url = "<%=request.getContextPath() %>/messageSend?receiver="+receiver;
	        var option = "width = 300, height = 350, top = 100, left = 200, location = no";
	        window.open(url, "message", option);
	    }
	    
	    function changeImg(img){
            var path = document.getElementById("interImg").src;
            var cntInter = document.getElementById("interCnt").innerHTML;

            if(path.includes("Before")){
                $("#interImg").attr("src", "/resources/images/interestAfter.png");
                document.getElementById("interCnt").innerHTML = Number(cntInter) + 1;
            } else {
                $("#interImg").attr("src", "/resources/images/interestBefore.png");
                document.getElementById("interCnt").innerHTML = Number(cntInter) - 1;
            }
        }
	    
	    function interestBtnClick(m) {
	    	var state = $(m).attr("name");
	    	if(state == "off"){
	    		var temp = $("#interestText").text();
		    	temp++;
	    		$("#interestText").html(temp);
	    		$("#interestText").attr("name", "on");
	    		$("#interestImg").attr("src", "${pageContext.request.contextPath}/resources/images/interestBtn1.png");
	    	}else{
	    		var temp = $("#interestText").text();
		    	temp--;
	    		$("#interestText").html(temp);
	    		$("#interestText").attr("name", "off");
	    		$("#interestImg").attr("src", "${pageContext.request.contextPath}/resources/images/interestBtn2.png");
	    	}
		}
	    
	    function viewCancle() {
	    	$(location).attr("href", "list");
		}
	    
	    function showOption() {
	    	var optionList = `${buildingInfo.buildingOption}`;
        	var optionValue = optionList.split(",");
        	console.log(optionValue);
        	
        	var options = $("#optionList");
        	for(o of optionValue){
        		
        		var span = document.createElement('span');
        		span.setAttribute('class', 'd-flex justify-content-center');
        		var tempSpan = '<div class="border rounded p-3 mr-3 text-center" style="width: 120px; height:120px; background-color: rgb(231, 231, 236);">';
        		tempSpan 	+= '		<img width="40px" src="${pageContext.request.contextPath}/resources/images/';
				if(o == '1'){
					tempSpan += 'elevatorImg.png" />';
					tempSpan += '		<div class="mt-2">엘리베이터</div>';
        		}else if (o == '2'){
        			tempSpan += 'carImg.png" />';
        			tempSpan += '		<div class="mt-2">주차 가능</div>';
        		}else if(o == '3'){
        			tempSpan += 'equipImg.png" />';
        			tempSpan += '		<div class="mt-2">장비</div>';
        		}else if(o == '4'){
        			tempSpan += 'restroomImg.png" />';
        			tempSpan += '		<div class="mt-2">화장실</div>';
        		}else if(o == '5'){
        			tempSpan += 'cctvImg.png" />';
        			tempSpan += '		<div class="mt-2">CCTV</div>';
        		}else if(o == '6'){
        			tempSpan += 'medicine.png" />';
        			tempSpan += '		<div class="mt-2">주변 약국</div>';
        		}
				tempSpan 	+= '</div>';
        		
				span.innerHTML =  tempSpan;
    			options.append(span);
        	}
		}
	    
	    $(window).scroll(function() { 
    		var currentPosition = parseInt($("#quickmenu").css("top")); 
    		var position = $(window).scrollTop(); 
    		var halfPos = position/3;
    		
    		console.log("position : " + position);
    		console.log("halfPos : " + halfPos);

    		if(position < 1000){
   				$("#quickmenu").stop().animate({"top":halfPos+"px"},600);
    		}
    		
   		});
    </script>

               				
<%@ include file="/WEB-INF/views/common/footer.jsp"%>