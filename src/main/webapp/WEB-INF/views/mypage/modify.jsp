<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<script>
		
	</script>
    <section>
        <div class="container-fluid h-100 mt-5 mb-5">
            <div class="row">
                <div class="col-2">
                    <div class="p-5 justify-content-center">
                        <div class="mt-5"><a href="/mypage/modify" class="active btn btn-outline-dark w-100 p-2">내 정보 수정</a></div>
                        <div class="mt-2"><a href="/mypage/myboard/board" class="btn btn-outline-dark w-100 p-2">작성글</a></div>
                        <div class="mt-2"><a href="/mypage/message/receive" class="btn btn-outline-dark w-100 p-2">쪽지함</a></div>
                        <div class="mt-2"><a href="/mypage/prefer/buildingprefer" class="btn btn-outline-dark w-100 p-2">찜목록</a></div>
                        <div class="mt-2"><a href="/mypage/withdrawl" class="btn btn-outline-dark w-100 p-2">회원탈퇴</a></div>
                    </div>
                </div>
                <div class="col-8">
                    <h3 class="m-3">내 정보 수정</h3>
                    <form method="post" action="/mypage/updatepassword">
                        <table class="table">
                            <colgroup>
                                <col width="250px"/>
                            </colgroup>
                            <tr>
                                <td class="text-center bg-light"><span>아이디</span></td>
                                <td><input type="hidden" value="test" name="userId"/>test</td>
                            </tr>
                            <tr>
                                <td class="text-center bg-light">이름</td>
                                <td><input type="hidden" value="테스트" name="userName"/>테스트</td>
                            </tr>
                            <tr>
                                <td class="text-center bg-light">이메일</td>
                                <td><input type="hidden" value="test@test.com" name="userEmail"/>test@test.com</td>
                            </tr>
                            <tr>
                                <td class="text-center bg-light">연락처</td>
                                <td><input type="hidden" value="01012341234" name="userPhone"/>01012341234</td>
                            </tr>
                            <tr>
                                <td class="text-center bg-light">현재 비밀번호</td>
                                <td><input type="password" name="userPassword" class="w-50" placeholder="현재 비밀번호를 입력하시오"/></td>
                            </tr>
                            <tr>
                                <td class="text-center bg-light">새로운 비밀번호</td>
                                <td><input type="password" id="newPwd" name="userNewPassword" class="w-50" placeholder="새로운 비밀번호를 입력하시오"/></td>
                            </tr>
                            <tr>
                                <td class="text-center bg-light">새로운 비밀번호 확인</td>
                                <td><input type="password" id="chkNewPwd" class="w-50" placeholder="새로운 비밀번호를 한번더 입력하시오"/></td>
                            </tr>
                        </table>
                        <input type="submit" class="btn btn-outline-dark float-right" value="비밀번호 변경" />
                    </form>
                </div>
                <div class="col-2">

                </div>
            </div>
        </div>
    </section>
    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    