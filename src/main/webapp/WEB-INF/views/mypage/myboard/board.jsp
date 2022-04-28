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
        	var cnt = $("input[name='freeNo']:checked").length;
        	console.log(cnt);
        	
        	var arr = new Array();
        	$("input[name='freeNo']:checked").each(function(){
        		arr.push($(this).attr('id'));
        	});
        	if(cnt == 0){
				swal("선택된 게시물이 없습니다.");
        	} else {
        		console.log(arr);
        		$.ajax({
        			type: 'POST',
        			url: '/mypage/myboard/delete',
        			dataType: 'json',
        			data: {delArr: arr},
        		}).done((data) => {
        		}).fail((data) => {
        		});
        	}
        	location.reload();
        }
    </script>
    <section>
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
                    <div class="row">
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
                                <th>수정</thclass=>
                                <td><input type="checkbox" onclick="selectAll(this)"></tdclass=>
                            </tr>
                            <form action="" id="frm" name="frm" method="post">
                            <c:forEach items="${boards}" var="board" varStatus="status">
                            	<tr>
                            		<td class="text-center bg-light"><span>${board.freeNo}</span></td>
	                                <td><a href="/community/board/boardDetail?freeNo=${board.freeNo}&from=mypage&pageNo=${pager.pageNo}" class="text-dark">${board.freeTitle}</a></td>
	                                <td class="text-center"><fmt:formatDate value="${board.freeModifyDate}" pattern="yyyy-MM-dd"/></td>
	                                <td class="text-center"><button class="btn btn-sm btn-outline-dark">수정</button></td>
	                                <td class="text-center"><input type="checkbox" class="delete" name="freeNo" class="delete_box" id="${board.freeNo}"></td>
                            	</tr>
                            </c:forEach>
                            </form>
                        </table>
                    </div>
                    <div class="row float-right">
                        <div class="mr-4">
                            <input type="button" value="삭제" class="float-right btn btn-sm btn-outline-danger" onclick="fn_checkedDel();"/>
                        </div>
                    </div>
                    <div class="row d-flex justify-content-center mb-5">
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
                    </div>
                </div>
                <div class="col-2">
                    
                </div>
            </div>
        </div>
    </section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>