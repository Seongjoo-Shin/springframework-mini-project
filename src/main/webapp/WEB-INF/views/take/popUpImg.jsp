<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모든 사진 보기</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
    </script>
    <style>
        @font-face {
            src : url("${pageContext.request.contextPath}/resources/font/EliceDigitalBaeum_TTF/EliceDigitalBaeum_Regular.ttf"); 
            font-family: "elice";
        }
         *{
             font-family: "elice";
         }
    </style>    
</head>
<body>
    <header>
        <div>
            <h3 class="bg-light border rounded p-5 text-center">모든 사진 보기</h3>
        </div>
    </header>
    <section>
        <div id="imagePreview" class="w-100" style="align-items: center; display: inline;">
            <span>
                <img class="p-2 m-2" src="${pageContext.request.contextPath}/resources/images/hosImg1.jpg" width="500px" height="400px"/>
            </span>
            <span>
                <img class="p-2 m-2" src="${pageContext.request.contextPath}/resources/images/hosImg2.jpg" width="500px" height="400px"/>
            </span>
            <span>
                <img class="p-2 m-2" src="${pageContext.request.contextPath}/resources/images/hosImg3.jpg" width="500px" height="400px"/>
            </span>
            <span>
                <img class="p-2 m-2" src="${pageContext.request.contextPath}/resources/images/hosImg4.jpg" width="500px" height="400px"/>
            </span>
        </div>
    </section>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>