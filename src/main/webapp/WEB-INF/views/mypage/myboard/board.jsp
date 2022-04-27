<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <script>
        function selectAll(selectAll)  {
            const checkboxes = document.querySelectorAll('input[type="checkbox"]');
            
            checkboxes.forEach((checkbox) => {
                checkbox.checked = selectAll.checked
            })
        }
    </script>
    <section>
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
                            <tr>
                                <td class="text-center bg-light"><span>10</span></td>
                                <td><a href="/community/board/boardDetail" class="text-dark">제목제목제목제목제목제목제목제목제목</a></td>
                                <td class="text-center">날짜</td>
                                <td class="text-center"><button class="btn btn-sm btn-outline-dark">수정</button></td>
                                <td class="text-center"><input type="checkbox" class="delete"></td>
                            </tr>
                            <tr>
                                <td class="text-center bg-light"><span>9</span></td>
                                <td><a href="#" class="text-dark">제목제목제목제목제목제목제목제목제목</a></td>
                                <td class="text-center">날짜</td>
                                <td class="text-center"><button class="btn btn-sm btn-outline-dark">수정</button></td>
                                <td class="text-center"><input type="checkbox" class="delete"></td>
                            </tr>
                            <tr>
                                <td class="text-center bg-light"><span>8</span></td>
                                <td><a href="#" class="text-dark">제목제목제목제목제목제목제목제목제목</a></td>
                                <td class="text-center">날짜</td>
                                <td class="text-center"><button class="btn btn-sm btn-outline-dark">수정</button></td>
                                <td class="text-center"><input type="checkbox" class="delete"></td>
                            </tr>
                            <tr>
                                <td class="text-center bg-light"><span>7</span></td>
                                <td><a href="#" class="text-dark">제목제목제목제목제목제목제목제목제목</a></td>
                                <td class="text-center">날짜</td>
                                <td class="text-center"><button class="btn btn-sm btn-outline-dark">수정</button></td>
                                <td class="text-center"><input type="checkbox" class="delete"></td>
                            </tr>
                            <tr>
                                <td class="text-center bg-light"><span>6</span></td>
                                <td><a href="#" class="text-dark">제목제목제목제목제목제목제목제목제목</a></td>
                                <td class="text-center">날짜</td>
                                <td class="text-center"><button class="btn btn-sm btn-outline-dark">수정</button></td>
                                <td class="text-center"><input type="checkbox" class="delete"></td>
                            </tr>
                            <tr>
                                <td class="text-center bg-light"><span>5</span></td>
                                <td><a href="#" class="text-dark">제목제목제목제목제목제목제목제목제목</a></td>
                                <td class="text-center">날짜</td>
                                <td class="text-center"><button class="btn btn-sm btn-outline-dark">수정</button></td>
                                <td class="text-center"><input type="checkbox" class="delete"></td>
                            </tr>
                            <tr>
                                <td class="text-center bg-light"><span>4</span></td>
                                <td><a href="#" class="text-dark">제목제목제목제목제목제목제목제목제목</a></td>
                                <td class="text-center">날짜</td>
                                <td class="text-center"><button class="btn btn-sm btn-outline-dark">수정</button></td>
                                <td class="text-center"><input type="checkbox" class="delete"></td>
                            </tr>
                            <tr>
                                <td class="text-center bg-light"><span>3</span></td>
                                <td><a href="#" class="text-dark">제목제목제목제목제목제목제목제목제목</a></td>
                                <td class="text-center">날짜</td>
                                <td class="text-center"><button class="btn btn-sm btn-outline-dark">수정</button></td>
                                <td class="text-center"><input type="checkbox" class="delete"></td>
                            </tr>
                            <tr>
                                <td class="text-center bg-light"><span>2</span></td>
                                <td><a href="#" class="text-dark">제목제목제목제목제목제목제목제목제목</a></td>
                                <td class="text-center">날짜</td>
                                <td class="text-center"><button class="btn btn-sm btn-outline-dark">수정</button></td>
                                <td class="text-center"><input type="checkbox" class="delete"></td>
                            </tr>
                            <tr>
                                <td class="text-center bg-light"><span>1</span></td>
                                <td><a href="#" class="text-dark">제목제목제목제목제목제목제목제목제목</a></td>
                                <td class="text-center">날짜</td>
                                <td class="text-center"><button class="btn btn-sm btn-outline-dark">수정</button></td>
                                <td class="text-center"><input type="checkbox" class="delete"></td>
                            </tr>
                        </table>
                    </div>
                    <div class="row float-right">
                        <div class="mr-4">
                            <input type="button" value="삭제" class="float-right btn btn-sm btn-outline-danger"/>
                        </div>
                    </div>
                    <div class="row d-flex justify-content-center">
                        <ul class="pagination">
                            <li class="page-item"><a class="page-link text-dark" href="#"><</a></li>
                            <li class="page-item"><a class="page-link text-dark" href="#">1</a></li>
                            <li class="page-item"><a class="page-link text-dark" href="#">2</a></li>
                            <li class="page-item"><a class="page-link text-dark" href="#">3</a></li>
                            <li class="page-item"><a class="page-link text-dark" href="#">4</a></li>
                            <li class="page-item"><a class="page-link text-dark" href="#">5</a></li>
                            <li class="page-item"><a class="page-link text-dark" href="#">></a></li>
                        </ul>
                    </div>
                    <div class="pt-3 my-3">
                  <ul class="pagination justify-content-center mb-0">
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
                </div>
                <div class="col-2">
                    
                </div>
            </div>
        </div>
    </section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>