<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script>
	function fn_withdrawal(){
		var userId = '${sessionUserId}';
		var userPassword = document.getElementById("password").value;
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
					$.ajax({
						url: '/mypage/userWithdrawal',
						method: 'POST',
						data: {userId, userPassword},
					}).done((data)=>{
						if(data.status == "success"){
							swal(data.message).then(() => {
								location.href = "/";
							});
						} else {
							swal(data.message).then(() => {
								document.getElementById("password").innerHTML = "";
								document.getElementById("password").focus();
							})
						}
					}).fail((data)=>{
						
					});
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
	                        <h4>비밀번호를 입력해주세요</h4>
		                    <input type="hidden" name="userId" value="${sessionUserId}"/>
		                    <input type="password" id="password" class="mr-2" placeholder="비밀번호" name="userPassword"/>
		                    <input type="button" value="회원탈퇴" class="btn btn-outline-dark" onclick="fn_withdrawal();"/>
	                    </div>
                    </div>
                </div>
                <div class="col-2">

                </div>
            </div>
        </div>
    </section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>