<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<form>
       <div class="d-flex flex-row justify-content-center align-items-center vh-100">
           <div class="d-flex flex-column col-md-3">
               <div>
                   <img class="mb-5" src="${pageContext.request.contextPath}/resources/images/logo.png" width="250px"/>  
               </div>
               <div class="form-group">
                   <input class ="col-md-8" placeholder="아이디" type="text"/>
                   <button class="btn btn-sm" style="background-color: rgb(242, 101, 45); color: white;">중복확인</button>
            </div>
            <div class="form-group">
                <input class ="col-md-8" placeholder="비밀번호" type="text"/>
            </div>
            <div class="form-group">
                <input class ="col-md-8" placeholder="비밀번호 확인" type="text"/>
            </div>
            <div class="form-group d-flex flex-row">
                <input class ="col-md-3" name="email1" placeholder="이메일" type="text" style="width: 80px;"/>@<input name="email2" type="text"/>
                <select name = "select_email" onchange="selectEmail(this)">
                    <option value="" selected>선택하세요</option> 
                    <option value="naver.com">naver.com</option> 
                    <option value="gmail.com">gmail.com</option> 
                    <option value="hanmail.com">hanmail.com</option>
                    <option value="1">직접입력</option>
                </select>
            </div>
            <div class="form-group">
                <input class ="col-md-8" placeholder="이름" type="text"/>
            </div>
            <div class="form-group">
                <input class ="col-md-8" placeholder="주민번호(앞자리+뒷자리 첫번째)" type="text"/>
            </div>
            <div class="form-group">
                <input class ="col-md-8" placeholder="닉네임" type="text"/>
                <button class="btn btn-sm" style="background-color: rgb(242, 101, 45); color: white;">중복확인</button>
            </div>
            <button class="btn btn-sm mb-5" style="background-color: rgb(242, 101, 45); color: white;">회원가입</button>
        </div>
    </div>
</form>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>