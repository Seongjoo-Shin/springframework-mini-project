<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>START:DEN</title>
    <link rel="icon" type="image/png"  href="${pageContext.request.contextPath}/resources/images/bigMascot.png"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pannellum@2.5.6/build/pannellum.css" />
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/pannellum@2.5.6/build/pannellum.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/board.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=lt1xd5ne5c"></script>
    <style>
        @font-face {
            src : url("${pageContext.request.contextPath}/resources/font/EliceDigitalBaeum_TTF/EliceDigitalBaeum_Regular.ttf"); 
            font-family: "elice";
        }
        *{
             font-family: "elice";
         }
        .dropdown:hover>.dropdown-menu {
	        display: block;
	    }
	    
	    #panorama {
        height: 400px;
        z-index: 1000;
        -moz-transform-origin: top left;
        -webkit-transform-origin: top left;
        -ms-transform-origin: top left;
        transform-origin: top left;
      	}
    </style>   
</head>
<body>
    <header>
        <nav class="navbar navbar-light" style="border-bottom: 1px solid rgb(242, 101, 45);">
            <a class="navbar-brand" href="/">
              <img src="${pageContext.request.contextPath}/resources/images/logo.png" width="250px"/>
            </a>
                <a href="${pageContext.request.contextPath}/opening/opening" class="text-dark h3 font-weight-bold">개원</a>
                <a href="${pageContext.request.contextPath}/take/list" class="text-dark h3 font-weight-bold">인수</a>
                <a href="${pageContext.request.contextPath}/interior/example" class="text-dark h3 font-weight-bold">인테리어</a>
                <div class="dropdown">
                <a class="text-dark h3 dropdown font-weight-bold" data-toggle="dropdown">커뮤니티</a>
                <div class="dropdown-menu mr-5" style="z-index: 1001;">
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/community/board/list">공지사항</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/community/market/list">자유게시판</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/community/notice/list">거래게시판</a>
                </div>
                </div>
            <div class="myinfo">
            <span class="logout pr-3 font-weight-bold">
                    로그인
                </span>
                <span class="logout pr-3 font-weight-bold" style="display:none;">
                    로그아웃
                </span>
                <span class="mypage pr-3 font-weight-bold" style="display:none;">
                    <a href="${pageContext.request.contextPath}/mypage/modify" class="text-dark">마이페이지</a>
                </span>
                <span style="display:none;"><img class="pb-1" src="${pageContext.request.contextPath}/resources/images/alarmUse.png" width="35px" /></span>
            </div>
          </nav>
    </header>