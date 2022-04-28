<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="d-flex justify-content-center align-items-center vh-100">
    <div class="d-flex flex-column justify-content-center col-md-3">
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item" role="presentation">
              <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">아이디</a>
            </li>
            <li class="nav-item" role="presentation">
              <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">비밀번호</a>
            </li>
          </ul>
          <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
             <form method="post" action="">
              <div class="d-flex flex-column justify-content-center align-items-center p-3" style="border: 1px solid black; border-radius: 5px;">
                     <div>
                         <h2 class="pb-3" style="text-align: center;">아이디찾기</h2>
                         <div class="form-group">
                             <input id="findInputEmail" name="findInputEmail" placeholder="등록된 이메일" type="text"/>
                             <button type="button" onClick="findEmail()" class="btn btn-sm" style="background-color: rgb(242, 101, 45); color: white;">인증번호보내기</button>
                         </div>
                         <script>
                         	function findEmail(){
                         		var emailValue = $('#findInputEmail').val();
                         		console.log(emailValue);
                         		$.ajax({
         	 						url: "/index/findEmail",
         	 						data: {emailValue},
         	 						method:"post"
         	 					})
         	 					.done((data) => {
         	 						console.log(data.result);
         	 						if(data.result ==="success"){
         	 							$('#cDiv').css("display", "inline-block");
         	 						} else if(data.result ==="fail"){
         	 							
         	 						}
         	 					});
                         	}
                         </script>
                         <div id="cDiv" class="form-group" style="display:none">
                             <input placeholder="인증번호" type="text"/>
                             <button class="btn btn-sm" style="background-color: rgb(242, 101, 45); color: white;">확인</button>
                         </div>
                     </div>
                     
                     <div>
                         <button class="btn btn-sm" style="width: 300px; background-color: rgb(242, 101, 45); color: white;">아이디찾기</button>
                     </div>
                 </div>
           </form>
            </div>
            <div class="tab-pane fade " id="profile" role="tabpanel" aria-labelledby="profile-tab">
            	<form method="post" action="">
             	<div class="d-flex flex-column justify-content-center align-items-center p-3" style="border: 1px solid black; border-radius: 5px;">
                     <div>
                         <h2 class="pb-3" style="text-align: center;">비밀번호찾기</h2>
                         <div class="form-group">
                             <input placeholder="아이디" type="text"/>
                         </div>
                         <div class="form-group">
                             <input placeholder="등록된 이메일" type="text"/>
                             <button class="btn btn-sm" style="background-color: rgb(242, 101, 45); color: white;">인증번호 받기</button>
                         </div>
                         <div class="form-group">
                             <input placeholder="인증번호" type="text"/>
                         </div>
                     </div>
                     <div>
                         <button class="btn btn-sm" style="width: 300px; background-color: rgb(242, 101, 45); color: white;">비밀번호찾기</button>
                     </div>
                 </div>
            	</form>
            </div>
          </div>
    </div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
