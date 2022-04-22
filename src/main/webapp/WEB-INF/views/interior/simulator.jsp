<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

      <section class="container-fluid mb-5">
          <div class="col-2"></div>
          <div class="col-8" style="margin:0 auto">
          <h4 class="p-3 mt-3">나만의 인테리어 만들기</h4>  
              <div class="row m-3">
                <button class="btn btn-sm text-dark ml-2" onclick="addPic('troom1.jpg','div1')" style="border: 1px solid;">진료실A</button>
                <button class="btn btn-sm text-dark ml-2" onclick="addPic('troom2.jpg','div2')" style="border: 1px solid;">진료실B</button>
                <button class="btn btn-sm text-dark ml-2" onclick="addPic('doctorRoom1.jpg','div3')" style="border: 1px solid;">원장실</button>
                <button class="btn btn-sm text-dark ml-2" onclick="addPic('lobby1.jpg','div4')" style="border: 1px solid;">로비</button>
                <script>
		            function addPic(imgName,divId){
		                console.log("handleBtn1 running....");
		                const content1 = document.getElementById("content1");
		                content1.innerHTML = "<img src='${pageContext.request.contextPath}/resources/images/" + imgName +"' width = '100%' height = '500px'/>";
		                document.getElementById(divId).style.display = "block";
		                var step;
		                var nDiv;
		                for(step = 1; step<5; step++){
		                    nDiv = 'div'+step;
		                    if(divId !== nDiv){
		                        document.getElementById(nDiv).style.display = "none";
		                    }
		                }
		            }
		        </script>
              </div>
              <div class="row">
                <div id = content1 class="col-8">
                     <img src = "${pageContext.request.contextPath}/resources/images/troom1.jpg" width="100%" height="500px" style = "border-radius:5px"/>
                </div>
                <div id="div1" class="col-4" style="border: 1px solid black; border-radius: 5px; display: block;" >
                
                    <ul class="ml-3">
                        벽지
                        <li>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/whitetile.png" width="50px" height="50px"/>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/blacktile.png" width="50px" height="50px"/>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/redtile.png" width="50px" height="50px"/>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/yellowtile.png" width="50px" height="50px"/>
                        </li>
                        바닥
                        <li>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/whitetile.png" width="50px" height="50px"/>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/blacktile.png" width="50px" height="50px"/>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/redtile.png" width="50px" height="50px"/>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/yellowtile.png" width="50px" height="50px"/>
                        </li>
                        베드
                        <li>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/whitetile.png" width="50px" height="50px"/>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/blacktile.png" width="50px" height="50px"/>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/redtile.png" width="50px" height="50px"/>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/yellowtile.png" width="50px" height="50px"/>
                        </li>
                    </ul>
                </div>
                <div id="div2" class="col-4" style="border: 1px solid black; border-radius: 5px; display: none;" >  
                    <ul class="ml-3">
                        벽지
                        <li>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/redtile.png" width="50px" height="50px"/>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/yellowtile.png" width="50px" height="50px"/>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/whitetile.png" width="50px" height="50px"/>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/blacktile.png" width="50px" height="50px"/>
                        </li>
                        바닥
                        <li>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/yellowtile.png" width="50px" height="50px"/>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/whitetile.png" width="50px" height="50px"/>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/blacktile.png" width="50px" height="50px"/>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/redtile.png" width="50px" height="50px"/>
                        </li>
                        베드
                        <li>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/whitetile.png" width="50px" height="50px"/>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/blacktile.png" width="50px" height="50px"/>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/redtile.png" width="50px" height="50px"/>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/yellowtile.png" width="50px" height="50px"/>
                        </li>
                    </ul>
                </div>
                <div id="div3" class="col-4" style="border: 1px solid black; border-radius: 5px; display: none;" >  
                    <ul class="ml-3">
                        벽지
                        <li>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/redtile.png" width="50px" height="50px"/>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/yellowtile.png" width="50px" height="50px"/>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/whitetile.png" width="50px" height="50px"/>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/blacktile.png" width="50px" height="50px"/>
                        </li>
                        바닥
                        <li>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/yellowtile.png" width="50px" height="50px"/>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/whitetile.png" width="50px" height="50px"/>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/blacktile.png" width="50px" height="50px"/>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/redtile.png" width="50px" height="50px"/>
                        </li>
                        테이블
                        <li>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/whitetile.png" width="50px" height="50px"/>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/blacktile.png" width="50px" height="50px"/>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/redtile.png" width="50px" height="50px"/>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/yellowtile.png" width="50px" height="50px"/>
                        </li>
                        의자
                        <li>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/whitetile.png" width="50px" height="50px"/>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/blacktile.png" width="50px" height="50px"/>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/redtile.png" width="50px" height="50px"/>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/yellowtile.png" width="50px" height="50px"/>
                        </li>
                    </ul>
                </div>
                <div id="div4" class="col-4" style="border: 1px solid black; border-radius: 5px; display: none;" >  
                    <ul class="ml-3">
                        쇼파
                        <li>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/redtile.png" width="50px" height="50px"/>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/yellowtile.png" width="50px" height="50px"/>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/whitetile.png" width="50px" height="50px"/>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/blacktile.png" width="50px" height="50px"/>
                        </li>
                        데스크
                        <li>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/yellowtile.png" width="50px" height="50px"/>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/whitetile.png" width="50px" height="50px"/>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/blacktile.png" width="50px" height="50px"/>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/redtile.png" width="50px" height="50px"/>
                        </li>
                        바닥
                        <li>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/whitetile.png" width="50px" height="50px"/>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/blacktile.png" width="50px" height="50px"/>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/redtile.png" width="50px" height="50px"/>
                            <img src="${pageContext.request.contextPath}/resources/images/interior/bluetile.png" width="50px" height="50px"/>
                        </li>
                    </ul>
                </div>
                <div class="row" style="padding: 15px;">
		          <a href="simulator" class="btn btn-sm ml-3" style="height: 50px; background-color: rgb(242, 101, 45); font-size: 25px; color: white;">내 인테리어 만들어보기 -></a>
		        </div>
          </div>
          <div class="col-2"></div>
      </section>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>