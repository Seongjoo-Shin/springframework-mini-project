<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<script>
	function fn_checkedDel(marketNo){
		swal("삭제하시겠습니까?", {
			dangerMode: true,
			buttons: true,
		}).then((result) => {
			if(result == true){
				$.ajax({
					type: 'POST',
					url: '/mypage/mymarket/delete',
					dataType: 'json',
					data: {marketNo},
				}).done((data) => {
					swal(data.message).then(() => {
						location.reload();	
					});
				}).fail((data) => {
				});				
			}
		});
	}
	
	function fn_sales(marketNo){
		swal("판매를 완료하시겠습니까?", {
			dangerMode: true,
			buttons: true,
		}).then((result) => {
			if(result == true){
				$.ajax({
					type: 'POST',
					url: '/mypage/mymarket/saleComplete',
					dataType: 'json',
					data: {marketNo},
				}).done((data) => {
					swal(data.message).then(() => {
						location.reload();	
					});
				}).fail((data) => {
				});		
			}
		});
	}
</script>
<section style="flex-grow:1;">
	<div class="container-fluid h-100 mt-5">
		<div class="row">
			<div class="col-2">
				<div class="p-5 justify-content-center">
					<div class="mt-5">
						<a href="/mypage/modify" class="btn btn-outline-dark w-100 p-2">내정보 수정</a>
					</div>
					<div class="mt-2">
						<a href="/mypage/myboard/board"
							class="active btn btn-outline-dark w-100 p-2">작성글</a>
					</div>
					<div class="mt-2">
						<a href="/mypage/message/receive"
							class="btn btn-outline-dark w-100 p-2">쪽지함</a>
					</div>
					<div class="mt-2">
						<a href="/mypage/prefer/buildingprefer" class="btn btn-outline-dark w-100 p-2">찜목록</a>
					</div>
					<div class="mt-2">
						<a href="/mypage/withdrawl" class="btn btn-outline-dark w-100 p-2">회원탈퇴</a>
					</div>
				</div>
			</div>
			<div class="col-8">
				<h3 class="m-3">작성글</h3>
				<div class="row">
					<ul class="nav nav-tabs">
						<li class="nav-item">
							<a class="nav-link h5 text-dark" role="tab" aria-selected="false" href="/mypage/myboard/board">자유게시판</a>
						</li>
						<li class="nav-item">
							<a class="active nav-link h5 text-dark" role="tab" aria-selected="true" href="/mypage/myboard/market">거래게시판</a>
						</li>
						<li class="nav-item">
							<a class="nav-link h5 text-dark" role="tab" aria-selected="false" href="/mypage/myboard/building">인수/매물</a>
						</li>
					</ul>
					<span style="width: 71%; border-bottom: 1px solid gray;"></span>
				</div>
				<c:if test="${total > 0}">
				<div class="row mt-3">
				<c:forEach var="market" items="${markets}">
					<div class="card float-left mr-5 mb-5" style="margin-left: 4rem!important; height: 390px; width:300px;">
						<div class="card-body">
							<a href="/community/market/marketDetail?marketNo=${market.marketNo}&from=mypage"><img src="/mypage/getMarketImage?marketNo=${market.marketNo}" width="250px" height="200px"/></a>
						</div>
						<div class="ml-3 mb-2">
							<div class="button float-right mr-2">
								<div>
									<a href="#lnk" class="btn btn-outline-dark ml-3 mb-2">수정</a>
								</div>
								<div>
									<input type="button" onclick="fn_checkedDel('${market.marketNo}');" class="btn btn-outline-dark ml-3 mb-2" value="삭제"/>
								</div>
								<div>
								<c:if test="${market.marketSaleYN eq 1}">
									<button class="btn btn-outline-dark ml-3 mb-2" onclick="fn_sales('${market.marketNo}')">거래완료</button>
								</c:if>
								<c:if test="${market.marketSaleYN ne 1}">
									<span>거래가 완료된 상품</span>
								</c:if>
								</div>
							</div>
							<div class="float-left">
								<a class="text-dark" href="/community/market/marketDetail?marketNo=${market.marketNo}&from=mypage">${market.marketTitle}</a><br>
								<span><img src="${pageContext.request.contextPath}/resources/images/like.png"/>&nbsp;&nbsp;${market.marketLikeCount }</span><br>
								<c:if test="${market.marketCategory eq '1'}">
									<span>장비</span><br> 
								</c:if>
								<c:if test="${market.marketCategory eq '2'}">
									<span>가구</span><br>
								</c:if>
								<c:if test="${market.marketCategory eq '3'}">
									<span>소모품</span><br>
								</c:if>
								<c:if test="${market.marketCategory eq '4'}">
									<span>기타</span><br>
								</c:if>
								<span>${market.marketPrice}</span><br> 
								<span><fmt:formatDate value="${market.marketRegistDate}" pattern="yyyy-MM-dd"/></span>
							</div>
						</div>
					</div>
				</c:forEach>
				</div>
				</c:if>
				<c:if test="${total eq 0}">
					<div class="row mt-3 justify-content-center">
						<div class="text-center m-5"><h5>작성한 게시물이 없습니다.</h5></div>
					</div>
				</c:if>
			</div>
			
			<div class="col-2"></div>
		</div>
		<div class="row">
			<div class="col-2"></div>
			<div class="col-8">
				<div class="row d-flex justify-content-center mb-5">
				<c:if test="${total > 0}">
					<ul class="pagination justify-content-center mb-0">
		               	<li class="page-item">
							<a class="page-link" href="/mypage/myboard/market?pageNo=1">First</a>
						</li>
						<c:if test="${pager.groupNo>1}">
							<li class="page-item">
								<a class="page-link" href="/mypage/myboard/market?pageNo=${pager.startPageNo-1}">Previous</a>
							</li>
						</c:if>
	                    <c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}"><!-- 시작 페이지부터 마지막 페이지까지 반복 -->
							<c:if test="${pager.pageNo != i}">
								<li class="page-item">
									<a class="page-link" href="/mypage/myboard/market?pageNo=${i}">${i}</a>
								</li>
							</c:if>
							<c:if test="${pager.pageNo == i}">
								<li class="page-item active">
									<a class="page-link" href="/mypage/myboard/market?pageNo=${i}">${i}</a>
								</li>
							</c:if>
						</c:forEach>
						<c:if test="${pager.groupNo<pager.totalGroupNo}">
							<li class="page-item">
		                      <a class="page-link" href="/mypage/myboard/market?pageNo=${pager.endPageNo+1}">Next</a>
		                    </li>
						</c:if>
						<li class="page-item">
		                	<a class="page-link" href="/mypage/myboard/market?pageNo=${pager.totalPageNo}">Last</a>
		                </li>
                	</ul>
                </c:if>	
                </div>
			</div>
			<div class="col-2"></div>
		</div>
	</div>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
