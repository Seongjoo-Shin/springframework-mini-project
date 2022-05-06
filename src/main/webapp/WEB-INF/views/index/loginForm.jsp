<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<section style="flex-grow:1;">
	 <form method="post" action="/index/login" onsubmit ="return loginCheck()">
	    <div class = "d-flex flex-row justify-content-center" style="height: 40vh; margin-top: 130px;">
	        <div class="d-flex flex-column justify-content-center align-content-center col-md-3" style="height: 300px; border: 2px solid rgb(148,148,148); border-radius: 10px;">
	            <div class="d-flex flex-row justify-content-center align-content-center" >
	                <div class="d-flex flex-column justify-content-center align-content-center">
	                    <legend>로그인</legend>
	                    <div class="form-group">
	                        <input name="userId" placeholder="아이디" type="text" class="form-control" />
	                    </div>
	                    <div class="form-group">
	                        <input name="userPassword" placeholder="비밀번호" type="password" class="form-control" />
	                    </div>
	                </div>
	                <div class="d-flex flex-column justify-content-center align-content-center ml-2 pt-4">
	                    <div >
	                        <input class="btn btn-sm" type="submit" value="login" style="width:100px; height: 90px; background-color: rgb(242, 101, 45); font-size: 25px; color: white;"/>
	                    </div>
	                </div>
	            </div>
	            <div class="d-flex flex-column">
	            	<c:if test="${error != null}">
		            	<p style="margin:auto; color:red; font-size:0.9rem;">아이디 또는 비밀번호를 잘못 입력했습니다.</p>
		            	<p style="margin:0px auto 10px auto; color:red; font-size:0.9rem;">입력하신 내용을 다시 확인해주세요.</p>
	            	</c:if>
	            </div>
	            <div class = "d-flex flex-row justify-content-center align-content-center">
	                <a href="findAccount">아이디/비밀번호 찾기</a>
	                <a href="signUpForm" class="pl-5">회원가입</a>
	            </div>
	       	 </div>
	   	</div>
	</form>

</section>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>
