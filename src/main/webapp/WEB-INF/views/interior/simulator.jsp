<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<section class="container-fluid mb-5">
     <div class="col-2"></div>
     <div class="col-8" style="margin:0 auto">
         <div class="row m-3">
           <button class="btn btn-sm text-dark ml-2" onclick="addPic('troom1.jpg')" style="border: 1px solid;">진료실A</button>
           <button class="btn btn-sm text-dark ml-2" onclick="addPic('troom2.jpg')" style="border: 1px solid;">진료실B</button>
           <button class="btn btn-sm text-dark ml-2" onclick="addPic('doctorRoom1.jpg')" style="border: 1px solid;">원장실</button>
           <button class="btn btn-sm text-dark ml-2" onclick="addPic('lobby1.jpg')" style="border: 1px solid;">로비</button>
         </div>
         <script>
            function addPic(imgName){
                console.log("handleBtn1 running....");
                const content1 = document.getElementById("content1");
                content1.innerHTML = "<img src='${pageContext.request.contextPath}/resources/images/" + imgName +"' width = '100%' height = '500px'/>";
            }
         </script>
         <div class="row">
           <div id = content1 class="col-8">
               <img src = "${pageContext.request.contextPath}/resources/images/troom1.jpg" width="100%" height="500px" style = "border-radius:5px"/>
           </div>
           <div class="col-4" style="border: 1px solid black; border-radius: 5px;">  
               <select class="selectpicker m-1">
                   <option>가구</option>
                   <option>벽지</option>
                   <option>장비</option>
               </select>
               <ul class="ml-3">
                   쇼파
                   <li>
                       <img src="${pageContext.request.contextPath}/resources/images/interior/whitetile.png" width="50px" height="50px"/>
                       <img src="${pageContext.request.contextPath}/resources/images/interior/blacktile.png" width="50px" height="50px"/>
                       <img src="${pageContext.request.contextPath}/resources/images/interior/redtile.png" width="50px" height="50px"/>
                       <img src="${pageContext.request.contextPath}/resources/images/interior/yellowtile.png" width="50px" height="50px"/>
                   </li>
                   테이블
                   <li>
                       <img src="${pageContext.request.contextPath}/resources/images/interior/whitetile.png" width="50px" height="50px"/>
                       <img src="${pageContext.request.contextPath}/resources/images/interior/blacktile.png" width="50px" height="50px"/>
                       <img src="${pageContext.request.contextPath}/resources/images/interior/redtile.png" width="50px" height="50px"/>
                       <img src="${pageContext.request.contextPath}/resources/images/interior/yellowtile.png" width="50px" height="50px"/>
                   </li>
                   벽지
                   <li>
                       <img src="${pageContext.request.contextPath}/resources/images/interior/whitetile.png" width="50px" height="50px"/>
                       <img src="${pageContext.request.contextPath}/resources/images/interior/blacktile.png" width="50px" height="50px"/>
                       <img src="${pageContext.request.contextPath}/resources/images/interior/redtile.png" width="50px" height="50px"/>
                       <img src="${pageContext.request.contextPath}/resources/images/interior/yellowtile.png" width="50px" height="50px"/>
                   </li>
               </ul>
           </div>
         </div>
         
     </div>
     <div class="col-2"></div>
 </section>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>