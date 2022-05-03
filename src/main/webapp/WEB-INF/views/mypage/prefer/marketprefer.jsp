<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script>
	function fn_delete(marketNo){
		$.ajax({
			url: '/mypage/deleteLikeMarket',
			data: {'marketNo': marketNo},
			type: 'POST',
		}).done((data) => {
			window.reload();
		}).fail((data) =>{
			
		});
	}
</script>
    <section>
        <div class="container-fluid h-100 mt-5">
            <div class="row">
                <div class="col-2">
                    <div class="p-5 justify-content-center">
                        <div class="mt-5"><a href="/mypage/modify" class="btn btn-outline-dark w-100 p-2">내 정보 수정</a></div>
                        <div class="mt-2"><a href="/mypage/myboard/board" class="btn btn-outline-dark w-100 p-2">작성글</a></div>
                        <div class="mt-2"><a href="/mypage/message/receive" class="btn btn-outline-dark w-100 p-2">쪽지함</a></div>
                        <div class="mt-2"><a href="/mypage/prefer/buildingprefer" class="active btn btn-outline-dark w-100 p-2">찜목록</a></div>
                        <div class="mt-2"><a href="/mypage/withdrawl" class="btn btn-outline-dark w-100 p-2">회원탈퇴</a></div>
                    </div>
                </div>
                <div class="col-8">
                    <h3 class="m-3">찜 목록</h3>
                    <div class="row">
                        <ul class="nav nav-tabs">
                            <li class="nav-item">
                                <a class="nav-link h5 text-dark" href="/mypage/prefer/buildingprefer">인수</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active h5 text-dark"  href="/mypage/prefer/marketprefer">거래</a>
                            </li>
                        </ul>
                    </div>
                    <c:forEach var="market" items="${markets}">
                    	<div class="col-3 float-left mb-5">
	                        <div class="card">
	                            <div class="card-body">
	                                <img class="border rounded" src="/mypage/getMarketImage?marketNo=${market.marketNo}&type=nomal&img=0" width="100%"/>
	                                <div class="information mr-3">
	                                    <p>${market.marketTitle }</p>
	                                    <span>${market.marketWriter }</span><br>
	                                    <div class="float-right"><a href="#" onclick="fn_delete('${market.marketNo}');"><img src="/resources/images/like.png" /></a></div>
	                                    <span>${market.marketPrice}</span><br>
	                                    <span><fmt:formatDate value="${market.marketRegistDate }" pattern="yyyy-MM-dd"/></span><br>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
                    </c:forEach>
                    
                    <div class="row">
                        <div class="col-12">
                            <div class="row  d-flex justify-content-center">
                                <c:if test="${total > 0}">
	                            <ul class="pagination justify-content-center mb-0">
					               	<li class="page-item">
										<a class="page-link" href="/mypage/prefer/marketprefer?pageNo=1">First</a>
									</li>
									<c:if test="${pager.groupNo>1}">
										<li class="page-item">
											<a class="page-link" href="/mypage/prefer/marketprefer?pageNo=${pager.startPageNo-1}">Previous</a>
										</li>
									</c:if>
				                    <c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}"><!-- 시작 페이지부터 마지막 페이지까지 반복 -->
										<c:if test="${pager.pageNo != i}">
											<li class="page-item">
												<a class="page-link" href="/mypage/prefer/marketprefer?pageNo=${i}">${i}</a>
											</li>
										</c:if>
										<c:if test="${pager.pageNo == i}">
											<li class="page-item active">
												<a class="page-link" href="/mypage/prefer/marketprefer?pageNo=${i}">${i}</a>
											</li>
										</c:if>
									</c:forEach>
									<c:if test="${pager.groupNo<pager.totalGroupNo}">
										<li class="page-item">
					                      <a class="page-link" href="/mypage/prefer/marketprefer?pageNo=${pager.endPageNo+1}">Next</a>
					                    </li>
									</c:if>
									<li class="page-item">
					                	<a class="page-link" href="/mypage/prefer/marketprefer?pageNo=${pager.totalPageNo}">Last</a>
					                </li>
			                	</ul>
			                	</c:if>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-2">

                </div>
            </div>
        </div>
    </section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
    