<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
   <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=lt1xd5ne5c"></script>
    <script>
        function showPopUp(a){
            var url;
            var name = "test";
            var option;
            if(a.name === 'allImg'){
                url = "<%=request.getContextPath() %>/take/popUpImg?buildingNo=${buildingInfo.buildingNo}";
                option = "width = 900, height = 900, top = 100, left = 200, location = no";
            }else{
               if(`${panoCnt}` == 0){
                  swal({
                     text:"업로드된 360도 사진이 존재하지 않습니다."
                  });
                  return;
               }
                url = "<%=request.getContextPath() %>/take/popUp360Img?buildingNo=${buildingInfo.buildingNo}";
                option = "width = 900, height = 550, top = 100, left = 200, location = no"
            }
            window.open(url, name, option);
        }
        
        $( document ).ready(function() {
           showOption();
           showLikeCount();
           hospitalLocation();
           
           setPrice();
        });
    </script>
    
    <section class="container-fluid" style="flex-grow:1;">
        <div class="row">
            <div class="col-2"></div>
            <div class="col-8">
                <div>
                    <h2 class="mb-5 text-center" style="margin-top:60px;">매물 정보</h2>
                </div>
                <div>
                    <div class="col-12 row d-flex justify-content-center" style="padding-right: 0;">
                        <div class="col-6 d-flex justify-content-center row-cols-sm-1">
                            <img class="border" style="border-radius: 10px" width="550px" height="400px" src="getBuildingImage?buildingNo=${buildingInfo.buildingNo}&type=nomal&img=0">
                        </div>
                        <div class="col-6 d-flex justify-content-center row-cols-sm-1">
                            <img class="border" style="border-radius: 10px" width="550px" height="400px" src="getBuildingImage?buildingNo=${buildingInfo.buildingNo}&type=nomal&img=1">
                        </div>
                    </div>
                    <div class="mt-1 mr-4 p-2 float-right">
                            <span><button class="btn btn-outline-secondary border rounded p-2" name="allImg" style="text-decoration: none;" onclick="showPopUp(this)">모든 사진 보기 →</button></span>
                            <span class="ml-1"><button class="btn btn-outline-secondary border rounded p-2" name="360Img" style="text-decoration: none;" onclick="showPopUp(this)">360도 사진 보기 →</button></span>
                    </div>
                </div>
                <div class="ml-2" style="margin-top: 100px;">
                    <div class="mt-5">
                        <span class="mt-5" style="font-size: 30px;">${buildingInfo.buildingName}</span>
                        <span class="mr-4 mt-2 float-right" style="font-size: 20px;">건물 번호 : ${buildingInfo.buildingNo}</span>
                    </div>
                    <div class="mt-1">
                        <span style="font-size: 23px;">작성자 : ${buildingInfo.buildingWriter}</span>
                        <span class="mr-4 float-right" style="font-size: 20px;">작성 일자 : <fmt:formatDate value="${buildingInfo.buildingRegistDate}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
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
                                            <span class="font-weight-bold">주차</span>
                                        </div>
                                        <div class="mb-5" style="font-size: 20px;">
                                            <span class="font-weight-bold">해당층 / 전체층</span>
                                        </div>
                                        <div class="mb-5" style="font-size: 20px;">
                                            <span class="font-weight-bold">전용/공급 면적(평)</span>
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
                                            <span id="takeoverPrice" class="ml-5"></span>
                                            <span> 원</span>
                                        </div>
                                        <div class="mb-5 ml-5" style="font-size: 20px;">
                                            <c:if test="${buildingInfo.buildingTradeInfo eq '임대'}">
                                            	<span id="depositPrice">
                                               		${buildingInfo.buildingDepositPrice}
                                           		</span>
                                           		<span style="font-size: 20px;"> 원</span>
                                           		<span style="font-size: 20px;"> / </span>
                                           		<span id="monthPrice" style="font-size: 20px;"></span>
                                           		<span style="font-size: 20px;">원</span>
                                            </c:if>
                                            <c:if test="${buildingInfo.buildingTradeInfo eq '매매'}">
                                            	<span id="buildingPrice" style="font-size: 20px;"></span>
                                           		<span style="font-size: 20px;"> 원</span>
                                            </c:if>
                                        </div>
                                        <div class="mb-5" style="font-size: 20px;">
                                            <span id="car" class="ml-5"></span>
                                        </div>
                                        <div class="mb-5" style="font-size: 20px;">
                                            <span class="ml-5">${buildingInfo.buildingFloor}층 / ${buildingInfo.buildingTotalFloor}층</span>
                                        </div>
                                        <div class="mb-5" style="font-size: 20px;">
                                            <span class="ml-5">${buildingInfo.buildingDedicatedArea} / ${buildingInfo.buildingSupplyArea}</span>
                                        </div>
                                        <div class="mb-5" style="font-size: 20px;">
                                            <span id="ele" class="ml-5"></span>
                                        </div>
                                        <div class="mb-5" style="font-size: 20px;">
                                           <span class="ml-5">
                                              <fmt:formatDate value="${buildingInfo.buildingAvailableDate}" pattern="yyyy-MM-dd" />
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="mb-4 font-weight-bold" style="font-size: 23px;">
                                옵션
                            </div>
                            <div id="optionList" class="d-flex mb-5">
                            </div>
                            <c:forTokens var="option" items="${buildingInfo.buildingOption}" delims=",">
                               <c:if test="${option eq '3'}">
                                  <div class="mb-4 font-weight-bold" style="font-size: 23px;">
                                      장비 목록
                                  </div>
                               </c:if>
                            </c:forTokens>
                            <div class="mb-3" class="mb-1">
                               <c:forEach var="equip" items="${equipments}">
                                  <div class="p-2 m-2" style="font-size: 18px; border: 2px solid; color: rgb(42, 110, 211); border-radius: 7px; border-color: rgb(42, 110, 211); display:inline-block;">
                                       ${equip.equipmentName} : ${equip.equipmentCount} 개
                                   </div>
                               </c:forEach>
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
                                          <div class="col-4">
                                             <div class="mb-2" style="font-size: 23px;">인수</div>
                                             <c:if test="${buildingInfo.buildingTradeInfo eq '임대'}">
                                                <div style="font-size: 23px;">보증금 / 월세</div>
                                             </c:if>
                                             <c:if test="${buildingInfo.buildingTradeInfo eq '매매'}">
                                                <div style="font-size: 23px;">매매가</div>
                                   			 </c:if>
                                          </div>
                                          <div class="col-7">
                                             <div class="mb-3">
                                                <span id="takeoverPriceQuick" class="ml-2" style="font-size: 20px;"></span>
                                                <span style="font-size: 20px;">원</span>
                                             </div>
                                             <div class="mt-2">
                                             	<c:if test="${buildingInfo.buildingTradeInfo eq '임대'}">
                                                   <span class="ml-2" style="font-size: 20px;" id="depositPriceQuick"></span>
                                                   <span style="font-size: 20px;"> 원</span>
                                                   <span style="font-size: 20px;"> / </span>
                                                   <span style="font-size: 20px;" id="monthPriceQuick"></span>
                                                   <span style="font-size: 20px;">원</span>
                                             	</c:if>
                                             	<c:if test="${buildingInfo.buildingTradeInfo eq '매매'}">
                                           			<span id="buildingPriceQuick" class="ml-2" style="font-size: 20px;"><span>
                                               		<span style="font-size: 20px;"> 원</span>
                                             	</c:if>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                    
                                    <div class="container-fluid mt-2">
                                        <div class="row">
                                            <div class="col-4 p-1 m-2 d-flex">
                                                <span><img src="${pageContext.request.contextPath}/resources/images/miniElevator.png" /></span>
                                                <span style="font-size: 23px; margin-left: 15px;">${buildingInfo.buildingFloor} 층</span>
                                            </div>
                                            <div class="col-5 p-1 m-2 d-flex">
                                                <span><img src="${pageContext.request.contextPath}/resources/images/miniRul.png"/></span>
                                                <span style="font-size: 23px; margin-left: 15px;">${buildingInfo.buildingDedicatedArea} / ${buildingInfo.buildingSupplyArea}</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="container-fluid mt-2 mb-2">
                                        <div class="row">
                                            <div class="col-4 p-1 m-2 d-flex">
                                                <span><img src="${pageContext.request.contextPath}/resources/images/miniCar.png" /></span>
                                                <span id="car" style="font-size: 23px; margin-left: 15px;"></span>
                                            </div>
                                            <div class="col-5 p-1 m-2 d-flex">
                                                <span><img src="${pageContext.request.contextPath}/resources/images/miniEquip.png" /></span>
                                                <span id="equipCheck" style="font-size: 23px; margin-left: 15px;"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="container-fluid mt-4 mb-4">
                                        <div class="row align-content-center">
                                            <div class="col-6 p-1 m-1">
                                                <a href="#" onclick="openMsgForm('${buildingInfo.buildingWriter}')" class="btn border p-3 text-center" style="width:100%; background-color: rgb(242, 101, 45); color: white; font-size: 30px; border-radius: 8px; cursor: pointer;">문의 하기</a>
                                            </div>
                                            <div class="col-4 p-1 m-1">
                                                <button class="btn btn-outline-dark ml-3 p-3" style="width:100%; font-size: 30px;" onclick="likeBtnClick(this);">
                                                   <img id="interImg" class="mr-2" src="" width="30px;"/>
                                                   <span id="interCnt">${buildingInfo.buildingLikeCount}</span>
                                                  </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="d-flex">
                    <div class="flex-grow-1 m-2">
                        <div class="mb-4 mt-5 font-weight-bold" style="font-size: 23px;">
                           상세 설명
                       </div>
                        <textarea class="p-2 mb-5" style="border-radius: 10px; resize:none; width:100%; height: 300px; font-size: 20px;" maxlength="500" color: rgb(97, 97, 100); disabled="disabled">${buildingInfo.buildingDetailContent}</textarea>
                     </div>
                     <div class="flex-grow-1 m-2">
                        <div class="mb-4 mt-5 font-weight-bold" style="font-size: 23px;">
                           지도 위치
                       </div>
                       <div>
                          <div id="map" class="p-2 mb-5" style="border-radius: 10px; width:100%;height:300px; border: 1px solid rgb(192, 191, 191); padding: 50px;" onchange="getMarkers()"></div>
                       </div>
                     </div>
                  </div>
                <div class="d-flex justify-content-center mt-4 mb-4">
                   <c:if test="${sessionUserId eq buildingInfo.buildingWriter}">
                      <a href="enroll?type=updateEnroll&buildingNo=${buildingInfo.buildingNo}" class="btn btn-outline-primary border rounded m-2 p-2" style="font-size: 25px; width: 130px;">수정</a>
                   </c:if>
                    <c:if test="${from ne 'mypage'}">
                  <button onclick="viewCancle()" class="btn btn-outline-info border rounded m-2 p-2" style="font-size: 25px; width: 130px;">목록</button>
               </c:if>
               <c:if test="${from eq 'mypage'}">
                  <a href="/mypage/myboard/building?pageNo=${pageNo}" class="btn border rounded m-2 p-2" style="font-size: 25px; width: 130px;">목록</a>
               </c:if>
               <c:if test="${sessionUserId eq buildingInfo.buildingWriter}">
                  <a onclick="deleteBuilding()" class="btn btn-outline-danger border rounded m-2 p-2" style="font-size: 25px; width: 130px;">삭제</a>
               </c:if>
               <c:if test="${sessionUserId ne buildingInfo.buildingWriter}">
                  <a href="/interior/simulator?buildingNo=${buildingInfo.buildingNo}" class="btn btn-outline-dark border rounded m-2 p-2" style="font-size: 25px;">인테리어 만들기</a>
               </c:if>
                    
                </div>
            </div>
            <div class="col-2"></div>
        </div>
    </section>
    <script>
      var likeCnt = `${buildingInfo.buildingLikeCount}`;
      
       function hospitalLocation(){
          var lat = ${buildingInfo.buildingLatitude};
          var lon = ${buildingInfo.buildingLongitude};
          
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
          if(receiver == `${sessionUserId}`){
             swal({
                text:"해당 게시물의 작성자입니다! \n 본인한테 메일을 보낼 수 없습니다."
             });
             return;
          }else if(`${sessionUserId}` == ""){
             swal({
                text:"로그인해야 이용할 수 있는 기능입니다. 로그인을 해주세요."
             });
             return;
          }
           var url = "<%=request.getContextPath() %>/messageSend?receiver="+receiver;
           var option = "width = 300, height = 350, top = 100, left = 200, location = no";
           window.open(url, "message", option);
       }
       
       function likeBtnClick(img){
            var path = document.getElementById("interImg").src;
            
            if(`${sessionUserId}` == ""){
             swal({
                text:"로그인해야 이용할 수 있는 기능입니다. 로그인을 해주세요."
             });
             return;
          }
            
         if(path.includes("Before")){ //누르지 않은 상태에서 클릭했을 경우!
            likeCnt++;
               $.ajax({
                  url : "setLikeLists",
                  data : {
                     check:"before",
                     id:`${sessionUserId}`,
                    type:"building",
                    buildingNo:${buildingInfo.buildingNo},
                    likeCnt:likeCnt
                  }
               }).done((data) => {
                 $("#interImg").attr("src", "/resources/images/interestAfter.png");
                 document.getElementById("interCnt").innerHTML = likeCnt;
              });
            } else {//이미 클릭한 상태에서 클릭했을 경우
               likeCnt--;
               $.ajax({
                  url : "setLikeLists",
                  data : {
                     check:"after",
                     id:`${sessionUserId}`,
                    type:"building",
                    buildingNo:${buildingInfo.buildingNo},
                    likeCnt:likeCnt
                  }
               }).done((data) => {
                 $("#interImg").attr("src", "/resources/images/interestBefore.png");
                 document.getElementById("interCnt").innerHTML = likeCnt;
              });
            }
        }
       
       function viewCancle() {
    	   location.href = document.referrer;
      }
       
       function showOption() {
          var optionList = `${buildingInfo.buildingOption}`;
           var optionValue = optionList.split(",");
           console.log(optionValue);
           
           var options = $("#optionList");
           for(o of optionValue){
        	   var span = document.createElement('span');
        	   span.setAttribute('class', 'd-flex justify-content-center');
        	   var tempSpan = '<div class="border rounded p-3 mr-3 text-center" style="width: 100px; height:100px; background-color: rgb(231, 231, 236);">';
        	   tempSpan    += '      <img src="${pageContext.request.contextPath}/resources/images/';
        	   if(o == '1'){
	               tempSpan += 'elevatorImg.png" />';
	               tempSpan += '      <div class="mt-2" style="font-size:13px;">엘리베이터</div>';
	           }else if (o == '2'){
	               tempSpan += 'carImg.png" />';
	               tempSpan += '      <div class="mt-2" style="font-size:13px;">주차 가능</div>';
               }else if(o == '3'){
	               tempSpan += 'equipImg.png" />';
	               tempSpan += '      <div class="mt-2" style="font-size:13px;">장비</div>';
               }else if(o == '4'){
	               tempSpan += 'restroomImg.png" />';
	               tempSpan += '      <div class="mt-2" style="font-size:13px;">화장실</div>';
               }else if(o == '5'){
	               tempSpan += 'cctvImg.png" />';
	               tempSpan += '      <div class="mt-2" style="font-size:13px;">CCTV</div>';
               }else if(o == '6'){
	               tempSpan += 'medi.png" />';
	               tempSpan += '      <div class="mt-2" style="font-size:13px;">주변 약국</div>';
               }
        	   tempSpan    += '</div>';
        	   span.innerHTML =  tempSpan;
        	   options.append(span);
           }
           
           //엘리베이터가 있을 경우, 있다고 텍스트 추가
           if(optionValue.includes("1")){
              $("#ele").text("있음");
           }else{
              $("#ele").text("없음");
           }
           
           //주차장이 있을 경우, 가능하다고 추가!
           if(optionValue.includes("2")){
              $("span#car").text("주차 O");
           }else{
              $("span#car").text("주차 X");
           }
           
           //장비가 있을 경우, 있다고 추가!
           if(optionValue.includes("3")){
              $("span#equipCheck").text("장비 O");
              
           }else{
              $("span#equipCheck").text("장비 X");
           }
      }
       
       function showLikeCount(){
          $.ajax({
             url: "checkLike",
             data:{
                id:`${sessionUserId}`,
                type:"building",
                buildingNo:${buildingInfo.buildingNo}
             }
          }).done((data) => {
             if(data.likeCheck == 'like'){
                $("#interImg").attr("src", "/resources/images/interestAfter.png");
             }else{
                $("#interImg").attr("src", "/resources/images/interestBefore.png");
             }
          });
       }
       
       function deleteBuilding() {
    	   swal("해당 매물을 삭제하시겠습니까?", {
	   			dangerMode: true,
	   			buttons: true,
			}).then((result) => {
	   			if(result == true){
	   				
	   				$.ajax({
	   					method: 'POST',
	   	            	url:'deleteBuilding',
	   	            	data: {buildingNo : `${buildingInfo.buildingNo}`}
	   				}).done((data) => {
	   					if(data == "success"){
	   						swal("삭제되었습니다.", {
	   	   				      	icon: "success",
	   	   				    }).then(()=>{
	   	   				    	location.href = "list";
	   	   				    });
	   					}else{
	   						swal("삭제되지 않았습니다.", {
	   	   				      	icon: "error",
	   	   				    });
	   					}
	   				});
	   				
	   			}else{
	   				swal("삭제가 취소되었습니다.");
	   			}
	   		});
       }
       
       function setPrice() {
    	   //takeoverPrice 설정
    	   var takeoverPrice = `${buildingInfo.buildingTakeoverPrice}`;
    	   if(takeoverPrice >= 10000){
    		   var takePrice = takeoverPrice;
    		   takePrice = takePrice.replace("0", "");
    		   takePrice = takePrice.replace("0", "");
    		   takePrice = takePrice.replace("0", "");
    		   
    		   takePrice2 = takePrice.slice(-1);
    		   
    		   if(takePrice >= 100 && takePrice < 1000){
    			   takePrice = takePrice.slice(0, 2);
               }else if(takePrice < 100){
            	   takePrice = takePrice.slice(0, 1);
               }else{
            	   takePrice = takePrice.slice(0, 3);
               }
    		   
    		   if(takePrice2 == 0){
    			   $("#takeoverPrice").text(takePrice + " 억 ");
        		   $("#takeoverPriceQuick").text(takePrice + " 억");
    		   }else{
    			   $("#takeoverPrice").text(takePrice + " 억 " + takePrice2 + "000 만");
        		   $("#takeoverPriceQuick").text(takePrice + " 억 " + takePrice2 + "000 만");
    		   }
    	   }else{
    		   $("#takeoverPrice").text(takePrice + "만");
    		   $("#takeoverPriceQuick").text(takePrice + "만");
    	   }
    	   
    	   if(`${buildingInfo.buildingTradeInfo}` == '임대'){
    		   var monthPrice = `${buildingInfo.buildingMonthRent}`;
    		   console.log(monthPrice);
    		   
    		   if(monthPrice >= 10000){
        		   var monthPriceVal = monthPrice;
        		   monthPriceVal = monthPriceVal.replace("0", "");
        		   monthPriceVal = monthPriceVal.replace("0", "");
        		   monthPriceVal = monthPriceVal.replace("0", "");
        		   
        		   monthPriceVal2 = monthPriceVal.slice(-1);
        		   
        		   if(monthPriceVal >= 100 && monthPriceVal < 1000){
        			   monthPriceVal = monthPriceVal.slice(0, 2);
                   }else if(monthPriceVal < 100){
                	   monthPriceVal = monthPriceVal.slice(0, 1);
                   }else{
                	   monthPriceVal = monthPriceVal.slice(0, 3);
                   }
        		   
        		   if(monthPriceVal2 == 0){
        			   $("#monthPrice").text(monthPriceVal + " 억");
            		   $("#monthPriceQuick").text(monthPriceVal + " 억");
        		   }else{
        			   $("#monthPrice").text(monthPriceVal + " 억 " + monthPriceVal2 + "000 만");
            		   $("#monthPriceQuick").text(monthPriceVal + " 억 " + monthPriceVal2 + "000 만");
        		   }
        	   }else{
        		   $("#monthPrice").text(monthPrice + "만");
        		   $("#monthPriceQuick").text(monthPrice + "만");
        	   }
    		   
    		   var depositPrice = `${buildingInfo.buildingDepositPrice}`;
    		   
    		   if(depositPrice >= 10000){
        		   var depositPriceVal = depositPrice;
        		   depositPriceVal = depositPriceVal.replace("0", "");
        		   depositPriceVal = depositPriceVal.replace("0", "");
        		   depositPriceVal = depositPriceVal.replace("0", "");
        		   
        		   depositPriceVal2 = depositPriceVal.slice(-1);
        		   
        		   if(depositPriceVal >= 100 && depositPriceVal < 1000){
        			   depositPriceVal = depositPriceVal.slice(0, 2);
                   }else if(depositPriceVal < 100){
                	   depositPriceVal = depositPriceVal.slice(0, 1);
                   }else{
                	   depositPriceVal = depositPriceVal.slice(0, 3);
                   }
        		   
        		   if(depositPriceVal2 == 0){
        			   $("#depositPrice").text(depositPriceVal + " 억");
            		   $("#depositPriceQuick").text(depositPriceVal + " 억");
        		   }else{
        			   $("#depositPrice").text(depositPriceVal + " 억 " + depositPriceVal2 + "000 만");
            		   $("#depositPriceQuick").text(depositPriceVal + " 억 " + depositPriceVal2 + "000 만");
        		   }
        	   }else{
        		   $("#depositPrice").text(depositPrice + "만");
        		   $("#depositPriceQuick").text(depositPrice + "만");
        	   }
    		   
    	   }else{
    		   var buildingPrice = `${buildingInfo.buildingPrice}`;
    		   
    		   if(buildingPrice >= 10000){
        		   var buildingPriceVal = buildingPrice;
        		   buildingPriceVal = buildingPriceVal.replace("0", "");
        		   buildingPriceVal = buildingPriceVal.replace("0", "");
        		   buildingPriceVal = buildingPriceVal.replace("0", "");
        		   
        		   buildingPriceVal2 = buildingPriceVal.slice(-1);
        		   
        		   if(buildingPriceVal >= 100 && buildingPriceVal < 1000){
        			   buildingPriceVal = buildingPriceVal.slice(0, 2);
                   }else if(buildingPriceVal < 100){
                	   buildingPriceVal = buildingPriceVal.slice(0, 1);
                   }else{
                	   buildingPriceVal = buildingPriceVal.slice(0, 3);
                   }
        		   
        		   if(buildingPriceVal2 == 0){
        			   $("#buildingPrice").text(buildingPriceVal + " 억");
            		   $("#buildingPriceQuick").text(buildingPriceVal + " 억");
        		   }else{
        			   $("#buildingPrice").text(buildingPriceVal + " 억 " + buildingPriceVal2 + "000 만");
            		   $("#buildingPriceQuick").text(buildingPriceVal + " 억 " + buildingPriceVal2 + "000 만");
        		   }
        	   }else{
        		   $("#buildingPrice").text(buildingPrice + "만");
        		   $("#buildingPriceQuick").text(buildingPrice + "만");
        	   }
    	   }
	   }
       
       $(window).scroll(function() { 
          var currentPosition = parseInt($("#quickmenu").css("top")); 
          var position = $(window).scrollTop();
          var halfPos = position/4.7;

          if(position < 1300){
        	  if(position < 800){
        		  var tempPos = position/7;
        		  $("#quickmenu").stop().animate({"top":tempPos+"px"},500);
        	  }else{
        		  $("#quickmenu").stop().animate({"top":halfPos+"px"},500);
        	  }
              
          }
       });
    </script>

                           
<%@ include file="/WEB-INF/views/common/footer.jsp"%>