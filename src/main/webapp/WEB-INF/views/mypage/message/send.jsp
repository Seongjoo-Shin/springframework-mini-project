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
                        <div class="mt-2"><a href="/mypage/myboard/board" class="btn btn-outline-dark w-100 p-2">작성글</a></div>
                        <div class="mt-2"><a href="/mypage/message/receive" class="active btn btn-outline-dark w-100 p-2">쪽지함</a></div>
                        <div class="mt-2"><a href="/mypage/prefer/buildingprefer" class="btn btn-outline-dark w-100 p-2">찜목록</a></div>
                        <div class="mt-2"><a href="/mypage/withdrawl" class="btn btn-outline-dark w-100 p-2">회원탈퇴</a></div>
                    </div>
                </div>
                <div class="col-8">
                    <h3 class="m-3">쪽지함</h3>
                    <div class="row">
                        <ul class="nav nav-tabs">
                            <li class="nav-item">
                                <a class="nav-link h5 text-dark" href="/mypage/message/receive">받은쪽지함</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active h5 text-dark" href="/mypage/message/send">보낸쪽지함</a>
                            </li>
                        </ul>
                    </div>
                    <div class="row">
                        <table class="table table-hover">
                            <thead>
                                <tr class="text-center">
                                    <th>제목</th>
                                    <th>내용</th>
                                    <th>받은날</th>
                                    <th>보낸사람</th>
                                    <th>회신여부</th>
                                    <td><input type="checkbox" onclick="selectAll(this)"/></td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="text-center">
                                    <td>제목이 들어갑니다</td>
                                    <td>요약된 내용이 들어갑니다......</td>
                                    <td>2022-04-10</td>
                                    <td>보낸 사람 아이디</td>
                                    <td>답장완료</td>
                                    <td><input type="checkbox" class="delete"/></td>
                                </tr>
                                <tr class="text-center">
                                    <td>제목이 들어갑니다</td>
                                    <td>요약된 내용이 들어갑니다......</td>
                                    <td>2022-04-10</td>
                                    <td>보낸 사람 아이디</td>
                                    <td>X</td>
                                    <td><input type="checkbox" class="delete"/></td>
                                </tr>
                                <tr class="text-center">
                                    <td>제목이 들어갑니다</td>
                                    <td>요약된 내용이 들어갑니다......</td>
                                    <td>2022-04-10</td>
                                    <td>보낸 사람 아이디</td>
                                    <td>답장완료</td>
                                    <td><input type="checkbox" class="delete"/></td>
                                </tr>
                                <tr class="text-center">
                                    <td>제목이 들어갑니다</td>
                                    <td>요약된 내용이 들어갑니다......</td>
                                    <td>2022-04-10</td>
                                    <td>보낸 사람 아이디</td>
                                    <td>X</td>
                                    <td><input type="checkbox" class="delete"/></td>
                                </tr>
                                <tr class="text-center">
                                    <td>제목이 들어갑니다</td>
                                    <td>요약된 내용이 들어갑니다......</td>
                                    <td>2022-04-10</td>
                                    <td>보낸 사람 아이디</td>
                                    <td>답장완료</td>
                                    <td><input type="checkbox" class="delete"/></td>
                                </tr>
                                <tr class="text-center">
                                    <td>제목이 들어갑니다</td>
                                    <td>요약된 내용이 들어갑니다......</td>
                                    <td>2022-04-10</td>
                                    <td>보낸 사람 아이디</td>
                                    <td>X</td>
                                    <td><input type="checkbox" class="delete"/></td>
                                </tr>
                                <tr class="text-center">
                                    <td>제목이 들어갑니다</td>
                                    <td>요약된 내용이 들어갑니다......</td>
                                    <td>2022-04-10</td>
                                    <td>보낸 사람 아이디</td>
                                    <td>답장완료</td>
                                    <td><input type="checkbox" class="delete"/></td>
                                </tr>
                                <tr class="text-center">
                                    <td>제목이 들어갑니다</td>
                                    <td>요약된 내용이 들어갑니다......</td>
                                    <td>2022-04-10</td>
                                    <td>보낸 사람 아이디</td>
                                    <td>X</td>
                                    <td><input type="checkbox" class="delete"/></td>
                                </tr>
                                <tr class="text-center">
                                    <td>제목이 들어갑니다</td>
                                    <td>요약된 내용이 들어갑니다......</td>
                                    <td>2022-04-10</td>
                                    <td>보낸 사람 아이디</td>
                                    <td>답장완료</td>
                                    <td><input type="checkbox" class="delete"/></td>
                                </tr>
                                <tr class="text-center">
                                    <td>제목이 들어갑니다</td>
                                    <td>요약된 내용이 들어갑니다......</td>
                                    <td>2022-04-10</td>
                                    <td>보낸 사람 아이디</td>
                                    <td>X</td>
                                    <td><input type="checkbox" class="delete"/></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="row float-right">
                        <div class="mr-2">
                            <input type="button" value="삭제" class="float-right btn btn-sm btn-outline-dark"/>
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
                </div>
                <div class="col-2">
                    
                </div>
            </div>
        </div>
    </section>
    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    