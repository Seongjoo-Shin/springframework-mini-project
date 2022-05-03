<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script>
	function addPic(imgName,divId){
	    const content1 = document.getElementById("content1");
	    content1.innerHTML = "<img src='${pageContext.request.contextPath}/resources/images/" + imgName +"' width = '100%' height = '500px'/>";
	}
	
	function checkBedImg(imgId,imgName){
		if(imgId =='bed1'){
			if(imgName=="${pageContext.request.contextPath}/resources/images/interior/bed/treatmentBed1.png"){
				document.getElementById("bed1Div").innerHTML = "";
		 		$('#bed1').attr("src", '${pageContext.request.contextPath}/resources/images/interior/bed/checkedTreatmentBed1.png');
		 		$('#bed2').attr("src", '${pageContext.request.contextPath}/resources/images/interior/bed/treatmentBed2.png');
		 		$('#bed3').attr("src", '${pageContext.request.contextPath}/resources/images/interior/bed/treatmentBed3.png');
		 		$('#bedDiv1').attr('display','inline-block');
		 		document.getElementById("bed1Div").innerHTML += "<img src=" + imgName + " style=\"width:100%; height:100%;\" />";
		 		document.getElementById("bed1Div").innerHTML += "<p>치과베드 A타입</p>";
		 		document.getElementById("bed1Div").innerHTML += "<p>가격 : 860,000</p>";
		 		document.getElementById("bed1Div").innerHTML +="<button class=\"btn btn-sm col-3\" style=\"background-color: rgb(242, 101, 45); color: white;\"> 추가 </button>";
			 	} else {
			 		$('#bed1').attr("src", '${pageContext.request.contextPath}/resources/images/interior/bed/treatmentBed1.png');
			 		$('#bedDiv1').attr('display','none');
			 		document.getElementById("bed1Div").innerHTML = "";
			 	}
		} else if(imgId=='bed2'){
			if(imgName=="${pageContext.request.contextPath}/resources/images/interior/bed/treatmentBed2.png"){
				document.getElementById("bed1Div").innerHTML = "";
		 		$('#bed2').attr("src", '${pageContext.request.contextPath}/resources/images/interior/bed/checkedTreatmentBed2.png');
		 		$('#bed1').attr("src", '${pageContext.request.contextPath}/resources/images/interior/bed/treatmentBed1.png');
		 		$('#bed3').attr("src", '${pageContext.request.contextPath}/resources/images/interior/bed/treatmentBed3.png');
		 		$('#bedDiv1').attr('display','inline-block');
		 		document.getElementById("bed1Div").innerHTML += "<img src=" + imgName + " style=\"width:100%; height:100%;\" />";
		 		document.getElementById("bed1Div").innerHTML += "<p>치과베드 B타입</p>";
		 		document.getElementById("bed1Div").innerHTML += "<p>가격 : 990,000</p>";
		 		document.getElementById("bed1Div").innerHTML +="<button class=\"btn btn-sm col-3\" style=\"background-color: rgb(242, 101, 45); color: white;\"> 추가 </button>";
		 	} else {
		 		$('#bed2').attr("src", '${pageContext.request.contextPath}/resources/images/interior/bed/treatmentBed2.png');
		 		$('#bedDiv1').attr('display','none');
		 		document.getElementById("bed1Div").innerHTML = "";
		 	}
		} else if(imgId=='bed3'){
			if(imgName=="${pageContext.request.contextPath}/resources/images/interior/bed/treatmentBed3.png"){
				document.getElementById("bed1Div").innerHTML = "";
		 		$('#bed3').attr("src", '${pageContext.request.contextPath}/resources/images/interior/bed/checkedTreatmentBed3.png');
		 		$('#bed1').attr("src", '${pageContext.request.contextPath}/resources/images/interior/bed/treatmentBed1.png');
		 		$('#bed2').attr("src", '${pageContext.request.contextPath}/resources/images/interior/bed/treatmentBed2.png');
		 		$('#bedDiv1').attr('display','inline-block');
		 		document.getElementById("bed1Div").innerHTML += "<img src=" + imgName + " style=\"width:100%; height:100%;\" />";
		 		document.getElementById("bed1Div").innerHTML += "<p>치과베드 C타입</p>";
		 		document.getElementById("bed1Div").innerHTML += "<p>가격 : 1,290,000</p>";
		 		document.getElementById("bed1Div").innerHTML +="<button class=\"btn btn-sm col-3\" style=\"background-color: rgb(242, 101, 45); color: white;\"> 추가 </button>";
		 	} else {
		 		$('#bed3').attr("src", '${pageContext.request.contextPath}/resources/images/interior/bed/treatmentBed3.png');
		 		$('#bedDiv1').attr('display','none');
		 		document.getElementById("bed1Div").innerHTML = "";
		 	}
		}
	}
	
	function checkChairImg(imgId,imgName){
		if(imgId=="chair1"){
			if(imgName=="${pageContext.request.contextPath}/resources/images/interior/chair/chair1.jpg"){
				$('#chair1').attr('src', '${pageContext.request.contextPath}/resources/images/interior/chair/checkedChair1.jpg');
				$('#chair2').attr('src', '${pageContext.request.contextPath}/resources/images/interior/chair/chair2.jpg');
				$('#chair3').attr('src', '${pageContext.request.contextPath}/resources/images/interior/chair/chair3.jpg');
				
				$('#chair1Div').attr('display','inline-block');
				document.getElementById("chair1Div").innerHTML = "";
				document.getElementById("chair1Div").innerHTML += "<img src=" + imgName + " style=\"width:100%; height:100%;\" />";
				document.getElementById("chair1Div").innerHTML +="<p>의자 A타입</p>";
				document.getElementById("chair1Div").innerHTML +="<p>가격 : 240,000</p>";
				document.getElementById("chair1Div").innerHTML +="<button class=\"btn btn-sm col-3\" style=\"background-color: rgb(242, 101, 45); color: white;\"> 추가 </button>";
			} else {
				$('#chair1').attr('src', '${pageContext.request.contextPath}/resources/images/interior/chair/chair1.jpg');
				$('#chair1Div').attr('display','none');
		 		document.getElementById("chair1Div").innerHTML = "";
			}
		} else if(imgId=="chair2"){
			if(imgName=="${pageContext.request.contextPath}/resources/images/interior/chair/chair2.jpg"){
				$('#chair2').attr('src', '${pageContext.request.contextPath}/resources/images/interior/chair/checkedChair2.jpg');
				$('#chair1').attr('src', '${pageContext.request.contextPath}/resources/images/interior/chair/chair1.jpg');
				$('#chair3').attr('src', '${pageContext.request.contextPath}/resources/images/interior/chair/chair3.jpg');
				
				$('#chair1Div').attr('display','inline-block');
				document.getElementById("chair1Div").innerHTML = "";
				document.getElementById("chair1Div").innerHTML += "<img src=" + imgName + " style=\"width:100%; height:100%;\" />";
				document.getElementById("chair1Div").innerHTML +="<p>의자 B타입</p>";
				document.getElementById("chair1Div").innerHTML +="<p>가격 : 270,000</p>";
				document.getElementById("chair1Div").innerHTML +="<button class=\"btn btn-sm col-3\" style=\"background-color: rgb(242, 101, 45); color: white;\"> 추가 </button>";
			} else {
				$('#chair2').attr('src', '${pageContext.request.contextPath}/resources/images/interior/chair/chair2.jpg');
				$('#chair1Div').attr('display','none');
		 		document.getElementById("chair1Div").innerHTML = "";
			}
			
		} else if(imgId=="chair3"){
			if(imgName=="${pageContext.request.contextPath}/resources/images/interior/chair/chair3.jpg"){
				$('#chair3').attr('src', '${pageContext.request.contextPath}/resources/images/interior/chair/checkedChair3.jpg');
				$('#chair1').attr('src', '${pageContext.request.contextPath}/resources/images/interior/chair/chair1.jpg');
				$('#chair2').attr('src', '${pageContext.request.contextPath}/resources/images/interior/chair/chair2.jpg');
				
				$('#chair1Div').attr('display','inline-block');
				document.getElementById("chair1Div").innerHTML = "";
				document.getElementById("chair1Div").innerHTML += "<img src=" + imgName + " style=\"width:100%; height:100%;\" />";
				document.getElementById("chair1Div").innerHTML +="<p>의자 C타입</p>";
				document.getElementById("chair1Div").innerHTML +="<p>가격 : 160,000</p>";
				document.getElementById("chair1Div").innerHTML +="<button class=\"btn btn-sm col-3\" style=\"background-color: rgb(242, 101, 45); color: white;\"> 추가 </button>";
			} else {
				$('#chair3').attr('src', '${pageContext.request.contextPath}/resources/images/interior/chair/chair3.jpg');
				$('#chair1Div').attr('display','none');
		 		document.getElementById("chair1Div").innerHTML = "";
			}
		}
	}
	
	function checkSofaImg(imgId,imgName){
		if(imgId=="sofa1"){
			if(imgName=="${pageContext.request.contextPath}/resources/images/interior/sofa/sofa1.jpg"){
				$('#sofa1').attr('src', '${pageContext.request.contextPath}/resources/images/interior/sofa/checkedSofa1.jpg');
				$('#sofa2').attr('src', '${pageContext.request.contextPath}/resources/images/interior/sofa/sofa2.jpg');
				$('#sofa3').attr('src', '${pageContext.request.contextPath}/resources/images/interior/sofa/sofa3.png');
				
				$('#sofa1Div').attr('display','inline-block');
				document.getElementById("sofa1Div").innerHTML = "";
				document.getElementById("sofa1Div").innerHTML += "<img src=" + imgName + " style=\"width:100%; height:100%;\" />";
				document.getElementById("sofa1Div").innerHTML +="<p>쇼파 A타입</p>";
				document.getElementById("sofa1Div").innerHTML +="<p>가격 : 220,000</p>";
				document.getElementById("sofa1Div").innerHTML +="<button class=\"btn btn-sm col-3\" style=\"background-color: rgb(242, 101, 45); color: white;\"> 추가 </button>";
			} else {
				$('#sofa1').attr('src', '${pageContext.request.contextPath}/resources/images/interior/sofa/sofa1.jpg');
				$('#sofa1Div').attr('display','none');
		 		document.getElementById("sofa1Div").innerHTML = "";
			}
			
		} else if(imgId=="sofa2"){
			if(imgName=="${pageContext.request.contextPath}/resources/images/interior/sofa/sofa2.jpg"){
				$('#sofa2').attr('src', '${pageContext.request.contextPath}/resources/images/interior/sofa/checkedSofa2.jpg');
				$('#sofa1').attr('src', '${pageContext.request.contextPath}/resources/images/interior/sofa/sofa1.jpg');
				$('#sofa3').attr('src', '${pageContext.request.contextPath}/resources/images/interior/sofa/sofa3.png');
				
				$('#sofa1Div').attr('display','inline-block');
				document.getElementById("sofa1Div").innerHTML = "";
				document.getElementById("sofa1Div").innerHTML += "<img src=" + imgName + " style=\"width:100%; height:100%;\" />";
				document.getElementById("sofa1Div").innerHTML +="<p>쇼파 B타입</p>";
				document.getElementById("sofa1Div").innerHTML +="<p>가격 : 180,000</p>";
				document.getElementById("sofa1Div").innerHTML +="<button class=\"btn btn-sm col-3\" style=\"background-color: rgb(242, 101, 45); color: white;\"> 추가 </button>";
			} else {
				$('#sofa2').attr('src', '${pageContext.request.contextPath}/resources/images/interior/sofa/sofa2.jpg');
				$('#sofa1Div').attr('display','none');
		 		document.getElementById("sofa1Div").innerHTML = "";
			}
			
		} else if(imgId=="sofa3"){
			if(imgName=="${pageContext.request.contextPath}/resources/images/interior/sofa/sofa3.png"){
				$('#sofa3').attr('src', '${pageContext.request.contextPath}/resources/images/interior/sofa/checkedSofa3.png');
				$('#sofa1').attr('src', '${pageContext.request.contextPath}/resources/images/interior/sofa/sofa1.jpg');
				$('#sofa2').attr('src', '${pageContext.request.contextPath}/resources/images/interior/sofa/sofa2.jpg');
				
				$('#sofa1Div').attr('display','inline-block');
				document.getElementById("sofa1Div").innerHTML = "";
				document.getElementById("sofa1Div").innerHTML += "<img src=" + imgName + " style=\"width:100%; height:100%;\" />";
				document.getElementById("sofa1Div").innerHTML +="<p>쇼파 C타입</p>";
				document.getElementById("sofa1Div").innerHTML +="<p>가격 : 250,000</p>";
				document.getElementById("sofa1Div").innerHTML +="<button onClick=\"addToWishList()\" class=\"btn btn-sm col-3\" style=\"background-color: rgb(242, 101, 45); color: white;\"> 추가 </button>";
			} else {
				$('#sofa3').attr('src', '${pageContext.request.contextPath}/resources/images/interior/sofa/sofa3.png');
				$('#sofa1Div').attr('display','none');
		 		document.getElementById("sofa1Div").innerHTML = "";
			}
			
		}
	}
	
	function addToWishList(item){
		console.log(item);
	}
</script>

<section class="container-fluid mb-5">
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
          <div class="col-4" style=" height:500px; overflow-y: scroll; border: 1px solid black; border-radius: 5px; display: inline-block; " >
              <ul class="ml-3">
                  치과베드
                  <li>
                      <img id="bed1" onClick="checkBedImg('bed1',$('#bed1').attr('src'))" src="${pageContext.request.contextPath}/resources/images/interior/bed/treatmentBed1.png" width="80px" height="80px"/>
                      <img id="bed2" onClick="checkBedImg('bed2',$('#bed2').attr('src'))" src="${pageContext.request.contextPath}/resources/images/interior/bed/treatmentBed2.png" width="80px" height="80px"/>
                      <img id="bed3" onClick="checkBedImg('bed3',$('#bed3').attr('src'))" src="${pageContext.request.contextPath}/resources/images/interior/bed/treatmentBed3.png" width="80px" height="80px"/>
                  </li>
                  <div id="bed1Div" class="mt-2" display="none">
                  </div>
                  
                  의자
                  <li>
                      <img id="chair1" onClick="checkChairImg('chair1',$('#chair1').attr('src'))" src="${pageContext.request.contextPath}/resources/images/interior/chair/chair1.jpg" width="80px" height="80px"/>
                      <img id="chair2" onClick="checkChairImg('chair2',$('#chair2').attr('src'))" src="${pageContext.request.contextPath}/resources/images/interior/chair/chair2.jpg" width="80px" height="80px"/>
                      <img id="chair3" onClick="checkChairImg('chair3',$('#chair3').attr('src'))" src="${pageContext.request.contextPath}/resources/images/interior/chair/chair3.jpg" width="80px" height="80px"/>
                  </li>
                  <div id="chair1Div" class="mt-2" display="none">
                  </div>
                  쇼파
                  <li>
                      <img id="sofa1" onClick="checkSofaImg('sofa1',$('#sofa1').attr('src'))" src="${pageContext.request.contextPath}/resources/images/interior/sofa/sofa1.jpg" width="80px" height="80px"/>
                      <img id="sofa2" onClick="checkSofaImg('sofa2',$('#sofa2').attr('src'))" src="${pageContext.request.contextPath}/resources/images/interior/sofa/sofa2.jpg" width="80px" height="80px"/>
                      <img id="sofa3" onClick="checkSofaImg('sofa3',$('#sofa3').attr('src'))" src="${pageContext.request.contextPath}/resources/images/interior/sofa/sofa3.png" width="80px" height="80px"/>
                  </li>
                  <div id="sofa1Div" class="mt-2" display="none">
                  </div>
              </ul>
          </div>
    	</div>
    	
	    <h3 class="ml-3">위시리스트</h3>
    </div>
    <div class="col-2"></div>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>