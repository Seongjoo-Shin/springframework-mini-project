<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메세지</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <style>
		@font-face {
			src: url("/resources/font/EliceDigitalBaeum_TTF/EliceDigitalBaeum_Regular.ttf");
			font-family: "elice";
		}
		
		* {
			font-family: "elice";
			resize: none;
		}
		
</style>
<script>
	function fn_submit(){
		document.frm.submit();
		setTimeout(() => {
			window.open("about:blank", "_self").close();	
		});
	}
</script>
</head>
<body class="bg-light">
    <div style="width:300px; height:200px;" class="p-2">
        <div class="container text-center">
        <form id="frm" method="post" name="frm" action="/mypage/message/send">
	        <input type="hidden" name="messageSender" value="${sessionUserId}"/>
	        <input type="hidden" name="changeMsgNo" value='<%=request.getParameter("messagedNo") %>' />
            <div class="row justify-content-center p-2">
                <h3>메세지 보내기</h3>
            </div>
            <div class="row justify-content-around  mb-2">
                <div class="float-left mr-3">보낸사람</div>
                <div class="float-left"><input type="text" value="${receiver}" name="messageReceiver" id="receiver"/></div>
            </div>
            <div class="row justify-content-around mb-2">
                <div class="float-left mr-5"><span>제목</span></div>
                <div class="float-left"><input type="text" value="" name="messageTitle" placeholder="제목을 입력하세요" id="title"/></div>
            </div>
            <div class="row justify-content-around mb-2">
                <textarea style="resize: none; height: 150px;" class="w-100" name="messageContent" id="content" placeholder="내용을 입력하세요"></textarea>
            </div>
            <div class="row justify-content-center">
                <div class="float-left">
                	<a href="#" class="btn btn-outline-dark mr-2" onclick="javascript:fn_submit();">보내기</a>
                </div>
                <div class="float-left">
                	<a href="#" class="btn btn-outline-dark ml-2" onclick="javascript:window.close();">취소</a>
                </div>
            </div>
        </form>
        </div>
    </div>
</body>
</html>