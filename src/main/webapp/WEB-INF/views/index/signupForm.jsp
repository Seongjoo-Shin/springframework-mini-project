<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<style>
	.id_input_re_1{
		color : green;
		display : none;
	}
	
	.id_input_re_2{
		color : red;
		display : none;
	}
	
	.id_input_re_3{
		color : green;
		display : none;
	}
	
	.id_input_re_4{
		color : red;
		display : none;
	}
</style>

<script>
    function selectEmail(ele){ 
        var $ele = $(ele); 
        var $email2 = $('input[name=email2]'); 
        // '1'인 경우 직접입력 
        if($ele.val() == "1"){ 
            $email2.attr('readonly', false); 
            $email2.val(''); 
        } else { 
            $email2.attr('readonly', true); 
            $email2.val($ele.val()); 
        } 
    }
    function sumemail(){
        var text1=document.getElementById('email1').value + '@' + document.getElementById('email2').value;
        document.getElementById('email').value = text1;
    }
</script>

<form method="post" action="/index/signUp">
       <div class="d-flex flex-row justify-content-center align-items-center vh-100">
           <div class="d-flex flex-column col-md-3">
               <div class="d-flex justify-content-center align-items-center">
                   <img class="mb-5" src="${pageContext.request.contextPath}/resources/images/logo.png" width="250px"/>  
               </div>
               <div class="form-group">
                   <input id="userId" name="userId" class ="col-md-8" placeholder="아이디" type="text"/>
                   <button type="button" onClick="checkId()" class="btn btn-sm" style="background-color: rgb(242, 101, 45); color: white;">중복확인</button>
                   <script>
	                   function checkId() {
	                	   var id = $(userId).val();
		   					$.ajax({
		   						url: "/index/checkId",
		   						data: {id},
		   						method:"post"
		   					})
		   					.done((data) => {
		   						console.log(data.result);
		   						if(data.result ==="success"){
		   							$('.id_input_re_2').css("display","inline-block");
		   							$('.id_input_re_1').css("display", "none")
		   						} else if(data.result ==="fail"){
		   							$('.id_input_re_1').css("display","inline-block");
		   							$('.id_input_re_2').css("display", "none");
		   						}
		   					});
		   				}
                   </script>
                   <span class="id_input_re_1">사용 가능한 아이디입니다.</span>
				   <span class="id_input_re_2">아이디가 이미 존재합니다.</span>
            </div>
            <div class="form-group">
                <input name="userPassword" class ="col-md-8" placeholder="비밀번호" type="text"/>
            </div>
            <div class="form-group">
                <input class ="col-md-8" placeholder="비밀번호 확인" type="text"/>
            </div>
            <div class="form-group d-flex flex-row">
                <input class ="col-md-3" id="email1" name="email1" placeholder="이메일" type="text" style="width: 80px;"/>@<input id="email2" name="email2" type="text"/>
                <select name = "select_email" onchange="selectEmail(this)">
                    <option value="" selected>선택하세요</option> 
                    <option value="naver.com">naver.com</option> 
                    <option value="gmail.com">gmail.com</option> 
                    <option value="hanmail.com">hanmail.com</option>
                    <option value="1">직접입력</option>
                </select>
                
                <input id="email" name="userEmail" value="" style="display:none"/>
            </div>
            <div class="form-group">
                <input name="userName" class ="col-md-8" placeholder="이름" type="text"/>
            </div>
            <div class="form-group">
                <input name="userPhone" class ="col-md-8" placeholder="전화번호" type="text"/>
            </div>
            <div class="form-group">
                <input id="userNickname" name="userNickname" class ="col-md-8" placeholder="닉네임" type="text"/>
                <button type="button" onClick="checkNickname()" class="btn btn-sm"  style="background-color: rgb(242, 101, 45); color: white;">중복확인</button>
            	<script>
	                   function checkNickname() {
	                	   var nickname = $(userNickname).val();
		   					$.ajax({
		   						url: "/index/checkNickname",
		   						data: {nickname},
		   						method:"post"
		   					})
		   					.done((data) => {
		   						console.log(data.result);
		   						if(data.result ==="success"){
		   							$('.id_input_re_4').css("display","inline-block");
		   							$('.id_input_re_3').css("display", "none")
		   						} else if(data.result ==="fail"){
		   							$('.id_input_re_3').css("display","inline-block");
		   							$('.id_input_re_4').css("display", "none");
		   						}
		   					});
		   				}
                   </script>
                   <span class="id_input_re_3">사용 가능한 닉네임입니다.</span>
				   <span class="id_input_re_4">닉네임이 이미 존재합니다.</span>
            </div>
            <input type="submit" onclick="sumemail()" value="회원가입" class="btn btn-sm mb-5" style="background-color: rgb(242, 101, 45); color: white;"></input>
        </div>
    </div>
</form>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>