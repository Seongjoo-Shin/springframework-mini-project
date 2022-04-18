<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>360도 사진 보기</title>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
    />
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/pannellum@2.5.6/build/pannellum.css"
    />
    <script
      type="text/javascript"
      src="https://cdn.jsdelivr.net/npm/pannellum@2.5.6/build/pannellum.js"
    ></script>
    <script language="javascript">
      function initScale() {
        var ress = navigator.userAgent;
        if (ress.indexOf("Android 1.", 0) > -1) {
          //안드로이드2. 이하만 설정
          if (ress.indexOf("480", 0) > -1) {
            // 480x800
            var per = 0.5226824457593688;
          } else if (ress.indexOf("600", 0) > -1) {
            // 600 x 1024
            var per = 0.681;
          } else if (ress.indexOf("1280", 0) > -1) {
            // 800 x 1280
            var per = 0.631;
          }
        } else {
          var dh = window.innerHeight;
          var dw = window.innerWidth;
          var cw = parseInt($("#panorama").css("width"));
          var ch = parseInt($("#panorama").css("height"));
          var per = dw / cw;
          var per2 = dh / ch;
          if (per > per2) {
            per = per2;
          }
          var gapH = (dh - ch * per) / 2;
          var gapW = (dw - cw * per) / 2;
        }
        curScale = per;
      }
      window.onresize = function () {
        initScale();
      };
      window.onload = function () {
        initScale();
      };
    </script>
    <style>
      @font-face {
        src: url("${pageContext.request.contextPath}/resources/font/EliceDigitalBaeum_TTF/EliceDigitalBaeum_Regular.ttf");
        font-family: "elice";
      }
      * {
        font-family: "elice";
      }

      #panorama {
        width: 700px;
        height: 400px;
        position: relative;
        z-index: 1000;
        display: table;
        -moz-transform-origin: top left;
        -webkit-transform-origin: top left;
        -ms-transform-origin: top left;
        transform-origin: top left;
      }
    </style>
  </head>
  <body>
    <header>
      <div>
        <h3 class="bg-light border rounded p-5 text-center">360도 사진 보기</h3>
      </div>
    </header>
    <section class="d-flex justify-content-center align-content-around">
        <div id="panorama" style="border-radius: 10px"></div>
        <script>
            pannellum.viewer("panorama", {
                type: "equirectangular",
                panorama: "${pageContext.request.contextPath}/resources/images/pano2.jpg",
            });
        </script>
    </section>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>