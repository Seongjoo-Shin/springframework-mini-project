<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

 <form>
    <div class = "d-flex flex-row justify-content-center" style="height: 60vh; margin-top: 200px;">
        <div class="d-flex flex-column justify-content-center align-content-center col-md-3" style="height: 300px; border: 2px solid rgb(148,148,148); border-radius: 10px;">
            <div class="d-flex flex-row justify-content-center align-content-center" >
                <div class="d-flex flex-column justify-content-center align-content-center">
                    <legend>로그인</legend>
                    <div class="form-group">
                        <input placeholder="아이디" type="text" class="form-control" />
                    </div>
                    <div class="form-group">
                        <input placeholder="비밀번호" type="password" class="form-control" />
                    </div>
                </div>
                <div class="d-flex flex-column justify-content-center align-content-center ml-2 pt-4">
                    <div >
                        <button class="btn btn-sm" style="width:100px; height: 90px; background-color: rgb(242, 101, 45); font-size: 25px; color: white;">login</button>
                    </div>
                </div>
            </div>
            <div class = "d-flex flex-row justify-content-center align-content-center">
                <a href="./findAccount.html">아이디/비밀번호 찾기</a>
                <a href="./signUp.html" class="pl-5">회원가입</a>
            </div>
        </div>
    </div>
</form>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>
