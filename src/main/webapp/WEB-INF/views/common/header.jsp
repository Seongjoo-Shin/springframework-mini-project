<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
   <head>
       <meta charset="UTF-8">
       <meta http-equiv="X-UA-Compatible" content="IE=edge">
       <meta name="viewport" content="width=device-width, initial-scale=1.0">
       <title>Document</title>
       <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
       <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
       <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
       <link rel="stylesheet" href="/webapp/resources/css/app.css">
   </head>
   <body>
      <div class="d-flex flex-column vh-100">
         <nav class="bg-dark navbar-dark navbar font-weight-bold ">
            <a class="navbar-brand" href="#">
                <img src="${pageContext.request.contextPath}/resources/images/logo-spring.png" class="d-inline-block align-top" width="30" height="30" alt="">
                Spring
                <%-- <img src="<%=request.getContextPath()%>/resources/images/logo-spring.png" class="d-inline-block align-top" width="30" height="30" alt=""> --%>
             </a>
             <div>
                <a href="#" class="btn btn-success btn-sm ">로그인</a>
             </div>
         </nav>
         <div class="container-fluid flex-grow-1">
            <div class="row h-100">
               <div class="col-md-4 bg-dark text-white p-3">
                  <div class="h-100 d-flex flex-column">
                     <div class="flex-grow-1" style="height: 0px; overflow-y: auto; overflow-x: hidden;">
                     	<%@ include file="/WEB-INF/views/common/menu.jsp"%>
                     </div>
                  </div>
               </div>
               <div class="col-md-8 p-3">
               		<div class="h-100 d-flex flex-column">
               			<div class="flex-grow-1 pr-3" style="height: 0px; overflow-y: auto; overflow-x:auto">
