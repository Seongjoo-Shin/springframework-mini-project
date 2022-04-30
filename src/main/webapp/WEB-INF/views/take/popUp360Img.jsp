<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>360도 사진 보기</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" ></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pannellum@2.5.6/build/pannellum.css" />
  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/pannellum@2.5.6/build/pannellum.js" ></script>
  <style>

    #panorama {
      width: 800px;
      height: 500px;
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
      <div class="m-3" id="panorama" style="border-radius: 10px"></div>
      <script>
          pannellum.viewer("panorama", {
              type: "equirectangular",
              panorama: "getBuildingImage?buildingNo=${buildingNo}&type=pano",
              autoLoad: true
          });
      </script>
  </section>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>