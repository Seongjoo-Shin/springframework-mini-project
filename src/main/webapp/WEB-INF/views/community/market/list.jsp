<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<script>
	var pageNo = `${pageNo}`;
	
	//페이지 로드되고 실행
	$(document).ready(function(){
		
		//card가 들어가는 엘리먼트 아이디로 가져오기
		const div_tranlist = document.getElementById("div_tranlist");
		var html = '';
		html += '<div class="p-4 text-center">';
		html += 	'<div class="" style="display:inline-block;"><h5> 해당 카테고리의 게시물은 존재하지 않습니다. </h5></div>';
		html += '</div>';
		if(div_tranlist.childElementCount == 1){
			$("#div_tranlist").html(html);
			$(".pagination").css("display","none");
		}else{
			$(".pagination").css("display","flex");
		}
		
		//넘어온 검색 타입이 내용이었다면 변경
		if(`${pager.searchType}` == '내용'){
			$("#searchType").val("내용").prop("selected", true);
		}
		
		//넘어온 카테고리 타입에 따라 btn 변경
		if(`${pager.category}` == 1){
			$("#categorySpan").html("장비");
		}else if(`${pager.category}` == 2){
			$("#categorySpan").html("가구");
		}else if(`${pager.category}` == 3){
			$("#categorySpan").html("소모품");
		}else if(`${pager.category}` == 4){
			$("#categorySpan").html("기타");
		}
		
		console.log("정렬: "+`${pager.align}`);
		
		//최신순, 인기순 클릭했을 때 btn 변경
 		if(`${pager.align}` == "a1"){
 			console.log(true);
			$("#alignmentBtn").html("인기순▼");
		}else{
			$("#alignmentBtn").html("최신순▼");
		} 

	});
	
</script>
<section style="flex-grow: 1;">
		<div class="d-flex align-items-center justify-content-center mb-5">
			<img alt="" src="${pageContext.request.contextPath}/resources/images/marketBoard.png" style="width: 100%">
		</div>
		<div class="container-fluid my-5">
			<div class="row">
				<div class="col-2"></div>
				<div class="col-8 row">
				<form id="searchForm" action="" enctype="multipart/form-data" style="width:100%;">
					<div class="minimenu my-3 pb-4" style="border-bottom: solid 2px rgb(138, 138, 138); font-size: 24px;">
						<div class="dropdown">
							<button id="categoryBtn" class="btn dropbtn" style="height: 40px">
								<img src="${pageContext.request.contextPath}/resources/images/stick.png" style="height: 15px; width: 15px;" class="mr-2">카테고리 > <span id="categorySpan"> 전체</span>
							</button>
							<!--눌렀을때 효과-->
							<div class="dropdown-content">
								<a class="dropdown-item" id="0" onclick="clickCategory(this.id)">전체</a>
								<a class="dropdown-item" id="1" onclick="clickCategory(this.id)">장비</a>
								<a class="dropdown-item" id="2" onclick="clickCategory(this.id)">가구</a>
								<a class="dropdown-item" id="3" onclick="clickCategory(this.id)">소모품</a>
								<a class="dropdown-item" id="4" onclick="clickCategory(this.id)">기타</a>
								<input id="category" name="category" type="hidden" value="${pager.category}" />
							</div>
						</div>
						<div class="dropdown">
							<button id="alignmentBtn" class="btn dropbtn" style="height: 40px;">최신순 ▼</button>
							<!--눌렀을때 효과-->
							<div class="dropdown-content">
								<a class="dropdown-item" id="a0" onclick="clickAlign(this.id)">최신순</a>
								<a class="dropdown-item" id="a1" onclick="clickAlign(this.id)">인기순</a>
								<input id="align" name="align" type="hidden" value="${pager.align}" />
							</div>
						</div>
					</div>
					<!-- 거래게시판 물품 목록 -->
					<div id="boardList">
						<div id="div_tranlist" class="my-3" style="padding: 0px 0px 0px 0px;">
							<c:forEach var="marketboard" items="${marketBoards}">
								<div class="col-3 float-left mb-5">
									<div class="card">
										<div class="embed-responsive embed-responsive-4by3">
											<button type="button"
												onclick="marketDetail(this.id)" id="${marketboard.marketNo}"
												style="border: 0; outline:0;">
												<img id="marketListImg"
												src="/community/market/getMarketImage?marketNo=${marketboard.marketNo}&img=0"
												class="card-img-top row-cols-1 embed-responsive-item"
												style="" />
											</button>
										</div>
										<div class="card-body" style="padding: 1rem;">
<%-- 											<div class="float-right recommentCount">
												<c:if test="${marketboard.marketSaleYN eq 0}">
													<p class="border border-secondary px-3 py-1 text-dark rounded">거래완료</p>
												</c:if>
											</div> --%>
											<div class="float-right recommentCount mt-3">
												<p id="categoryType${marketboard.marketNo}" class="text-dark" style="margin:0px;"></p>												
												<script>
													if(`${marketboard.marketCategory}` == 1){
														$("#categoryType"+${marketboard.marketNo}).text("장비");
													}else if(`${marketboard.marketCategory}` == 2){
														$("#categoryType"+${marketboard.marketNo}).text("가구");
													}else if(`${marketboard.marketCategory}` == 3){
														$("#categoryType"+${marketboard.marketNo}).text("소모품");
													}else if(`${marketboard.marketCategory}` == 4){
														$("#categoryType"+${marketboard.marketNo}).text("기타");
													}
												</script>
												<span>관심 </span><span> ${marketboard.marketLikeCount}</span>
												<p>
													조회수 <span> ${marketboard.marketHitCount}</span>
												</p>
											</div>
											<p style="margin-bottom: 0px; font-weight: bold;">${marketboard.marketTitle}</p>
											<p style="margin-bottom: 7px; font-weight: bold;">
												<span>${marketboard.marketPrice}</span>원
											</p>
											<input id="marketWriter${marketboard.marketNo}" type="hidden" name="freeNo" value="${marketboard.marketWriter}" />
											<p style="margin-bottom: 0px; font-size: 15px;">${marketboard.userDto.userNickname}</p>
											<p style="margin-bottom: 0px; font-size: 15px;">
												<fmt:formatDate value="${marketboard.marketRegistDate}" pattern="yyyy-MM-dd" />
											</p>
										</div>
									</div>
								</div>
							</c:forEach>
							<input id="marketNo" name="marketNo" type="hidden"/>
						</div>

						<!-- 글쓰기 버튼 -->
						<div class="col-12 d-flex align-content-end justify-content-end">
							<a href="gotoInsert" type="button" class="btn btn-outline-dark border pt-1 mt-1" style="font-size: 20px; width: 90px;">글쓰기</a>
						</div>

						<!-- 페이지 & 검색 -->
						<div class="col-12 d-flex flex-column align-content-center justify-content-center">
							<!-- 페이지 처리 -->
							<ul class="pagination justify-content-center mb-0" style="display: flex">
								<li class="page-item"><button type="button" class="page-link" id="1" onclick="pageMove(this.id)">First</button></li>
								<c:if test="${pager.groupNo>1}">
									<li class="page-item"><button type="button" class="page-link" id = "${pager.startPageNo-1}" onclick="pageMove(this.id)">Previous</button></li>
								</c:if>

								<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
									<!-- 시작 페이지부터 마지막 페이지까지 반복 -->
									<c:if test="${pager.pageNo != i}">
										<li class="page-item"><button type="button" class="page-link" id="${i}" onclick="pageMove(this.id)">${i}</button></li>
									</c:if>
									<c:if test="${pager.pageNo == i}">
										<li class="page-item active"><button type="button" class="page-link" id="${i}" onclick="pageMove(this.id)">${i}</button></li>
									</c:if>
								</c:forEach>
								<c:if test="${pager.groupNo<pager.totalGroupNo}">
									<li class="page-item"><button type="button" class="page-link" id="${pager.endPageNo+1}" onclick="pageMove(this.id)">Next</button></li>
								</c:if>
								<li class="page-item"><button type="button" class="page-link" id="${pager.totalPageNo}" onclick="pageMove(this.id)">Last</button></li>
							</ul>
							<input name="pageNo" id="pageNo" type="hidden" value="${pageNo}"/>
						</div>
						<div class="form-inline my-2 my-lg-0 justify-content-center">
							<select id="selectBox" class="p-2 border rounded m-1" id="searchType" name="searchType">
								<!-- <option value="제목+내용" selected>제목+내용</option> -->
								<option value="내용">내용</option>
								<option value="제목" selected>제목</option>
							</select> 
							<input class="form-control" style="padding: 9px;" type="text" id="searchContent" name="searchContent"
								placeholder="검색어를 입력해 주세요." aria-label="Search" width="300" value="${pager.searchContent}"/>
							<button type="button" class="btn btn-outline-info p-2 m-1" style="width: 80px;" onclick="clickSearchBtn()">검색</button>	
						</div>
					</div>
					<!-- #boardList 끝 -->
					</form>
				</div>
				<div class="col-2"></div>
			</div>
		</div>

</section>
<script type="text/javascript">
		
		//카테고리 선택
	   	function clickCategory(cat){
	   		$("#category").attr("value",cat);
	   		$("#pageNo").attr("value", "1");
	   		submitMarketForm();
	   		
	        if(cat==1){
	        	$('#categorySpan').html('장비');
	        }else if(cat==2){
	        	$('#categorySpan').html('가구');
	        }else if(cat==3){
	        	$('#categorySpan').html('소모품');
	        }else if(cat==4){
	        	$('#categorySpan').html('기타');
	        }else{
	        	$('#categorySpan').html('전체');
	        }
	   	}
	   	
		//최신순 인기순 변경
	   	function clickAlign(al){
	   		$("#align").attr("value",al);
	   		$("#pageNo").attr("value", "1");
	   		submitMarketForm();
	   		
	        if(al==1){
	        	$('#alignment').html('인기순 ▼');
	        }else{
	        	$('#alignment').html('최신순 ▼');
	        }	   		
	   	}
	   	
		//검색 버튼 클릭
	   	function clickSearchBtn() {
	   		$("#pageNo").attr("value", "1");
	   		submitMarketForm();
		}
	   	
		//form으로 market 내용 보냄
	   	function submitMarketForm(){
	   		let form = document.getElementById('searchForm');
	   		
	   		form.action = 'list';
	   		form.method = 'POST';

	   		form.submit();
	   	}
	   	
		//페이지 변경
	   	function pageMove(pno) {
			$("#pageNo").attr("value",pno);
			console.log("p : " + $("#pageNo").attr("value"));
			console.log(pno);
			submitMarketForm();
		}
	   	
		//view 
	   	function marketDetail(mid) {
			let form = document.getElementById('searchForm');
	   		
	   		form.action = 'marketDetail';
	   		form.method = 'POST';
	   		
	   		$("#marketNo").attr("value", mid);

	   		form.submit();
		}
    </script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>