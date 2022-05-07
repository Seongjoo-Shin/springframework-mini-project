<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script>
	function fn_delete(marketNo){
		swal("찜목록에서 삭제하시겠습니까?", {
			dangerMode: true,
			buttons: true,
		}).then((result) => {
			if(result == true){
				var xhr = new XMLHttpRequest(); 

		        xhr.open("POST", "/mypage/deleteLikeMarket", true);
		        xhr.setRequestHeader("Content-Type", "application/json");
		        xhr.send(marketNo);

		        xhr.onreadystatechange = function() {
		        	if (xhr.readyState === 4) {
		            	if (xhr.status === 200) {
		            		swal("좋아요가 취소되었습니다.").then(() => {
								location.reload();	
							});
		            	}
		          	}
		        };
			}
			
		});
	}
</script>
    <section style="flex-grow:1;">
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
                    <div class="row <c:if test='${total < 1}'>mb-5</c:if>">
                        <ul class="nav nav-tabs">
                            <li class="nav-item" role="presentation">
                                <a class="nav-link h5 text-dark" role="tab" aria-selected="false" href="/mypage/prefer/buildingprefer">인수</a>
                            </li>
                            <li class="nav-item" role="presentation">
                                 <a class="nav-link h5 text-dark active" role="tab" aria-selected="true" href="/mypage/prefer/marketprefer">거래</a>
                            </li>
                        </ul>
                        <span style="width: 88%; border-bottom: 1px solid gray;"></span>
                    </div>
                    <div class="row" style="margin-top: 2rem!important;">
                    <c:if test="${total > 0}">
                    <c:forEach var="market" items="${markets}">
                    	<div class="col-3 float-left mb-5">
	                        <div class="card">
	                            <div class="card-body">
	                                <img class="border rounded" src="/mypage/getMarketImage?marketNo=${market.marketNo}" width="250px" height="200px"/>
	                                <div class="information">
	                                    <a class="text-dark" href="/community/market/marketDetail?marketNo=${market.marketNo}&from=mypage">${market.marketTitle }</a><br>
	                                    <span>${market.marketWriter }</span><br>
	                                    <div class="float-right"><a href="#" onclick="fn_delete('${market.marketNo}');"><img src="/resources/images/like.png" /></a></div>
	                                    <span>${market.marketPrice}</span><br>
	                                    <span><fmt:formatDate value="${market.marketRegistDate }" pattern="yyyy-MM-dd"/></span><br>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
                    </c:forEach>
                    </c:if>
                     <c:if test="${total < 1}">
                     	<div class="row text-center mt-5" style="margin:0 auto;">
                     	<h5>찜한 거래 게시물이 존재하지 않습니다.</h5>
                     	</div>
                     </c:if>
                    </div>
                    <div class="row mb-5">
                        <div class="col-12">
                            <div class="row  d-flex justify-content-center">
                                <c:if test="${total > 0}">
	                            <ul class="pagination justify-content-center mb-5">
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
    