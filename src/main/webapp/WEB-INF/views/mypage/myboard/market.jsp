<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<script>

</script>
<section <c:if test="${total eq 0}">style="margin-bottom: 146px;"</c:if>>
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
					<div class="card float-left mr-5 mb-5" style="margin-left: 4rem!important;">
						<div class="card-body">
							<a href="/community/market/marketDetail?marketNo=${market.marketNo}&from=mypage"><img src=""/></a>
							<div class="button float-right">
								<div>
									<a class="btn btn-outline-dark ml-3 mb-2">수정</a>
								</div>
								<div>
									<a class="btn btn-outline-dark ml-3 mb-2">식제</a>
								</div>
								<div>
									<button class="btn btn-outline-dark ml-3 mb-2">거래완료</button>
								</div>
							</div>
						</div>
						<div class="ml-3 mb-2">
							<p>${market.marketTitle}</p>
							<button class="btn btn-outline-dark float-right mr-5">좋아요</button>
							<span>${market.marketCategory}</span><br> 
							<span>${market.marketPrice}</span><br> 
							<span>${market.marketRegistDate}</span>
						</div>
					</div>
				</c:forEach>
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
