<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <section>
        <div class="container-fluid mt-5">
            <div class="row">
                <div class="col-2">
                    <div class="p-5 justify-content-center">
                        <div class="mt-5"><a href="/mypage/modify" class="btn btn-outline-dark w-100 p-2">내 정보 수정</a></div>
                        <div class="mt-2"><a href="/mypage/myboard/board" class="btn btn-outline-dark w-100 p-2">작성글</a></div>
                        <div class="mt-2"><a href="/mypage/message/receive" class="btn btn-outline-dark w-100 p-2">쪽지함</a></div>
                        <div class="mt-2"><a href="/mypage/prefer/buildingprefer" class="btn btn-outline-dark w-100 p-2">찜목록</a></div>
                        <div class="mt-2"><a href="/mypage/withdrawl" class="active btn btn-outline-dark w-100 p-2">회원탈퇴</a></div>
                    </div>
                </div>
                <div class="col-8">
                    <h3 class="m-3">회원 탈퇴</h3>
                    <div class="d-flex justify-content-center align-items-center h-100">
                        <form method="post" action="/mypage/userWithdrawal">
                            <h4>비밀번호를 입력해주세요</h4>
                            <input type="hidden" name="userId" value="test"/>
                            <input type="password" class="mr-2" placeholder="비밀번호" name="userPassword"/>
                            <input type="submit" value="회원탈퇴" class="btn btn-outline-dark"/>
                        </form>
                    </div>
                </div>
                <div class="col-2">

                </div>
            </div>
        </div>
    </section>
    <footer class="footer fixed-bottom" style="background-color: rgb(231, 231, 236); bottom: 0px;">    
        <div class="row w-100" style="height: 200px;">
            <div class="col-4 mt-auto p-3">
                Developer | 백수민 신성주 신현주 양승현
            </div>
            <div class="col-4 mt-5 text-center">
                <div>
                    <img src="${pageContext.request.contextPath}/resources/images/logo.png" width="350px"/>
                </div>
            </div>
            <div class="col-4 mt-auto p-1" >
                <div style="float:right;">
                    <img class="border rounded p-2" src="${pageContext.request.contextPath}/resources/images/kosa.png" width="100px"/>
                    <img class="border rounded p-3" src="${pageContext.request.contextPath}/resources/images/osstem_ci.png" width="100px"/>
                    <div class="font-weight-bold ml-5 p-2" style="color: rgb(88, 90, 95);">Project Github<img src="${pageContext.request.contextPath}/resources/images/gitLogo.png" width="30px"/></div>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>
    