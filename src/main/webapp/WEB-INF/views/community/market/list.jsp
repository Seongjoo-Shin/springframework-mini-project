<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<script>
	var alignarray = {"category": "", "align":"", "searchType":"", "searchContent":""};
	$(document).ready(function(){
		console.log("실행 되니??");
        alignarray.align = `${align}`;
        alignarray.searchType = `${searchType}`;
        alignarray.searchContent = `${searchContent}`;
        showData(`${category}`);
	});
</script>
    <section style="flex-grow:1;">
      <div class="d-flex align-items-center justify-content-center mb-5">
      	<img alt="" src="${pageContext.request.contextPath}/resources/images/marketBoard.png" style="width:100%">
      </div>
      <div class="container-fluid my-5">
        <div class="row">
          <div class="col-2"></div>
          <div class="col-8 row">
            <div class="minimenu col-12 my-3 pb-4" style="border-bottom: solid 2px rgb(138,138,138); font-size:24px;">
              <div class="dropdown">
                <button id="category" class="btn dropbtn" style="height:40px"><img src="${pageContext.request.contextPath}/resources/images/stick.png" style="height: 15px; width: 15px;" class="mr-2">카테고리 > <span id="categorySpan"> 전체</span></button><!--눌렀을때 효과-->
                <div class="dropdown-content">
                  <a class="dropdown-item" href="javascript:showData('')">전체</a>
                  <a class="dropdown-item" href="javascript:showData(1)">장비</a>
                  <a class="dropdown-item" href="javascript:showData(2)">가구</a>
                  <a class="dropdown-item" href="javascript:showData(3)">소모품</a>
                  <a class="dropdown-item" href="javascript:showData(4)">기타</a>
                </div>
              </div>
              <div class="dropdown">
                <button id="alignment" class="btn dropbtn" style="height: 40px;">최신순 ▼</button><!--눌렀을때 효과-->
                <div class="dropdown-content">
                  <a class="dropdown-item" href="javascript:alignData('')">최신순</a>
                  <a class="dropdown-item" href="javascript:alignData(1)">인기순</a>
                </div>
              </div>
            </div>         
            <!-- 거래게시판 물품 목록 -->
            <div id="div_tranlist" class="col-12 my-3" style="padding:0px 0px 0px 0px;">
            
              <c:forEach var="marketboard" items="${marketBoards}">
	              <div class="col-3 float-left mb-5">
	                <div class="card">
	                  <div class="embed-responsive embed-responsive-4by3">
	                    <a href="marketDetail?marketNo=${marketboard.marketNo}">
	                    	<img id="marketListImg" src="/community/market/getMarketImage?marketNo=${marketboard.marketNo}&img=0" class="card-img-top row-cols-1 embed-responsive-item" style=""/>
	                    </a>
	                  </div>
	                  <div class="card-body" style="padding: 1rem;">
	                  	<div class="float-right recommentCount">
	                  		<c:if test= "${marketboard.marketSaleYN eq 0}">
	                  			<p class="border border-secondary px-3 py-1 text-dark rounded">거래완료</p>
	                  		</c:if> 
	                    </div>
	                    <p style="margin-bottom: 0px;">${marketboard.marketTitle}</p>
	                    <p style="margin-bottom: 7px; font-weight: bold;"><span>${marketboard.marketPrice}</span>원</p>                 
 	                    <div class="float-right recommentCount">
	                    	<span>관심 </span><span> ${marketboard.marketLikeCount}</span>
	                    	<p>조회수 <span> ${marketboard.marketHitCount}</span></p>
	                    </div>
	                    <input id="marketWriter${marketboard.marketNo}" type="hidden" name="freeNo" value="${marketboard.marketWriter}"/>
	                    <p style="margin-bottom: 0px; font-size:15px;">${marketboard.userDto.userNickname} </p>
	                    <p style="margin-bottom: 0px; font-size:15px;">
	                    	<fmt:formatDate value="${marketboard.marketRegistDate}" pattern="yyyy-MM-dd" />
	                    </p>
	                  </div>
	                </div>
	              </div>
              </c:forEach>  
            </div>       

            <!-- 글쓰기 버튼 -->
            <div class="col-12 d-flex align-content-end justify-content-end">
              <a href="gotoInsert" type="button" class="btn btn-outline-dark border p-2 m-1" style="font-size: 20px; width:90px;">글쓰기</a>
            </div>
            
            <!-- 페이지 & 검색 -->
            <div class="col-12 d-flex flex-column align-content-center justify-content-center" >
				<!-- 페이지 처리 -->
                <div class="pt-3 my-3">
                  <ul class="pagination justify-content-center mb-0" style="display: flex">
	               	<li class="page-item">
						<a class="page-link" href="list?pageNo=1">First</a>
					</li>
					<c:if test="${pager.groupNo>1}">
						<li class="page-item">
							<a class="page-link" href="list?pageNo=${pager.startPageNo-1}">Previous</a>
						</li>
					</c:if>
                    
                    <c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}"><!-- 시작 페이지부터 마지막 페이지까지 반복 -->
						<c:if test="${pager.pageNo != i}">
							<li class="page-item">
								<a class="page-link" href="list?pageNo=${i}">${i}</a>
							</li>
						</c:if>
						<c:if test="${pager.pageNo == i}">
							<li class="page-item active">
								<a class="page-link" href="list?pageNo=${i}">${i}</a>
							</li>
						</c:if>
					</c:forEach>
					<c:if test="${pager.groupNo<pager.totalGroupNo}">
						<li class="page-item">
	                      <a class="page-link" href="list?pageNo=${pager.endPageNo+1}">Next</a>
	                    </li>
					</c:if>
					<li class="page-item">
	                	<a class="page-link" href="list?pageNo=${pager.totalPageNo}">Last</a>
	                </li>
                  </ul>
                </div>
                <div>
                
                </div>
              <form id="searchForm" action="" class="form-inline my-2 my-lg-0 justify-content-center" enctype="multipart/form-data">
                  <select id="selectBox" class="p-2 border rounded m-1" id="searchType" name="searchType">
                    <!-- <option value="제목+내용" selected>제목+내용</option> -->
                    <option value="내용">내용</option>
                    <option value="제목" selected>제목</option>
                  </select>
                  <input
                    class="form-control"
                    style="padding:9px;"
                    type="text"
                    id="searchContent"
                    name="searchContent"
                    placeholder="검색어를 입력해 주세요."
                    aria-label="Search"
                    width="300"
                  />
                  <button type="button" class="btn btn-outline-info p-2 m-1" style="width:80px;" onclick="searchBtn()">
                    검색
                  </button>
                </form>
            </div>
            </div>           
          <div class="col-2"></div>
        </div>
      </div>
    </section>
    <script type="text/javascript">
    	var num = 0;

    	//검색 버튼 눌렀을 때
    	function searchBtn(){
    		//formData 가져오기
        	var form = document.getElementById("searchForm");
            var formData = new FormData(form);

            formData.append("category", alignarray.category);
            console.log(alignarray.category);
            formData.append("align", alignarray.align);

            $.ajax({
            	method:'POST',
            	url: "/community/market/listJson",
            	data: formData,
            	contentType: false,
            	processData:false            	
            }).done((data)=>{
            	
				console.log(data);
				var html = '';
				$.each(data.marketboardsList, function (index, item) {
					html += '  <div class="col-3 float-left mb-3">';
					html += '	<div class="card">';
					html += '	  <div class="embed-responsive embed-responsive-4by3">';
					html += '		<a href="marketDetail?marketNo='+item.marketNo+'&category='+data.category+'&align='+data.align+'&searchContent='+data.searchContent+'&searchType='+data.searchType+'">';
					html += '			<img src="/community/market/getMarketImage?marketNo='+item.marketNo+'&img=0" class="card-img-top row-cols-1 embed-responsive-item"/>';
					html += '		</a>';
					html += '	  </div>';
					html += '	  <div class="card-body" style="padding: 1rem;">';
					html += '		<div class="float-right recommentCount">';
					html += '		</div>';
					html += '		<p style="margin-bottom: 0px;">'+item.marketTitle+'</p>';
					html += '		<p style="margin-bottom: 7px; font-weight: bold;"><span>'+item.marketPrice+'</span>원</p>';
					html += '		<div class="float-right recommentCount">';
					html += '			<span>관심 </span><span> '+item.marketLikeCount+'</span>';
					html += '			<p>조회수 <span> '+item.marketHitCount+'</span></p>';
					html += '		</div>';
					html += '		<input id="marketWriter'+item.marketNo+'" type="hidden" name="freeNo" value="'+item.marketWriter+'"/>';
					html += '		<p style="margin-bottom: 0px; font-size:15px;">'+item.userDto.userNickname+' </p>';
					html += '		<p style="margin-bottom: 0px; font-size:15px;">'+item.stringRegistDate+'</p>';
					html += '	  </div>';
					html += '	</div>';
					html += '  </div>';
				});
				$("#div_tranlist").html(html);	
				
				//card가 들어가는 엘리먼트 아이디로 가져오기
				const div_tranlist = document.getElementById("div_tranlist");
				var html = '';
				html += '<div class="p-4 text-center">';
				html += 	'<div style="display:inline-block;"><h5> 해당 검색어의 게시물은 존재하지 않습니다. </h5></div>';		
				html += '</div>';
				if(div_tranlist.childElementCount == 0){
					$("#div_tranlist").html(html);
					$(".pagination").css("display","none");
				}else{
					$(".pagination").css("display","flex");
				}
            })            
            
    	}
    	
    	function alignData(num){
	        alignarray.align = num;
	        console.log(alignarray.align);
	        
	        //searchType이랑 searchContent 내용 json에 포함하기.
	        
	        const searchContent = document.getElementById('searchContent').value;
	        console.log("searchContent: "+searchContent);
	        alignarray.searchType = $("#selectBox option:selected").val();
	        alignarray.searchContent = searchContent;
	        
	        if(alignarray.align==1){
	        	$('#alignment').html('인기순 ▼');
	        }else{
	        	$('#alignment').html('최신순 ▼');
	        }
	        
			$.ajax({
				url: "/community/market/listJson",
				data: alignarray,
				method:"post",
				dataType:'json'
			})
			.done((data)=>{
				console.log(data);
				var html = '';
				$.each(data.marketboardsList, function (index, item) {
					html += '  <div class="col-3 float-left mb-3">';
					html += '	<div class="card">';
					html += '	  <div class="embed-responsive embed-responsive-4by3">';
					html += '		<a href="marketDetail?marketNo='+item.marketNo+'&category='+data.category+'&align='+data.align+'&searchContent='+data.searchContent+'&searchType='+data.searchType+'">';
					html += '			<img src="/community/market/getMarketImage?marketNo='+item.marketNo+'&img=0" class="card-img-top row-cols-1 embed-responsive-item"/>';
					html += '		</a>';
					html += '	  </div>';
					html += '	  <div class="card-body" style="padding: 1rem;">';
					html += '		<div class="float-right recommentCount">';
					html += '		</div>';
					html += '		<p style="margin-bottom: 0px;">'+item.marketTitle+'</p>';
					html += '		<p style="margin-bottom: 7px; font-weight: bold;"><span>'+item.marketPrice+'</span>원</p>';
					html += '		<div class="float-right recommentCount">';
					html += '			<span>관심 </span><span> '+item.marketLikeCount+'</span>';
					html += '			<p>조회수 <span> '+item.marketHitCount+'</span></p>';
					html += '		</div>';
					html += '		<input id="marketWriter'+item.marketNo+'" type="hidden" name="freeNo" value="'+item.marketWriter+'"/>';
					html += '		<p style="margin-bottom: 0px; font-size:15px;">'+item.userDto.userNickname+' </p>';
					html += '		<p style="margin-bottom: 0px; font-size:15px;">'+item.stringRegistDate+'</p>';
					html += '	  </div>';
					html += '	</div>';
					html += '  </div>';
				});
				$("#div_tranlist").html(html);
				
				//card가 들어가는 엘리먼트 아이디로 가져오기
				const div_tranlist = document.getElementById("div_tranlist");
				var html = '';
				html += '<div class="p-4 text-center">';
				html += 	'<div class="" style="display:inline-block;"><h5> 해당 카테고리의 게시물은 존재하지 않습니다. </h5></div>';
				html += '</div>';
				if(div_tranlist.childElementCount == 0){
					$("#div_tranlist").html(html);
					$(".pagination").css("display","none");
				}else{
					$(".pagination").css("display","flex");
				}
			})
    	}
	    
	   	function showData(num){

	        alignarray.category = num;
	        console.log(alignarray);
	        
	        if(!alignarray.searchContent){	//비어있다면
		        //searchType이랑 searchContent 내용 json에 포함하기.
		        const searchContent = document.getElementById('searchContent').value;
		        alignarray.searchType = $("#selectBox option:selected").val();
		        alignarray.searchContent = searchContent;	        	
	        }

	        
	        if(num==1){
	        	$('#categorySpan').html('장비');
	        }else if(num==2){
	        	$('#categorySpan').html('가구');
	        }else if(num==3){
	        	$('#categorySpan').html('소모품');
	        }else if(num==4){
	        	$('#categorySpan').html('기타');
	        }else{
	        	$('#categorySpan').html('전체');
	        }
	        
	        if(alignarray.align==1){
	        	$('#alignment').html('인기순 ▼');
	        }else{
	        	$('#alignment').html('최신순 ▼');
	        }

			$.ajax({
				url: "/community/market/listJson",
				data: alignarray,
				method:"post",
				dataType:'json'
			})
			.done((data)=>{
				console.log(data);
				var html = '';
				$.each(data.marketboardsList, function (index, item) {
					html += '  <div class="col-3 float-left mb-3">';
					html += '	<div class="card">';
					html += '	  <div class="embed-responsive embed-responsive-4by3">';
					html += '		<a href="marketDetail?marketNo='+item.marketNo+'&category='+data.category+'&align='+data.align+'&searchContent='+data.searchContent+'&searchType='+data.searchType+'">';
					html += '			<img src="/community/market/getMarketImage?marketNo='+item.marketNo+'&img=0" class="card-img-top row-cols-1 embed-responsive-item"/>';
					html += '		</a>';
					html += '	  </div>';
					html += '	  <div class="card-body" style="padding: 1rem;">';
					html += '		<div class="float-right recommentCount">';
					html += '		</div>';
					html += '		<p style="margin-bottom: 0px;">'+item.marketTitle+'</p>';
					html += '		<p style="margin-bottom: 7px; font-weight: bold;"><span>'+item.marketPrice+'</span>원</p>';
					html += '		<div class="float-right recommentCount">';
					html += '			<span>관심 </span><span> '+item.marketLikeCount+'</span>';
					html += '			<p>조회수 <span> '+item.marketHitCount+'</span></p>';
					html += '		</div>';
					html += '		<input id="marketWriter'+item.marketNo+'" type="hidden" name="freeNo" value="'+item.marketWriter+'"/>';
					html += '		<p style="margin-bottom: 0px; font-size:15px;">'+item.userDto.userNickname+' </p>';
					html += '		<p style="margin-bottom: 0px; font-size:15px;">'+item.stringRegistDate+'</p>';
					html += '	  </div>';
					html += '	</div>';
					html += '  </div>';
				});
				$("#div_tranlist").html(html);
				
				//card가 들어가는 엘리먼트 아이디로 가져오기
				const div_tranlist = document.getElementById("div_tranlist");
				var html = '';
				html += '<div class="p-4 text-center">';
				html += 	'<div class="" style="display:inline-block;"><h5> 해당 카테고리의 게시물은 존재하지 않습니다. </h5></div>';
				html += '</div>';
				if(div_tranlist.childElementCount == 0){
					$("#div_tranlist").html(html);
					$(".pagination").css("display","none");
				}else{
					$(".pagination").css("display","flex");
				}
			})

      	}
    </script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>