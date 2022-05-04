<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script src="https://kit.fontawesome.com/748830bbae.js" crossorigin="anonymous"></script>
	<script style="flex-grow:1;">
        function selectAll(selectAll)  {
            const checkboxes = document.querySelectorAll('input[type="checkbox"]');
            
            checkboxes.forEach((checkbox) => {
                checkbox.checked = selectAll.checked
            })
        }

        function openMsgForm(){
            var url = "<%=request.getContextPath() %>/message";
            var option = "width = 300, height = 350, top = 100, left = 200, location = no";
            window.open(url, "message", option);
        }
        
        $(document).ready(function() {
        	showLikeCount();
        	console.log("showLikeCount() 실행되니??")
        });
    </script>
    <style>
		.top-content { width: 100%;}

		.top-content .carousel-control-prev { left: -100px; border-bottom: 0; font-size: 40px; color: #444; }
		.top-content .carousel-control-next { right: -100px; border-bottom: 0; font-size: 40px; color: #444; }
		
		.top-content .carousel-caption .carousel-caption-description { color: #fff; color: rgba(255, 255, 255, 0.8); }
    </style>
    <section>
        <div class="container-fluid mb-5">
            <div style="height: 250px;" class="bg-light d-flex align-items-center justify-content-center">
                <h1 class="">거래 게시판</h1>
            </div>
            <div class="row">
                <div class="col-2">
                </div>
                <div class="col-8 mt-5">
                    <div class="card">
                        <div class="card-body">
                            <div class="h4">
                                <span>글쓴이 : </span><span>${marketBoardDto.userDto.userNickname}</span>
                                <a class="btn btn-outline-dark ml-2" onclick="openMsgForm()">쪽지보내기</a>
                                <span class="date float-right mr-5">
                                	<fmt:formatDate value="${marketBoardDto.marketRegistDate}" pattern="yyyy-MM-dd"/>
                                </span>
                            </div>
                            <div class="title h5 mt-5 mb-3">
                                <span>${marketBoardDto.marketTitle}</span>
                            </div>							
							<!-- Top content -->
					        <div class="top-content px-5">
					        	<div class="container px-5">
					        		<div class="row px-5">
					        			<div class="col">
								            <!-- Carousel -->
								            <div id="carousel-example" class="carousel slide" data-ride="carousel">
								
								                <div class="carousel-inner">
												  	<c:forEach var="file" items="${marketFileList}" varStatus="status">
												  		<c:if test="${status.index == 0}">
														    <div class="carousel-item active">
														      <img class="d-block w-100" src="getMarketImage?marketNo=${marketBoardDto.marketNo}&img=${status.index}" alt="First slide" style="height: 450px">
														    </div>							  			
												  		</c:if>
												  		<c:if test="${status.index != 0}">
												  			<div class="carousel-item">
														      <img class="d-block w-100" src="getMarketImage?marketNo=${marketBoardDto.marketNo}&img=${status.index}" alt="other slide" style="height: 450px">
														    </div>	
												  		</c:if>
												  	</c:forEach>
								                </div>
								
								                <a class="carousel-control-prev" href="#carousel-example" role="button" data-slide="prev">
								                    <i class="fas fa-arrow-left" aria-hidden="true"></i>
								                    <span class="sr-only">Previous</span>
								                </a>
								                <a class="carousel-control-next" href="#carousel-example" role="button" data-slide="next">
								                    <i class="fas fa-arrow-right" aria-hidden="true"></i>
								                    <span class="sr-only">Next</span>
								                </a>
								            </div>
								            <!-- End carousel -->
					            
					            		</div>
					            	</div>
					            </div>
					        </div>
							
							
							
							
                            <div class="price h5 mt-4">
                                <span>가격: </span> ${marketBoardDto.marketPrice} <span> 원</span>
                            </div>
                            <div style="width:100%" class="mt-5">${marketBoardDto.marketContent}</div>
                        </div>
                    </div>
                    <div class="buttons mt-5 d-flex justify-content-center">
                        <a class="btn btn-outline-dark mr-3" style="width:100px; height:50px;" href="marketViewtoList">목록</a>
                        <button class="btn btn-outline-dark ml-3" style="width:100px;" onclick="likeBtnClick(this);">
                        	<img id="interImg" class="mr-2" src="" width="30px;"/>
                        	<span id="interCnt">${marketBoardDto.marketLikeCount}</span>
                        </button>
                    </div>
                    <div class="buttons mt-5 d-flex justify-content-center">
                    	<c:if test="${sessionUserId == marketBoardDto.marketWriter}">
	                    	<a class="btn btn-outline-dark mr-3" style="width:100px;" href="marketViewtoList">수정</a>
	                        <a class="btn btn-outline-dark mr-3" style="width:100px;" href="marketViewtoList">삭제</a>
	                        <a class="btn btn-outline-dark mr" style="width:100px;" href="marketViewtoList">판매완료</a>
                    	</c:if>
                    </div>
                </div>
                <div class="col-2">
                </div>
            </div>
        </div>
    </section>
    <script>
		var likeCnt = `${marketBoardDto.marketLikeCount}`;
		var marketNo = `${marketBoardDto.marketNo}`;
    
	   function showLikeCount(){
	   	$.ajax({
	   		url: "checkLike",
	   		data:{
	   			id:`${sessionUserId}`,
	   			type:"market",
    			marketNo:`${marketBoardDto.marketNo}`
	   		}
	   	}).done((data) => {
	   		if(data.likeCheck == 'like'){
	   			$("#interImg").attr("src", "/resources/images/interestAfter.png");
	   		}else{
	   			$("#interImg").attr("src", "/resources/images/interestBefore.png");
	   		}
	   	});
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
		    			type:"market",
		    			marketNo:marketNo,
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
		    			type:"market",
		    			marketNo:marketNo,
		    			likeCnt:likeCnt
	        		}
	        	}).done((data) => {
	    			$("#interImg").attr("src", "/resources/images/interestBefore.png");
	    			document.getElementById("interCnt").innerHTML = likeCnt;
	    		});
	        }
	    }    
    </script>

	    	
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>