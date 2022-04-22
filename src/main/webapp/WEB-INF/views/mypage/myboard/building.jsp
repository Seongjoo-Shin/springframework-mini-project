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
                        <div class="mt-2"><a href="/mypage/prefer" class="btn btn-outline-dark w-100 p-2">찜목록</a></div>
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
                            <tr>
                                <td class="text-center bg-light"><span>10</span></td>
                                <td><a href="/take/view" class="text-dark">매물 이름, 매물 이름, 매물 이름</a></td>
                                <td class="text-center">임대</td>
                                <td class="text-center">60평</td>
                                <td class="text-center">2022-04-10</td>
                                <td><button class="btn btn-sm btn-outline-dark">수정</button></td>
                                <td class="text-center"><input type="checkbox" class="delete"></td>
                            </tr>
                            <tr>
                                <td class="text-center bg-light"><span>9</span></td>
                                <td><a href="#" class="text-dark">매물 이름, 매물 이름, 매물 이름</a></td>
                                <td class="text-center">매매</td>
                                <td class="text-center">120평</td>
                                <td class="text-center">2022-04-09</td>
                                <td><button class="btn btn-sm btn-outline-dark">수정</button></td>
                                <td class="text-center"><input type="checkbox" class="delete"></td>
                            </tr>
                            <tr>
                                <td class="text-center bg-light"><span>8</span></td>
                                <td><a href="#" class="text-dark">매물 이름, 매물 이름, 매물 이름</a></td>
                                <td class="text-center">임대</td>
                                <td class="text-center">150평</td>
                                <td class="text-center">2022-04-08</td>
                                <td><button class="btn btn-sm btn-outline-dark">수정</button></td>
                                <td class="text-center"><input type="checkbox" class="delete"></td>
                            </tr>
                            <tr>
                                <td class="text-center bg-light"><span>7</span></td>
                                <td><a href="#" class="text-dark">매물 이름, 매물 이름, 매물 이름</a></td>
                                <td class="text-center">매매</td>
                                <td class="text-center">60평</td>
                                <td class="text-center">2022-04-07</td>
                                <td><button class="btn btn-sm btn-outline-dark">수정</button></td>
                                <td class="text-center"><input type="checkbox" class="delete"></td>
                            </tr>
                            <tr>
                                <td class="text-center bg-light"><span>6</span></td>
                                <td><a href="#" class="text-dark">매물 이름, 매물 이름, 매물 이름</a></td>
                                <td class="text-center">임대</td>
                                <td class="text-center">30평</td>
                                <td class="text-center">2022-04-06</td>
                                <td><button class="btn btn-sm btn-outline-dark">수정</button></td>
                                <td class="text-center"><input type="checkbox" class="delete"></td>
                            </tr>
                            <tr>
                                <td class="text-center bg-light"><span>5</span></td>
                                <td><a href="#" class="text-dark">매물 이름, 매물 이름, 매물 이름</a></td>
                                <td class="text-center">매매</td>
                                <td class="text-center">60평</td>
                                <td class="text-center">2022-04-05</td>
                                <td><button class="btn btn-sm btn-outline-dark">수정</button></td>
                                <td class="text-center"><input type="checkbox" class="delete"></td>
                            </tr>
                            <tr>
                                <td class="text-center bg-light"><span>4</span></td>
                                <td><a href="#" class="text-dark">매물 이름, 매물 이름, 매물 이름</a></td>
                                <td class="text-center">임대</td>
                                <td class="text-center">60평</td>
                                <td class="text-center">2022-04-04</td>
                                <td><button class="btn btn-sm btn-outline-dark">수정</button></td>
                                <td class="text-center"><input type="checkbox" class="delete"></td>
                            </tr>
                            <tr>
                                <td class="text-center bg-light"><span>3</span></td>
                                <td><a href="#" class="text-dark">매물 이름, 매물 이름, 매물 이름</a></td>
                                <td class="text-center">매매</td>
                                <td class="text-center">100평</td>
                                <td class="text-center">2022-04-03</td>
                                <td><button class="btn btn-sm btn-outline-dark">수정</button></td>
                                <td class="text-center"><input type="checkbox" class="delete"></td>
                            </tr>
                            <tr>
                                <td class="text-center bg-light"><span>2</span></td>
                                <td><a href="#" class="text-dark">매물 이름, 매물 이름, 매물 이름</a></td>
                                <td class="text-center">임대</td>
                                <td class="text-center">60평</td>
                                <td class="text-center">2022-04-02</td>
                                <td><button class="btn btn-sm btn-outline-dark">수정</button></td>
                                <td class="text-center"><input type="checkbox" class="delete"></td>
                            </tr>
                            <tr>
                                <td class="text-center bg-light"><span>1</span></td>
                                <td><a href="#" class="text-dark">매물 이름, 매물 이름, 매물 이름</a></td>
                                <td class="text-center">매매</td>
                                <td class="text-center">50평</td>
                                <td class="text-center">2022-04-01</td>
                                <td><button class="btn btn-sm btn-outline-dark">수정</button></td>
                                <td class="text-center"><input type="checkbox" class="delete"></td>
                            </tr>
                        </tbody>
                        </table>
                    </div>
                    <div class="row float-right">
                        <div class="mr-3">
                            <input type="button" value="삭제" class="float-right"/>
                        </div>
                    </div>
                    <div class="row d-flex justify-content-center">
                        <ul class="pagination" class="d-flex justify-content-center">
                            <li class="page-item"><a class="page-link text-dark" href="#"><</a></li>
                            <li class="page-item"><a class="page-link text-dark" href="#">1</a></li>
                            <li class="page-item"><a class="page-link text-dark" href="#">2</a></li>
                            <li class="page-item"><a class="page-link text-dark" href="#">3</a></li>
                            <li class="page-item"><a class="page-link text-dark" href="#">4</a></li>
                            <li class="page-item"><a class="page-link text-dark" href="#">5</a></li>
                            <li class="page-item"><a class="page-link text-dark" href="#">></a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-2">
                    
                </div>
            </div>
        </div>
    </section>
    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    