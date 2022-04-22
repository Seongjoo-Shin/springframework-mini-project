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
            src : url("/EliceDigitalBaeum_TTF/EliceDigitalBaeum_Regular.ttf"); 
            font-family: "elice";
        }
         *{
             font-family: "elice";
         }
    </style> 
</head>
<body>
    <div style="width:300px; height:200px;" class="bg-light p-2">
        <div class="container text-center">
            <div class="row justify-content-center">
                <p>받은 쪽지</p>
            </div>
            <div class="row justify-content-center  mb-2 bg-light">
                <div class="float-left mr-3">보낸사람</div>
                <div class="float-left"><p>홍길동</p></div>
            </div>
            <div class="row justify-content-center mb-2 bg-light">
                <div class="float-left mr-5"><span>제목</span></div>
                <div class="float-left"><p>제목이 들어갑니다.</p></div>
            </div>
            <div class="row justify-content-center mb-2 bg-light">
                <p>
                	내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.
                </p>
            </div>
            <div class="row justify-content-center bg-light">
                <div class="float-left"><button class="btn btn-outline-dark mr-2">답장하기</button></div>
                <div class="float-left"><button class="btn btn-outline-dark ml-2" onclick="window.close();">취소</button></div>
            </div>
        </div>
    </div>
</body>
</html>