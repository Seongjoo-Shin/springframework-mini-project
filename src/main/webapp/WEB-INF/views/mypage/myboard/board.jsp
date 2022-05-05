<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <script>
        function selectAll(selectAll)  {
            document.querySelectorAll('input[type="checkbox"]').forEach((checkbox) => {
                checkbox.checked = selectAll.checked
            })
        }
        
        function fn_checkedDel(){
        	var cnt = document.querySelectorAll("input[name='freeNo']:checked").length;
        	swal(cnt + "개의 게시물을 삭제하시겠습니까?", {
    			dangerMode: true,
    			buttons: true,
    		}).then((result) => {
    			if(result == true){
    				var arr = new Array();
    				document.querySelectorAll("input[name='freeNo']:checked").forEach(function(v, i) {
    					arr.push(v.id)
    				})
                	if(cnt == 0){
        				swal("선택된 게시물이 없습니다.");
                	} else {
                		$.ajax({
                			type: 'POST',
                			url: '/mypage/myboard/delete',
                			dataType: 'json',
                			data: {delArr: arr},
                		}).done((data) => {
                			swal(data.message).then(() => {
            					location.reload();	
            				});
                		}).fail((data) => {
                		});
                	}
    			} else {
    				document.querySelectorAll(".delete:checked").forEach(function(v, i) {
    				    v.checked = false;
    				});
    			}
    		});
        }
    </script>
    <section style="flex-grow:1;">
        <div class="container-fluid h-100 mt-5 mb-5">
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
                    <div class="row" style="border-bottom: 1px solid black;">
                        <ul class="nav nav-tabs">
                            <li class="nav-item">
                                <a class="nav-link active h5 text-dark" href="/mypage/myboard/board">자유게시판</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link h5 text-dark"  href="/mypage/myboard/market">거래게시판</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link h5 text-dark" href="/mypage/myboard/building">인수/매물</a>
                            </li>
                        </ul>
                    </div>
                    <div class="row">
                        <table class="table table-hover">
                            <tr class="text-center bg-light">
                                <th>번호</th>
                                <th>제목</th>
                                <th>날짜</th>
                                <th>수정</th>
                                <td><input type="checkbox" class="delete" onclick="selectAll(this)"></td>
                            </tr>
                            <c:forEach items="${boards}" var="board" varStatus="status">
                            	<tr>
                            		<td class="text-center bg-light"><span>${board.freeNo}</span></td>
	                                <td><a href="/community/board/boardDetail?freeNo=${board.freeNo}&from=mypage&pageNo=${pager.pageNo}" class="text-dark">${board.freeTitle}</a></td>
	                                <td class="text-center"><fmt:formatDate value="${board.freeModifyDate}" pattern="yyyy-MM-dd"/></td>
	                                <td class="text-center"><a href="/community/board/update?freeNo=${board.freeNo}&from=mypage" class="btn btn-sm btn-outline-dark">수정</a></td>
	                                <td class="text-center"><input type="checkbox" class="delete" name="freeNo" class="delete_box" id="${board.freeNo}"></td>
                            	</tr>
                            </c:forEach>
                            <c:if test="${total eq 0 }">
                            	<tr>
                            		<td colspan="5" class="text-center"><h5>작성한 게시물이 없습니다.</h5></td>
                            	</tr>
                            	
                            </c:if>
                        </table>
                    </div>
                    <div class="row float-right">
                        <div class="mr-4">
                            <input type="button" value="삭제" class="float-right btn btn-sm btn-outline-danger" onclick="fn_checkedDel();"/>
                        </div>
                    </div>
                    <div class="row d-flex justify-content-center mb-5">
                    <c:if test="${total > 0}">
						<ul class="pagination justify-content-center mb-0">
			               	<li class="page-item">
								<a class="page-link" href="/mypage/myboard/board?pageNo=1">First</a>
							</li>
							<c:if test="${pager.groupNo>1}">
								<li class="page-item">
									<a class="page-link" href="/mypage/myboard/board?pageNo=${pager.startPageNo-1}">Previous</a>
								</li>
							</c:if>
		                    <c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}"><!-- 시작 페이지부터 마지막 페이지까지 반복 -->
								<c:if test="${pager.pageNo != i}">
									<li class="page-item">
										<a class="page-link" href="/mypage/myboard/board?pageNo=${i}">${i}</a>
									</li>
								</c:if>
								<c:if test="${pager.pageNo == i}">
									<li class="page-item active">
										<a class="page-link" href="/mypage/myboard/board?pageNo=${i}">${i}</a>
									</li>
								</c:if>
							</c:forEach>
							<c:if test="${pager.groupNo<pager.totalGroupNo}">
								<li class="page-item">
			                      <a class="page-link" href="/mypage/myboard/board?pageNo=${pager.endPageNo+1}">Next</a>
			                    </li>
							</c:if>
							<li class="page-item">
			                	<a class="page-link" href="/mypage/myboard/board?pageNo=${pager.totalPageNo}">Last</a>
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