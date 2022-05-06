<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script>
	function fn_withdrawal(){
		var userId = '${sessionUserId}';
		var userPassword = document.getElementById("password").value;
		var data1 = {"userId": userId, "userPassword": userPassword};
		var sendData = JSON.stringify(data1);
		if(userPassword == null || userPassword == ""){
			swal("비밀번호를 입력해주세요").then(() => {
				document.getElementById("password").focus();	
			});
		} else {
			swal("탈퇴하시겠습니까?", {
				dangerMode: true,
				buttons: true,
			}).then((result) => {
				if(result == true){
					var xhr = new XMLHttpRequest(); 

			        xhr.open("POST", "/mypage/userWithdrawal", true);
			        xhr.setRequestHeader("Content-Type", "application/json");
			        xhr.send(sendData);

			        xhr.onreadystatechange = function() {
			        	if (xhr.readyState === 4) {
			            	if (xhr.status === 200) {
			            		const res = JSON.parse(xhr.responseText);
				            	if(res.status == "success"){
									swal(res.message).then(() => {
										location.href = "/";
									});
								} else {
									swal(res.message).then(() => {
										document.getElementById("password").innerHTML = "";
										document.getElementById("password").focus();
									});
								}
			            	}
			          	}
			        };
				}
			});
		}
		
	}
</script>
    <section style="flex-grow:1;">
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
                    <div class="d-flex justify-content-center h-100">
                        <div class="align-items-center" style="margin: auto 0;">
	                        <h4 style="margin-bottom: 20px;">비밀번호를 입력해주세요</h4>
		                    <input type="hidden" name="userId" value="${sessionUserId}"/>
		                    <input type="password" id="password" class="mr-2" placeholder="비밀번호" name="userPassword" style="padding: 0.35rem!important;"/>
		                    <input type="button" value="회원탈퇴" class="btn btn-outline-dark mb-2" onclick="fn_withdrawal();" style="margin-bottom: 5px;"/>
	                    </div>
                    </div>
                </div>
                <div class="col-2">

                </div>
            </div>
        </div>
    </section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>