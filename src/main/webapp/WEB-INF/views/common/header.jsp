<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=lt1xd5ne5c&submodules=geocoder"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
      	.btn-top {position: fixed; right: 15px; bottom: 100px; border-radius: 50%; overflow: hidden; z-index: 10;transition: all 0.5s; display: none;}
		.btn-top.on {display: block;}
		.btn-top.active {bottom: 235px;}
		.btn-top>a {display: block; width: 50px; height: 50px; text-indent: -9999px; background: url("${pageContext.request.contextPath}/resources/images/totop.png") 50% no-repeat;}
		.btn-top .progress1 {
		    width: 100%;
		    height: 100%;
		    position: absolute;
		    left: 0;
		    top: 0;
		    /*box-shadow: inset 0 0 0 2px #eee;*/
		    border-radius: 50%;
		}
		
		.btn-top .progress1>span {
		    width: 50%;
		    height: 100%;
		    overflow: hidden;
		    position: absolute;
		    top: 0;
		    z-index: 1;
		}
		
		.btn-top .progress1 .left {
		    left: 0;
		}
		
		.btn-top .progress1 .progress-bar1 {
		    width: 100%;
		    height: 100%;
		    border: 2px solid #F58345;
		    position: absolute;
		    top: 0;
		    box-sizing: border-box;
		}
		
		.btn-top .progress1 .left .progress-bar1 {
		    left: 100%;
		    border-top-right-radius: 40px;
		    border-bottom-right-radius: 40px;
		    border-left: 0;
		    -webkit-transform-origin: center left;
		    transform-origin: center left;
		}
		
		.btn-top .progress1 .right {
		    right: 0;
		}
		
		.btn-top .progress1 .right .progress-bar1 {
		    left: -100%;
		    border-top-left-radius: 40px;
		    border-bottom-left-radius: 40px;
		    border-right: 0;
		}
		
		.btn-top .progress1 .right .progress-bar1 {
		    -webkit-transform-origin: center right;
		    transform-origin: center right;
		}
		      	
    </style> 
    <script>
	    function btntopNone () {
	        if($(window).height() >= $(document).height()){
	
	            $('.btn-top').css('display','none');
	        }
	    }
	    btntopNone();
	    console.log($(window).height());
	    console.log($(document).height());
	
	    var $prLeft = $('.progress .left .progress-bar'),
	        $prRight = $('.progress .right .progress-bar');
	
	    $(window).on('scroll', function(){
	        var currentPercentage = ($(window).scrollTop() / ($(document).outerHeight() - $(window).height())) * 100;
	        var RightDeg = Math.floor(currentPercentage*3.6);
	        var LeftDeg = Math.floor(currentPercentage*3.6);
	        if(RightDeg<=180){
	            $prRight.css('transform','rotate('+RightDeg+'deg)');
	        } else {
	            $prRight.css('transform','rotate(180deg)');
	        }
	        if(currentPercentage > 50){
	            if(LeftDeg>=180){
	                $prLeft.css('transform','rotate('+RightDeg+'deg) scaleX(-1)');
	            }
	        } else {
	            $prLeft.css('transform','rotate(180deg) scaleX(-1)');
	        }
	
	        if($(window).scrollTop() > 1) {
	            $('.btn-top').addClass('on');
	        }
	        else {
	            $('.btn-top').removeClass('on');
	        }
	    });

    </script>
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
	                 <a class="dropdown-item" href="${pageContext.request.contextPath}/community/notice/list">공지사항</a>
	                 <a class="dropdown-item" href="${pageContext.request.contextPath}/community/board/list">자유게시판</a>
	                 <a class="dropdown-item" href="${pageContext.request.contextPath}/community/market/list">거래게시판</a>
	             </div>
            </div>
            <div class="myinfo">
            	<span class="logout pr-3 font-weight-bold">
            		<c:if test="${sessionUserId == null}">
            			<a href = "${pageContext.request.contextPath}/index/loginForm" class ="text-dark">로그인</a> 
            		</c:if>
                </span>
                <span class="logout pr-3 font-weight-bold">
                	<c:if test="${sessionUserId != null}">
            			<a href = "${pageContext.request.contextPath}/index/logout" class ="text-dark">로그아웃</a> 
            		</c:if>
                    
                </span>
                <span class="mypage pr-3 font-weight-bold">
                	<c:if test="${sessionUserId != null}">
            			<a href="${pageContext.request.contextPath}/mypage/modify" class="text-dark">마이페이지</a>
            		</c:if>
                </span>
                <span id="alarm" class="btn area" onclick="visibleAlarmContent()">
                	<c:if test="${sessionUserId != null}">
            			<img id="alarmImg" class="pb-1 area" src="${pageContext.request.contextPath}/resources/images/alarmUse.png" width="35px"/>
            		</c:if>
                </span>
            </div>
            <div id="alarmContent" class="position-absolute" style="right:10px; top:70px; visibility:hidden;" onclick="visibleAlarmContent()">
            	<img src="${pageContext.request.contextPath}/resources/images/alramContent.png" width="300px"/>
            	<div class="d-flex flex-column position-relative" style="bottom:150px; left:10px;">
	            	<a href="#">💌 쪽지가 5통 도착하였습니다.</a>
	            	<a href="#">🧡 '장갑 팔아..'게시물에 하트가 달렸어요</a>
	            	<a href="#">💬 '요즘 장사가..'게시물에 댓글이 달렸어요</a>
            	</div>
          	</div>
          </nav>
    </header>
<script>
	//이미지 보이기
	function visibleAlarmContent(){
		$("#alarmContent").css("visibility","visible");
	}

	//이미지 사라지기
  	$('body').click(function(e){
		if(!$(e.target).hasClass("area")){
			$("#alarmContent").css("visibility","hidden");
			$("#alarmImg").attr("src","${pageContext.request.contextPath}/resources/images/alarmNo.png");
		}
	});
</script>