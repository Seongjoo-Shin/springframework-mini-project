<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=lt1xd5ne5c"></script>
    <script>
        function showPopUp(a){
            var url;
            var name = "test";
            console.log(a);
            if(a.name === 'allImg'){
                url = "<%=request.getContextPath() %>/take/popUpImg";
            }else{
                url = "<%=request.getContextPath() %>/take/popUp360Img";
            }
            console.log(url);
            var option = "width = 900, height = 900, top = 100, left = 200, location = no"
            window.open(url, name, option);
        }
    </script>
    
    <section class="container-fluid">
        <div class="row">
            <div class="col-2"></div>
            <div class="col-8">
                <div>
                    <h2 class="mt-5 mb-5 text-center">매물 정보</h2>
                </div>
                <div>
                    <div class="col-12 row d-flex justify-content-center" style="padding-right: 0;">
                        <div class="col-6 d-flex flex-column row-cols-sm-1">
                            <img class="rounded" src="${pageContext.request.contextPath}/resources/images/hosImg1.jpg">
                        </div>
                        <div class="col-6 d-flex flex-column row-cols-sm-1">
                            <img class="rounded" src="${pageContext.request.contextPath}/resources/images/hosImg2.jpg">
                        </div>
                    </div>
                    <div class="mt-1 mr-4 p-2 float-right">
                            <span><a class="border rounded p-2" name="allImg" style="text-decoration: none; color:black; cursor: pointer;" onclick="showPopUp(this)">모든 사진 보기 →</a></span>
                            <span><a class="border rounded p-2" name="360Img" style="text-decoration: none; color:black; cursor: pointer;" onclick="showPopUp(this)">360도 사진 보기 →</a></span>
                    </div>
                    <div class="mt-3 flo">
	                	<div>뉴욕플란트 치과</div>
	                </div>
                </div>
                
            </div>
            <div class="col-2"></div>
        </div>
    </section>
               				
<%@ include file="/WEB-INF/views/common/footer.jsp"%>