<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <script>
        function selectAll(selectAll)  {
            const checkboxes = document.querySelectorAll('input[type="checkbox"]');
            
            checkboxes.forEach((checkbox) => {
                checkbox.checked = selectAll.checked
            })
        }
        
        function fn_checkedDel(){
        	var cnt = $("input[name='buildingNo']:checked").length;
        	console.log(cnt);
        	
        	var arr = new Array();
        	$("input[name='buildingNo']:checked").each(function(){
        		arr.push($(this).attr('id'));
        	});
        	if(cnt == 0){
				swal("선택된 게시물이 없습니다.");
        	} else {
        		console.log(arr);
        		$.ajax({
        			type: 'POST',
        			url: '/mypage/mybuilding/delete',
        			dataType: 'json',
        			data: {delArr: arr},
        		}).done((data) => {
        		}).fail((data) => {
        		});
        	}
        	location.reload();
        }
    </script>
    <section <c:if test="${total eq 0}">style="margin-bottom: 194px;"</c:if>>
        <div class="container-fluid h-100 mt-5">
            <div class="row">
                <div class="col-2">
                    <div class="p-5 justify-content-center">
                        <div class="mt-5"><a href="/mypage/modify" class="btn btn-outline-dark w-100 p-2">내 정보 수정</a></div>
                        <div class="mt-2"><a href="/mypage/myboard/board" class="active btn btn-outline-dark w-100 p-2">작성글</a></div>
                        <div class="mt-2"><a href="/mypage/message/receive" class="btn btn-outline-dark w-100 p-2">쪽지함</a></div>
                        <div class="mt-2"><a href="/mypage/prefer/buildingprefer" class="btn btn-outline-dark w-100 p-2">찜목록</a></div>
                        <div class="mt-2"><a href="/mypage/withdrawl" class="btn btn-outline-dark w-100 p-2">회원탈퇴</a></div>
                    </div>
                </div>
                <div class="col-8">
                    <h3 class="m-3">작성글</h3>
                    <div class="row">
                        <ul class="nav nav-tabs">
                            <li class="nav-item">
                                <a class="nav-link h5 text-dark" href="/mypage/myboard/board">자유게시판</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link h5 text-dark"  href="/mypage/myboard/market">거래게시판</a>
                            </li>
                            <li class="nav-item">
                                <a class="active nav-link h5 text-dark" href="/mypage/myboard/building">인수/매물</a>
                            </li>
                        </ul>
                    </div>
                    <div class="row">
                        <table class="table table-hover">
                            <thead>
                            <tr class="text-center bg-light">
                                <th>번호</th>
                                <th>매물이름</th>
                                <th>거래종류</th>
                                <th>전용면적</th>
                                <th>등록날짜</th>
                                <th></th>
                                <td><input type="checkbox" onclick="selectAll(this)"></td>
                            </tr>
                            </thead>
                            <tbody>
							<c:forEach var="building" items="${buildings}">
								<tr>
	                                <td class="text-center bg-light"><span>${building.buildingNo}</span></td>
	                                <td><a href="/take/view?buildingNo=${building.buildingNo}&from=mypage&pageNo=${pager.pageNo}" class="text-dark">${building.buildingName}</a></td>
	                                <td class="text-center">${building.buildingTradeInfo }</td>
	                                <td class="text-center">${building.buildingSupplyArea}</td>
	                                <td class="text-center">${building.buildingRegistDate}</td>
	                                <td><button class="btn btn-sm btn-outline-dark">수정</button></td>
	                                <td class="text-center"><input type="checkbox" class="delete" name="buildingNo" class="delete_box" id="${building.buildingNo}"></td>
	                            </tr>
							</c:forEach>
                        </tbody>
                        </table>
                    </div>
                    <div class="row float-right">
                        <div class="mr-3">
                        <c:if test="${total > 0}">
                            <input type="button" value="삭제" class="float-right"/>
                        </c:if>
                        </div>
                    </div>
                    <div class="row d-flex justify-content-center mb-5">
                    <c:if test="${total > 0}">
						<ul class="pagination justify-content-center mb-0">
			               	<li class="page-item">
								<a class="page-link" href="/mypage/myboard/building?pageNo=1">First</a>
							</li>
							<c:if test="${pager.groupNo>1}">
								<li class="page-item">
									<a class="page-link" href="/mypage/myboard/building?pageNo=${pager.startPageNo-1}">Previous</a>
								</li>
							</c:if>
							
		                    <c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}"><!-- 시작 페이지부터 마지막 페이지까지 반복 -->
								<c:if test="${pager.pageNo != i}">
									<li class="page-item">
										<a class="page-link" href="/mypage/myboard/building?pageNo=${i}">${i}</a>
									</li>
								</c:if>
								<c:if test="${pager.pageNo == i}">
									<li class="page-item active">
										<a class="page-link" href="/mypage/myboard/building?pageNo=${i}">${i}</a>
									</li>
								</c:if>
							</c:forEach>
							<c:if test="${pager.groupNo<pager.totalGroupNo}">
								<li class="page-item">
			                      <a class="page-link" href="/mypage/myboard/building?pageNo=${pager.endPageNo+1}">Next</a>
			                    </li>
							</c:if>
							<li class="page-item">
			                	<a class="page-link" href="/mypage/myboard/building?pageNo=${pager.totalPageNo}">Last</a>
			                </li>
	                	</ul>
	                </c:if>
	                </div>
                </div>
                <div class="col-2">
                    
                </div>
            </div>
        </div>
    </section>
    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    