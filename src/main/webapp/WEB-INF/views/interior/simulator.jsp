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
	
	
	function addPic(imgName,divId){
	    const content1 = document.getElementById("content1");
	    content1.innerHTML = "<img src='${pageContext.request.contextPath}/resources/images/" + imgName +"' width = '100%' height = '500px'/>";
	}
	
	function checkImg(imgName){
		if(imgName == bed1ImageName){
			$('#bed1').attr("src", bed1CheckedImageName);
	 		$('#bed2').attr("src", bed2ImageName);
	 		$('#bed3').attr("src", bed3ImageName);
			
			$('#bedDetailimage').attr('src', imgName);
			$('#bedinteriorName').text('치과베드 A타입');
			$('#bedinteriorPrice').text('960,000');
			
			$('#bed1Div').css('display','inline-block');
		} else if(imgName == bed1CheckedImageName){
			$('#bed1').attr('src',bed1ImageName);
			$('#bed1Div').css('display','none');
		} else if(imgName == bed2ImageName){
			$('#bed2').attr("src", bed2CheckedImageName);
	 		$('#bed1').attr("src", bed1ImageName);
	 		$('#bed3').attr("src", bed3ImageName);
	 		
			
			$('#bedDetailimage').attr('src', imgName);
			$('#bedinteriorName').text('치과베드 B타입');
			$('#bedinteriorPrice').text('720,000');
			
			$('#bed1Div').css('display','inline-block');
		} else if(imgName == bed2CheckedImageName){
			$('#bed2').attr('src', bed2ImageName);
			$('#bed1Div').css('display','none');
		} else if(imgName == bed3ImageName){
			$('#bed3').attr("src", bed3CheckedImageName);
	 		$('#bed1').attr("src", bed1ImageName);
	 		$('#bed2').attr("src", bed2ImageName);
	 		
	 		$('#bedDetailimage').attr('src', imgName);
			$('#bedinteriorName').text('치과베드 C타입');
			$('#bedinteriorPrice').text('1,200,000');
			
			$('#bed1Div').css('display','inline-block');
			
		} else if(imgName == bed3CheckedImageName){
			$('#bed3').attr('src', bed3ImageName);
			$('#bed1Div').css('display','none');
			//--------------------------------------------------------------------------------------------------------------------
		} else if(imgName == chair1ImageName){
			$('#chair1').attr('src', chair1CheckedImageName);
			$('#chair2').attr("src", chair2ImageName);
	 		$('#chair3').attr("src", chair3ImageName);
	 		
	 		$('#chairDetailimage').attr('src', imgName);
			$('#chairinteriorName').text('의자 A타입');
			$('#chairinteriorPrice').text('210,000');
			
			$('#chair1Div').css('display','inline-block');
		} else if(imgName == chair1CheckedImageName){
			$('#chair1').attr('src', chair1ImageName);
			$('#chair1Div').css('display','none');
		} else if(imgName == chair2ImageName){
			$('#chair2').attr('src', chair2CheckedImageName);
			$('#chair1').attr("src", chair1ImageName);
	 		$('#chair3').attr("src", chair3ImageName);
	 		
	 		$('#chairDetailimage').attr('src', imgName);
			$('#chairinteriorName').text('의자 B타입');
			$('#chairinteriorPrice').text('270,000');
			
			$('#chair1Div').css('display','inline-block');
		} else if(imgName == chair2CheckedImageName){
			$('#chair2').attr('src', chair2ImageName);
			$('#chair1Div').css('display','none');
		} else if(imgName == chair3ImageName){
			$('#chair3').attr('src', chair3CheckedImageName);
			$('#chair1').attr("src", chair1ImageName);
	 		$('#chair2').attr("src", chair2ImageName);
	 		
	 		$('#chairDetailimage').attr('src', imgName);
			$('#chairinteriorName').text('의자 C타입');
			$('#chairinteriorPrice').text('170,000');
			
			$('#chair1Div').css('display','inline-block');
		} else if(imgName == chair3CheckedImageName){
			$('#chair3').attr('src', chair3ImageName);
			$('#chair1Div').css('display','none');
			//--------------------------------------------------------------------------------------------------------------------
		} else if(imgName == sofa1ImageName){
			$('#sofa1').attr('src', sofa1CheckedImageName);
			$('#sofa2').attr("src", sofa2ImageName);
	 		$('#sofa3').attr("src", sofa3ImageName);
	 		
	 		$('#sofaDetailimage').attr('src', imgName);
			$('#sofainteriorName').text('쇼파 A타입');
			$('#sofainteriorPrice').text('240,000');
			
			$('#sofa1Div').css('display','inline-block');
		} else if(imgName == sofa1CheckedImageName){
			$('#sofa1').attr("src", sofa1ImageName);
			$('#sofa1Div').css('display','none');
		} else if(imgName == sofa2ImageName){
			$('#sofa2').attr('src', sofa2CheckedImageName);
			$('#sofa1').attr("src", sofa1ImageName);
	 		$('#sofa3').attr("src", sofa3ImageName);
	 		
	 		$('#sofaDetailimage').attr('src', imgName);
			$('#sofainteriorName').text('쇼파 B타입');
			$('#sofainteriorPrice').text('240,000');
			
			$('#sofa1Div').css('display','inline-block');
		} else if(imgName == sofa2CheckedImageName){
			$('#sofa2').attr("src", sofa2ImageName);
			$('#sofa1Div').css('display','none');
		} else if(imgName == sofa3ImageName){
			$('#sofa3').attr('src', sofa3CheckedImageName);
			$('#sofa1').attr("src", sofa1ImageName);
	 		$('#sofa2').attr("src", sofa2ImageName);
	 		
	 		$('#sofaDetailimage').attr('src', imgName);
			$('#sofainteriorName').text('쇼파 C타입');
			$('#sofainteriorPrice').text('320,000');
			
			$('#sofa1Div').css('display','inline-block');
		} else if(imgName == sofa1CheckedImageName){
			$('#sofa3').attr("src", sofa3ImageName);
			$('#sofa1Div').css('display','none');
		}
		
	}
	
	function addWishList(addName, addPrice, addPictureName){
		var interiorName = addName;
		console.log(interiorName);
		var interiorPrice = addPrice;
		console.log(interiorPrice);
		var pictureName = addPictureName;
		console.log(pictureName);
		$.ajax({
				url: "/interior/addWishList",
				data: {interiorName,interiorPrice,pictureName},
				method:"post"
			})
			.done((data)=>{
				console.log(data.result);
				if(data.result == 'noId'){
					$(location).attr("href", "/index/loginForm");
				} else if(data.result =='success'){
					$(location).attr("href","/interior/simulator");
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
        <div class="row m-3">
          <button class="btn btn-sm text-dark ml-2" onclick="addPic('troom1.jpg','div1')" style="border: 1px solid;">진료실A</button>
          <button class="btn btn-sm text-dark ml-2" onclick="addPic('troom2.jpg','div2')" style="border: 1px solid;">진료실B</button>
          <button class="btn btn-sm text-dark ml-2" onclick="addPic('doctorRoom1.jpg','div3')" style="border: 1px solid;">원장실</button>
          <button class="btn btn-sm text-dark ml-2" onclick="addPic('lobby1.jpg','div4')" style="border: 1px solid;">로비</button>
        </div>
        
        <div class="row">
          <div id = content1 class="col-8">
               <img src = "${pageContext.request.contextPath}/resources/images/troom1.jpg" width="100%" height="500px" style = "border-radius:5px"/>
          </div>
          <div class="col-4" style=" height:500px; overflow-y: auto; border: 1px solid black; border-radius: 5px; display: inline-block; " >
              <ul class="ml-3">
                  치과베드
                  <li>
                      <img id="bed1" onClick="checkImg($('#bed1').attr('src'))" src="${pageContext.request.contextPath}/resources/images/interior/bed/treatmentBed1.png" width="80px" height="80px"/>
                      <img id="bed2" onClick="checkImg($('#bed2').attr('src'))" src="${pageContext.request.contextPath}/resources/images/interior/bed/treatmentBed2.png" width="80px" height="80px"/>
                      <img id="bed3" onClick="checkImg($('#bed3').attr('src'))" src="${pageContext.request.contextPath}/resources/images/interior/bed/treatmentBed3.png" width="80px" height="80px"/>
                  </li>
                  <div id="bed1Div" class="mt-2" style="display:none;">
                  	<img id ="bedDetailimage" src="" width="100%"/>
                  	<p>제품명 : <span id="bedinteriorName"></span></p>
                  	<p>가격 : <span id="bedinteriorPrice"></span></p>
                  	<button onClick="addWishList($('#bedinteriorName').text(), $('#bedinteriorPrice').text(), $('#bedDetailimage').attr('src'))" class="btn btn-sm col-3" style="background-color:rgb(242, 101, 45); color: white;">추가</button>
                  </div>
                  
                  의자
                  <li>
                      <img id="chair1" onClick="checkImg($('#chair1').attr('src'))" src="${pageContext.request.contextPath}/resources/images/interior/chair/chair1.jpg" width="80px" height="80px"/>
                      <img id="chair2" onClick="checkImg($('#chair2').attr('src'))" src="${pageContext.request.contextPath}/resources/images/interior/chair/chair2.jpg" width="80px" height="80px"/>
                      <img id="chair3" onClick="checkImg($('#chair3').attr('src'))" src="${pageContext.request.contextPath}/resources/images/interior/chair/chair3.jpg" width="80px" height="80px"/>
                  </li>
                  <div id="chair1Div" class="mt-2" style="display:none;">
	                  <img id ="chairDetailimage" src="" width="100%"/>
	                  <p>제품명 : <span id="chairinteriorName"></span></p>
	                  <p>가격 : <span id="chairinteriorPrice"></span></p>
	                  <button onClick="addWishList($('#chairinteriorName').text(), $('#chairinteriorPrice').text(), $('#chairDetailimage').attr('src'))" class="btn btn-sm col-3" style="background-color:rgb(242, 101, 45); color: white;">추가</button>
	              </div>
                  쇼파
                  <li>
                      <img id="sofa1" onClick="checkImg($('#sofa1').attr('src'))" src="${pageContext.request.contextPath}/resources/images/interior/sofa/sofa1.jpg" width="80px" height="80px"/>
                      <img id="sofa2" onClick="checkImg($('#sofa2').attr('src'))" src="${pageContext.request.contextPath}/resources/images/interior/sofa/sofa2.jpg" width="80px" height="80px"/>
                      <img id="sofa3" onClick="checkImg($('#sofa3').attr('src'))" src="${pageContext.request.contextPath}/resources/images/interior/sofa/sofa3.png" width="80px" height="80px"/>
                  </li>
                  <div id="sofa1Div" class="mt-2" style="display:none;">
                  	<img id ="sofaDetailimage" src="" width="100%"/>
                  	<p>제품명 : <span id="sofainteriorName"></span></p>
                  	<p>가격 : <span id="sofainteriorPrice"></span></p>
                  	<button onClick="addWishList($('#sofainteriorName').text(), $('#sofainteriorPrice').text(), $('#sofaDetailimage').attr('src'))" class="btn btn-sm col-3" style="background-color:rgb(242, 101, 45); color: white;">추가</button>
                  </div>
              </ul>
          </div>
    	</div>
    	
	    <h3 class="ml-3">위시리스트</h3>
	    <div class="row col-12 d-flex ml-1" style="overflow-y: auto; height:450px; border: 1px solid black; border-radius: 5px; display: inline-block;">
	   		<c:forEach var="wishList" items="${wishLists}">
	   			<div class="card m-3" style="width: 15rem;">
	   			  <img src="${wishList.pictureName}" class="card-img-top">
				  <div class="card-body">
				    <h5 class="card-title">제품명 : ${wishList.interiorName}</h5>
				    <p class="card-text">가격 : ${wishList.interiorPrice}</p>
				    <button onClick="deleteItem(${wishList.wishListNo})" class="btn btn-sm" style="background-color:rgb(242, 101, 45); color: white;">삭제</button>
				  </div>
				</div>
	   		</c:forEach>
	   		<script>
	   			function deleteItem(number){
	   				var wishListNo = number
	   				$.ajax({
	   					url: "deleteItem",
	   					data: {wishListNo},
	   					method:"post"
	   				})
	   				.done((data)=>{
	   					if(data.result==1){
	   						$(location).attr("href","/interior/simulator");
	   					}
	   				})
	   			}
	   		</script>
	    </div>
    </div>
    <div class="col-2"></div>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>