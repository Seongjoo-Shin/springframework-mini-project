<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <script>
        function selectAll(selectAll)  {
            const checkboxes = document.querySelectorAll('input[type="checkbox"]');
            
            checkboxes.forEach((checkbox) => {
                checkbox.checked = selectAll.checked
            })
        }

        function openMsgForm(){
            var url = "messageForm.html";
            var option = "top=10, left=10, width=320px, height=220px, status=no, menubar=no, toolbar=no, resizable=no";
            window.open(url, option);
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
                        <div class="mt-2"><a href="/mypage/prefer" class="btn btn-outline-dark w-100 p-2">찜목록</a></div>
                        <div class="mt-2"><a href="/mypage/withdrawl" class="btn btn-outline-dark w-100 p-2">회원탈퇴</a></div>
                    </div>
                </div>
                <div class="col-8">
                    <h3 class="m-3">쪽지함</h3>
                    <div class="row">
                        <ul class="nav nav-tabs">
                            <li class="nav-item">
                                <a class="nav-link active h5 text-dark" href="/mypage/message/receive">받은쪽지함</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link h5 text-dark" href="/mypage/message/send">보낸쪽지함</a>
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
                                    <th>답장여부</th>
                                    <td><input type="checkbox" onclick="selectAll(this)"/></td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="text-center">
                                    <td>제목이 들어갑니다</td>
                                    <td>요약된 내용이 들어갑니다......</td>
                                    <td>2022-04-10</td>
                                    <td>보낸 사람 아이디</td>
                                    <td><a href="#" class="btn btn-outline-dark" onclick="openMsgForm()">답장</a></td>
                                    <td><input type="checkbox" class="delete"/></td>
                                </tr>
                                <tr class="text-center">
                                    <td>제목이 들어갑니다12</td>
                                    <td>요약된 내용이 들어갑니다......</td>
                                    <td>2022-04-10</td>
                                    <td>보낸 사람 아이디</td>
                                    <td><a href="#" class="btn btn-outline-dark" onclick="openMsgForm()">답장</a></td>
                                    <td><input type="checkbox" class="delete"/></td>
                                </tr>
                                <tr class="text-center">
                                    <td>제목이 들어갑니다</td>
                                    <td>요약된 내용이 들어갑니다......</td>
                                    <td>2022-04-10</td>
                                    <td>보낸 사람 아이디</td>
                                    <td><a href="#" class="btn btn-outline-dark" onclick="openMsgForm()">답장</a></td>
                                    <td><input type="checkbox" class="delete"/></td>
                                </tr>
                                <tr class="text-center">
                                    <td>제목이 들어갑니다</td>
                                    <td>요약된 내용이 들어갑니다......</td>
                                    <td>2022-04-10</td>
                                    <td>보낸 사람 아이디</td>
                                    <td><a href="#" class="btn btn-outline-dark" onclick="openMsgForm()">답장</a></td>
                                    <td><input type="checkbox" class="delete"/></td>
                                </tr>
                                <tr class="text-center">
                                    <td>제목이 들어갑니다</td>
                                    <td>요약된 내용이 들어갑니다......</td>
                                    <td>2022-04-10</td>
                                    <td>보낸 사람 아이디</td>
                                    <td><a href="#" class="btn btn-outline-dark" onclick="openMsgForm()">답장</a></td>
                                    <td><input type="checkbox" class="delete"/></td>
                                </tr>
                                <tr class="text-center">
                                    <td>제목이 들어갑니다</td>
                                    <td>요약된 내용이 들어갑니다......</td>
                                    <td>2022-04-10</td>
                                    <td>보낸 사람 아이디</td>
                                    <td><a href="#" class="btn btn-outline-dark" onclick="openMsgForm()">답장</a></td>
                                    <td><input type="checkbox" class="delete"/></td>
                                </tr>
                                <tr class="text-center">
                                    <td>제목이 들어갑니다</td>
                                    <td>요약된 내용이 들어갑니다......</td>
                                    <td>2022-04-10</td>
                                    <td>보낸 사람 아이디</td>
                                    <td><a href="#" class="btn btn-outline-dark" onclick="openMsgForm()">답장</a></td>
                                    <td><input type="checkbox" class="delete"/></td>
                                </tr>
                                <tr class="text-center">
                                    <td>제목이 들어갑니다</td>
                                    <td>요약된 내용이 들어갑니다......</td>
                                    <td>2022-04-10</td>
                                    <td>보낸 사람 아이디</td>
                                    <td><a href="#" class="btn btn-outline-dark" onclick="openMsgForm()">답장</a></td>
                                    <td><input type="checkbox" class="delete"/></td>
                                </tr>
                                <tr class="text-center">
                                    <td>제목이 들어갑니다</td>
                                    <td>요약된 내용이 들어갑니다......</td>
                                    <td>2022-04-10</td>
                                    <td>보낸 사람 아이디</td>
                                    <td><a href="#" class="btn btn-outline-dark" onclick="openMsgForm()">답장</a></td>
                                    <td><input type="checkbox" class="delete"/></td>
                                </tr>
                                <tr class="text-center">
                                    <td>제목이 들어갑니다</td>
                                    <td>요약된 내용이 들어갑니다......</td>
                                    <td>2022-04-10</td>
                                    <td>보낸 사람 아이디</td>
                                    <td><a href="#" class="btn btn-outline-dark" onclick="openMsgForm()">답장</a></td>
                                    <td><input type="checkbox" class="delete"/></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="row float-right">
                        <div class="mr-2">
                            <input type="button" value="삭제" class="float-right"/>
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
                <!-- <div class="col-3 mt-xl-5 d-flex justify-content-center align-items-center" style="display:none;">
                    <div class="d-flex align-content-center" style="border:1px solid black">
                        <div style="width:300px; height:200px;" class="bg-light">
                            <div class="container text-center">
                                <div class="row justify-content-center">
                                    <p>메세지 보내기</p>
                                </div>
                                <div class="row justify-content-center  mb-2">
                                    <div class="float-left mr-3">보낸사람</div>
                                    <div class="float-left"><input type="text" value="홍길동"/></div>
                                </div>
                                <div class="row justify-content-center mb-2">
                                    <div class="float-left mr-5"><span>제목</span></div>
                                    <div class="float-left"><input type="text" value="" placeholder="제목을 입력하세요"/></div>
                                </div>
                                <div class="row justify-content-center mb-2">
                                    <textarea style="resize: none; height: 150px;" class="w-100" ></textarea>
                                </div>
                                <div class="row justify-content-center">
                                    <div class="float-left"><button class="btn btn-outline-dark mr-2">보내기</button></div>
                                    <div class="float-left"><button class="btn btn-outline-dark ml-2">취소</button></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> -->
            </div>
        </div>
    </section>
   <%@ include file="/WEB-INF/views/common/footer.jsp" %>
   