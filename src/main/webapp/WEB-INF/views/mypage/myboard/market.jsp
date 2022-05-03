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
	
</script>
<section style="flex-grow:1;">
	<div class="container-fluid h-100 mt-5">
		<div class="row">
			<div class="col-2">
				<div class="p-5 justify-content-center">
					<div class="mt-5">
						<a href="/mypage/modify" class="btn btn-outline-dark w-100 p-2">내
							정보 수정</a>
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
				<div class="row nav-tabs">
					<ul class="nav">
						<li class="nav-item"><a class="nav-link h5 text-dark" href="/mypage/myboard/board">자유게시판</a></li>
						<li class="nav-item"><a class="active nav-link h5 text-dark" href="/mypage/myboard/market">거래게시판</a></li>
						<li class="nav-item"><a class="nav-link h5 text-dark" href="/mypage/myboard/building">인수/매물</a></li>
					</ul>
				</div>
				<c:forEach var="market" items="${markets}">
					<div class="card float-left mr-5 mb-5" style="margin-left: 4rem!important; width:300px;">
						<div class="card-body">
							<img src="http://via.placeholder.com/250X200"/>
							<%-- <a href="/community/market/marketDetail?marketNo=${market.marketNo}&from=mypage"><img src="" width="200px" height="250px"/></a> --%>
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
									<button class="btn btn-outline-dark ml-3 mb-2">거래완료</button>
								</div>
							</div>
							<div class="float-left">
								<p>${market.marketTitle}</p><br>
								<span><img src="${pageContext.request.contextPath}/resources/images/like.png"/>&nbsp;&nbsp;${market.marketLikeCount }</span><br>
								<span>${market.marketCategory}</span><br> 
								<span>${market.marketPrice}</span><br> 
								<span><fmt:formatDate value="${market.marketRegistDate}" pattern="yyyy-MM-dd"/></span>
							</div>
						</div>
					</div>
				</c:forEach>
				<c:if test="${total eq 0}">
					<div class="text-center m-5"><h5>작성한 게시물이 없습니다.</h5></div>
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
