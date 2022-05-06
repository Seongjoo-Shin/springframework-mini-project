<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script>
	var bed1ImageName="${pageContext.request.contextPath}/resources/images/interior/bed/treatmentBed1.png";
	var bed1CheckedImageName="${pageContext.request.contextPath}/resources/images/interior/bed/checkedTreatmentBed1.png";
	
	var bed2ImageName="${pageContext.request.contextPath}/resources/images/interior/bed/treatmentBed2.png";
	var bed2CheckedImageName="${pageContext.request.contextPath}/resources/images/interior/bed/checkedTreatmentBed2.png";
	
	var bed3ImageName="${pageContext.request.contextPath}/resources/images/interior/bed/treatmentBed3.png";
	var bed3CheckedImageName="${pageContext.request.contextPath}/resources/images/interior/bed/checkedTreatmentBed3.png";
	
	var chair1ImageName="${pageContext.request.contextPath}/resources/images/interior/chair/chair1.jpg";
	var chair1CheckedImageName="${pageContext.request.contextPath}/resources/images/interior/chair/checkedChair1.jpg";
	
	var chair2ImageName="${pageContext.request.contextPath}/resources/images/interior/chair/chair2.jpg";
	var chair2CheckedImageName="${pageContext.request.contextPath}/resources/images/interior/chair/checkedChair2.jpg";
	
	var chair3ImageName="${pageContext.request.contextPath}/resources/images/interior/chair/chair3.jpg";
	var chair3CheckedImageName="${pageContext.request.contextPath}/resources/images/interior/chair/checkedChair3.jpg";
	
	var sofa1ImageName="${pageContext.request.contextPath}/resources/images/interior/sofa/sofa1.jpg";
	var sofa1CheckedImageName="${pageContext.request.contextPath}/resources/images/interior/sofa/checkedSofa1.jpg";
	
	var sofa2ImageName="${pageContext.request.contextPath}/resources/images/interior/sofa/sofa2.jpg";
	var sofa2CheckedImageName="${pageContext.request.contextPath}/resources/images/interior/sofa/checkedSofa2.jpg";
	
	var sofa3ImageName="${pageContext.request.contextPath}/resources/images/interior/sofa/sofa3.png";
	var sofa3CheckedImageName="${pageContext.request.contextPath}/resources/images/interior/sofa/checkedSofa3.png";
	
	function checkImg(imgName){
		if(imgName == bed1ImageName){
			$('#bed1').attr("src", bed1CheckedImageName);
	 		$('#bed2').attr("src", bed2ImageName);
	 		$('#bed3').attr("src", bed3ImageName);
	 		$('#chair1').attr('src', chair1ImageName);
			$('#chair2').attr("src", chair2ImageName);
	 		$('#chair3').attr("src", chair3ImageName);
	 		$('#sofa1').attr('src', sofa1ImageName);
			$('#sofa2').attr("src", sofa2ImageName);
	 		$('#sofa3').attr("src", sofa3ImageName);
			
			$('#bedDetailimage').attr('src', imgName);
			$('#bedinteriorName').text('치과베드 A타입');
			$('#bedinteriorPrice').text('960000');
			
			$('#bed1Div').css('display','inline-block');
			$('#sofa1Div').css('display','none');
			$('#chair1Div').css('display','none');
			
		} else if(imgName == bed1CheckedImageName){
			$('#bed1').attr('src',bed1ImageName);
			$('#bed1Div').css('display','none');
		} else if(imgName == bed2ImageName){
			$('#bed2').attr("src", bed2CheckedImageName);
	 		$('#bed1').attr("src", bed1ImageName);
	 		$('#bed3').attr("src", bed3ImageName);
	 		$('#chair1').attr('src', chair1ImageName);
			$('#chair2').attr("src", chair2ImageName);
	 		$('#chair3').attr("src", chair3ImageName);
	 		$('#sofa1').attr('src', sofa1ImageName);
			$('#sofa2').attr("src", sofa2ImageName);
	 		$('#sofa3').attr("src", sofa3ImageName);
	 		
			
			$('#bedDetailimage').attr('src', imgName);
			$('#bedinteriorName').text('치과베드 B타입');
			$('#bedinteriorPrice').text('720000');
			
			$('#bed1Div').css('display','inline-block');
			$('#sofa1Div').css('display','none');
			$('#chair1Div').css('display','none');
			
		} else if(imgName == bed2CheckedImageName){
			$('#bed2').attr('src', bed2ImageName);
			$('#bed1Div').css('display','none');
		} else if(imgName == bed3ImageName){
			$('#bed3').attr("src", bed3CheckedImageName);
	 		$('#bed1').attr("src", bed1ImageName);
	 		$('#bed2').attr("src", bed2ImageName);
	 		$('#chair1').attr('src', chair1ImageName);
			$('#chair2').attr("src", chair2ImageName);
	 		$('#chair3').attr("src", chair3ImageName);
	 		$('#sofa1').attr('src', sofa1ImageName);
			$('#sofa2').attr("src", sofa2ImageName);
	 		$('#sofa3').attr("src", sofa3ImageName);
	 		
	 		$('#bedDetailimage').attr('src', imgName);
			$('#bedinteriorName').text('치과베드 C타입');
			$('#bedinteriorPrice').text('1200000');
			
			$('#bed1Div').css('display','inline-block');
			$('#sofa1Div').css('display','none');
			$('#chair1Div').css('display','none');
			
		} else if(imgName == bed3CheckedImageName){
			$('#bed3').attr('src', bed3ImageName);
			$('#bed1Div').css('display','none');
			//--------------------------------------------------------------------------------------------------------------------
		} else if(imgName == chair1ImageName){
			$('#chair1').attr('src', chair1CheckedImageName);
			$('#chair2').attr("src", chair2ImageName);
	 		$('#chair3').attr("src", chair3ImageName);
			$('#bed1').attr("src", bed1ImageName);
	 		$('#bed2').attr("src", bed2ImageName);
	 		$('#bed3').attr("src", bed3ImageName);
	 		$('#sofa1').attr('src', sofa1ImageName);
			$('#sofa2').attr("src", sofa2ImageName);
	 		$('#sofa3').attr("src", sofa3ImageName);
	 		
	 		
	 		$('#chairDetailimage').attr('src', imgName);
			$('#chairinteriorName').text('의자 A타입');
			$('#chairinteriorPrice').text('210000');
			
			$('#chair1Div').css('display','inline-block');
			$('#bed1Div').css('display','none');
			$('#sofa1Div').css('display','none');
		} else if(imgName == chair1CheckedImageName){
			$('#chair1').attr('src', chair1ImageName);
			$('#chair1Div').css('display','none');
		} else if(imgName == chair2ImageName){
			$('#chair2').attr('src', chair2CheckedImageName);
			$('#chair1').attr("src", chair1ImageName);
	 		$('#chair3').attr("src", chair3ImageName);
	 		$('#bed1').attr("src", bed1ImageName);
	 		$('#bed2').attr("src", bed2ImageName);
	 		$('#bed3').attr("src", bed3ImageName);
	 		$('#sofa1').attr('src', sofa1ImageName);
			$('#sofa2').attr("src", sofa2ImageName);
	 		$('#sofa3').attr("src", sofa3ImageName);
	 		
	 		$('#chairDetailimage').attr('src', imgName);
			$('#chairinteriorName').text('의자 B타입');
			$('#chairinteriorPrice').text('270000');
			
			$('#chair1Div').css('display','inline-block');
			$('#bed1Div').css('display','none');
			$('#sofa1Div').css('display','none');
		} else if(imgName == chair2CheckedImageName){
			$('#chair2').attr('src', chair2ImageName);
			$('#chair1Div').css('display','none');
		} else if(imgName == chair3ImageName){
			$('#chair3').attr('src', chair3CheckedImageName);
			$('#chair1').attr("src", chair1ImageName);
	 		$('#chair2').attr("src", chair2ImageName);
	 		$('#bed1').attr("src", bed1ImageName);
	 		$('#bed2').attr("src", bed2ImageName);
	 		$('#bed3').attr("src", bed3ImageName);
	 		$('#sofa1').attr('src', sofa1ImageName);
			$('#sofa2').attr("src", sofa2ImageName);
	 		$('#sofa3').attr("src", sofa3ImageName);
	 		
	 		$('#chairDetailimage').attr('src', imgName);
			$('#chairinteriorName').text('의자 C타입');
			$('#chairinteriorPrice').text('170000');
			
			$('#chair1Div').css('display','inline-block');
			$('#bed1Div').css('display','none');
			$('#sofa1Div').css('display','none');
		} else if(imgName == chair3CheckedImageName){
			$('#chair3').attr('src', chair3ImageName);
			$('#chair1Div').css('display','none');
			//--------------------------------------------------------------------------------------------------------------------
		} else if(imgName == sofa1ImageName){
			$('#sofa1').attr('src', sofa1CheckedImageName);
			$('#sofa2').attr("src", sofa2ImageName);
	 		$('#sofa3').attr("src", sofa3ImageName);
			$('#chair1').attr("src", chair1ImageName);
	 		$('#chair2').attr("src", chair2ImageName);
	 		$('#chair3').attr('src', chair3ImageName);
	 		$('#bed1').attr("src", bed1ImageName);
	 		$('#bed2').attr("src", bed2ImageName);
	 		$('#bed3').attr("src", bed3ImageName);
	 		
	 		$('#sofaDetailimage').attr('src', imgName);
			$('#sofainteriorName').text('쇼파 A타입');
			$('#sofainteriorPrice').text('240000');
			
			$('#sofa1Div').css('display','inline-block');
			$('#bed1Div').css('display','none');
			$('#chair1Div').css('display','none');
		} else if(imgName == sofa1CheckedImageName){
			$('#sofa1').attr("src", sofa1ImageName);
			$('#sofa1Div').css('display','none');
		} else if(imgName == sofa2ImageName){
			$('#sofa2').attr('src', sofa2CheckedImageName);
			$('#sofa1').attr("src", sofa1ImageName);
	 		$('#sofa3').attr("src", sofa3ImageName);
	 		$('#chair1').attr("src", chair1ImageName);
	 		$('#chair2').attr("src", chair2ImageName);
	 		$('#chair3').attr('src', chair3ImageName);
	 		$('#bed1').attr("src", bed1ImageName);
	 		$('#bed2').attr("src", bed2ImageName);
	 		$('#bed3').attr("src", bed3ImageName);
	 		
	 		$('#sofaDetailimage').attr('src', imgName);
			$('#sofainteriorName').text('쇼파 B타입');
			$('#sofainteriorPrice').text('240000');
			
			$('#sofa1Div').css('display','inline-block');
			$('#bed1Div').css('display','none');
			$('#chair1Div').css('display','none');
		} else if(imgName == sofa2CheckedImageName){
			$('#sofa2').attr("src", sofa2ImageName);
			$('#sofa1Div').css('display','none');
		} else if(imgName == sofa3ImageName){
			$('#sofa3').attr('src', sofa3CheckedImageName);
			$('#sofa1').attr("src", sofa1ImageName);
	 		$('#sofa2').attr("src", sofa2ImageName);
	 		$('#chair1').attr("src", chair1ImageName);
	 		$('#chair2').attr("src", chair2ImageName);
	 		$('#chair3').attr('src', chair3ImageName);
	 		$('#bed1').attr("src", bed1ImageName);
	 		$('#bed2').attr("src", bed2ImageName);
	 		$('#bed3').attr("src", bed3ImageName);
	 		
	 		$('#sofaDetailimage').attr('src', imgName);
			$('#sofainteriorName').text('쇼파 C타입');
			$('#sofainteriorPrice').text('320000');
			
			$('#sofa1Div').css('display','inline-block');
			$('#bed1Div').css('display','none');
			$('#chair1Div').css('display','none');
		} else if(imgName == sofa3CheckedImageName){
			$('#sofa3').attr("src", sofa3ImageName);
			$('#sofa1Div').css('display','none');
		}
		
	}
	
	function addWishList(addName, addPrice, addPictureName, nowBuildingNo, itemCount){
		var interiorName = addName;
		console.log(interiorName);
		var interiorPrice = addPrice;
		console.log(interiorPrice);
		var pictureName = addPictureName;
		console.log(pictureName);
		var buildingNo = nowBuildingNo;
		console.log(buildingNo);
		var count = itemCount;
		console.log(count);
		$.ajax({
				url: "/interior/addWishList",
				data: {interiorName,interiorPrice,pictureName, buildingNo, count},
				method:"post"
			})
			.done((data)=>{
				console.log(data.result);
				if(data.result == 'noId'){
					$(location).attr("href", "/index/loginForm");
				} else if(data.result =='success'){
					$(location).attr("href","/interior/simulator?buildingNo=${buildingNo}");
				} else if(data.result=='hasItem'){
					$(location).attr("href","/interior/simulator");
				}
				
			})
		
	}
	
</script>

<section class="container-fluid mb-5" style="flex-grow:1;">
    <div class="col-2"></div>
    <div class="col-8" style="margin:0 auto">
    	<h4 class="p-3 mt-3">나만의 인테리어 만들기</h4>
        <div class="row">
        	<div class="col-8">
	        	<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
	              <div id = "div" class="carousel-inner">
	              	<c:if test="${buildingNo == 0}">
	              		<div class="carousel-item active" >
		                  <img src="${pageContext.request.contextPath}/resources/images/troom1.jpg" class="d-block w-100" style = "height: 500px; border-radius: 5px;">
		                </div>
		                <div class="carousel-item">
		                  <img src="${pageContext.request.contextPath}/resources/images/troom2.jpg" class="d-block w-100" style = "height: 500px; border-radius: 5px;">
		                </div>
		                <div class="carousel-item">
		                  <img src="${pageContext.request.contextPath}/resources/images/lobby1.jpg" class="d-block w-100" style = "height: 500px; border-radius: 5px;">
		                </div>
		                <div class="carousel-item">
		                  <img src="${pageContext.request.contextPath}/resources/images/doctorRoom1.jpg" class="d-block w-100" style = "height: 500px; border-radius: 5px;">
		                </div>
	              	</c:if>
	              	<c:if test="${buildingNo != 0}">
	              		<div class="carousel-item active">
	              				<img src="getBuildingImage?buildingNo=${buildingNo}&type=nomal&img=0" class="d-block w-100" style = "height: 500px; border-radius: 5px;"/>
	              		</div>
	              		<c:forEach var="imageFile" items="${imageFiles}" varStatus="status" begin="1">
	              			<c:if  test="${imageFile.panoramaCheck eq '0'}">
		              			<div class="carousel-item">
		              				<img src="getBuildingImage?buildingNo=${buildingNo}&type=nomal&img=${status.index}" class="d-block w-100" style = "height: 500px; border-radius: 5px;"/>
		              			</div>
	              			</c:if>
	              		</c:forEach>
	              	</c:if>
	              </div>
	              <button class="carousel-control-prev" type="button" data-target="#carouselExampleControls" data-slide="prev">
	                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	                  <span class="sr-only">Previous</span>
	              </button>
	              <button class="carousel-control-next" type="button" data-target="#carouselExampleControls" data-slide="next">
	                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
	                  <span class="sr-only">Next</span>
	              </button>
	            </div>
        	</div>
          
            <div class="col-4" style=" height:500px; overflow-y: auto; border: 1px solid black; border-radius: 5px; display: inline-block; " >
                <ul class="ml-3">
                    <h5 class="mt-2">치과베드</h5>
                    <li>
                       <img id="bed1" onClick="checkImg($('#bed1').attr('src'))" src="${pageContext.request.contextPath}/resources/images/interior/bed/treatmentBed1.png" width="80px" height="80px"/>
                       <img id="bed2" onClick="checkImg($('#bed2').attr('src'))" src="${pageContext.request.contextPath}/resources/images/interior/bed/treatmentBed2.png" width="80px" height="80px"/>
                       <img id="bed3" onClick="checkImg($('#bed3').attr('src'))" src="${pageContext.request.contextPath}/resources/images/interior/bed/treatmentBed3.png" width="80px" height="80px"/>
                    </li>
                    <div id="bed1Div" class="mt-2" style="display:none;">
                  	   <img id ="bedDetailimage" src="" width="100%"/>
                  	   <p>제품명 : <span id="bedinteriorName"></span></p>
                  	   <p>가격 : <span id="bedinteriorPrice"></span></p>
                  	   <input id="bedItemCnt" min="1" class="p-2 rounded border" type="number"  placeholder="장비 개수" style="width: 110px;"/>
                  	   <button onClick="addWishList($('#bedinteriorName').text(), $('#bedinteriorPrice').text(), $('#bedDetailimage').attr('src'),${buildingNo}, $('#bedItemCnt').val())" class="btn btn-sm col-3 float-right" style="background-color:rgb(242, 101, 45); color: white;">추가</button>
                    </div>
                    <h5 class="mt-2">의자</h5>
                    <li>
                       <img id="chair1" onClick="checkImg($('#chair1').attr('src'))" src="${pageContext.request.contextPath}/resources/images/interior/chair/chair1.jpg" width="80px" height="80px"/>
                       <img id="chair2" onClick="checkImg($('#chair2').attr('src'))" src="${pageContext.request.contextPath}/resources/images/interior/chair/chair2.jpg" width="80px" height="80px"/>
                       <img id="chair3" onClick="checkImg($('#chair3').attr('src'))" src="${pageContext.request.contextPath}/resources/images/interior/chair/chair3.jpg" width="80px" height="80px"/>
                    </li>
                    <div id="chair1Div" class="mt-2" style="display:none;">
	                   <img id ="chairDetailimage" src="" width="100%"/>
	                   <p>제품명 : <span id="chairinteriorName"></span></p>
	                   <p>가격 : <span id="chairinteriorPrice"></span></p>
	                   <input id="chairItemCnt" min="1" class="p-2 rounded border" type="number"  placeholder="장비 개수" style="width: 110px;"/>
	                   <button onClick="addWishList($('#chairinteriorName').text(), $('#chairinteriorPrice').text(), $('#chairDetailimage').attr('src'),${buildingNo},$('#chairItemCnt').val())" class="btn btn-sm col-3 float-right" style="background-color:rgb(242, 101, 45); color: white;">추가</button>
	                </div>
                    <h5 class="mt-2">쇼파</h5>
                    <li>
                       <img id="sofa1" onClick="checkImg($('#sofa1').attr('src'))" src="${pageContext.request.contextPath}/resources/images/interior/sofa/sofa1.jpg" width="80px" height="80px"/>
                       <img id="sofa2" onClick="checkImg($('#sofa2').attr('src'))" src="${pageContext.request.contextPath}/resources/images/interior/sofa/sofa2.jpg" width="80px" height="80px"/>
                       <img id="sofa3" onClick="checkImg($('#sofa3').attr('src'))" src="${pageContext.request.contextPath}/resources/images/interior/sofa/sofa3.png" width="80px" height="80px"/>
                    </li>
                    <div id="sofa1Div" class="mt-2" style="display:none;">
                  	   <img id ="sofaDetailimage" src="" width="100%"/>
                  	   <p>제품명 : <span id="sofainteriorName"></span></p>
                  	   <p>가격 : <span id="sofainteriorPrice"></span></p>
                  	   <input id="sofaItemCnt" min="1" class="p-2 rounded border" type="number"  placeholder="장비 개수" style="width: 110px;"/>
                  	   <button onClick="addWishList($('#sofainteriorName').text(), $('#sofainteriorPrice').text(), $('#sofaDetailimage').attr('src'),${buildingNo},$('#sofaItemCnt').val())" class="btn btn-sm col-3 float-right" style="background-color:rgb(242, 101, 45); color: white;">추가</button>
                    </div>
                </ul>
            </div>
    	</div>
    	<hr/>
    	<c:if test="${modelId != null}">
    		<h3 class="ml-3">위시리스트</h3>
    		<div class="row">
    			<div class="col-8 d-flex" style="overflow-x: auto; height:450px; border: 1px solid black; border-radius: 5px; display: inline-block; background-color: rgb(248,244,239);">
			   		<c:forEach var="wishList" items="${wishLists}">
			   			<li style="list-style:none;">
				   			<div class="card m-3" style="width: 200px;">
				   			  <img src="${wishList.pictureName}" class="card-img-top" style="height:12rem;">
							  <div class="card-body">
							    <h5 class="card-title">제품명 : ${wishList.interiorName}</h5>
							    <p class="card-text">가격 : ${wishList.interiorPrice}</p> 
							    <p class="card-text">수량 : ${wishList.count}</p>
							    <button onClick="deleteItem(${wishList.wishListNo},${buildingNo})" class="btn btn-sm" style="background-color:rgb(242, 101, 45); color: white;">삭제</button>
							  </div>
							</div>
						</li>
			   		</c:forEach>
			   		<script>
			   			function deleteItem(number,nowBuildingNo){
			   				var wishListNo = number
			   				var buildingNo = nowBuildingNo;
			   				$.ajax({
			   					url: "deleteItem",
			   					data: {wishListNo, buildingNo},
			   					method:"post"
			   				})
			   				.done((data)=>{
			   					if(data.result==1){
			   						$(location).attr("href","/interior/simulator?buildingNo=${buildingNo}");
			   					}
			   				})
			   			}
			   		</script>
			    </div>
			    <div class="col-4" style="height:450px">
			    	<table class="table">
			    		<thead>
			    			<th scope="col" style="text-align: center;">상품명</th>
			    			<th scope="col" style="text-align: center;">가격</th>
			    			<th scope="col" style="text-align: center;">수량</th>
			    		</thead>
			    		<tbody id="cage">
			    			<c:forEach var="wishList" items="${wishLists}">
			    				<tr>
				    				<td style="text-align: center;">${wishList.interiorName}</th>
				    				<td style="text-align: center;">${wishList.interiorPrice}</td>
				    				<td style="text-align: center;">${wishList.count}</td>
			    				</tr>
			   				</c:forEach>
			    		</tbody>
			    	</table>
			    	<div style="position:absolute;bottom:0px; width:95%;">
			    	<div class="float-right">
			    		<span class="float-left">합계 : </span>
			    		<span class="float-right" id="totalResult"></span>
			    	</div>
			    	</div>
			    	<script>
			    		var total = 0;
			    		$(document).ready(function(){
			    			var table=document.getElementById('cage');
			    			for(let i = 0; i<table.rows.length; i++){
			    				var price = parseInt(table.rows[i].cells[1].innerHTML);
			    				var count = parseInt(table.rows[i].cells[2].innerHTML);
			    				var sum = price * count;
			    				console.log(price);
			    				console.log(count);
			    				total += sum;
			    			}
			    			$('#totalResult').text(total);
			    		})
			    	</script>
			    </div>
    		</div>
    	</c:if>
    	<div class="row col-12 d-flex justify-content-center">
    		<a href="/interior/example" class="btn border mt-3">예시목록</a>
    	</div>
    </div>
    <div class="col-2"></div>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>