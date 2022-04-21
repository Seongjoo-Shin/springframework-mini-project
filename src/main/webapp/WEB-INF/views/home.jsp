<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="d-flex flex-column">
            <div class="d-flex flex-row justify-content-center align-items-center" style="background-color: rgb(248,244,239);">
                <div class="d-flex flex-column mr-5">
                    <div>
                        <span style="font-size: 30px; font-weight: bold;">START</span>
                        <span style="font-size: 30px; font-weight: bold;">:D</span>
                        <span style="font-size: 30px; font-weight: bold">EN</span>
                        <span style="font-size: 30px;">은</span>
                    </div>
                    <span>START DENTIST들과 함께</span>
                    <span>합니다.</span>
                    <span>자신만의 병원을</span>
                    <div>
                        <span>찾아보세요</span>
                        <span style="font-weight: bold; color: rgb(242, 101, 45);">:D</span>
                    </div>
                </div>
                <a href="${pageContext.request.contextPath}/opening/opening">
                	<img src="resources/images/main1_img.png" class="img-responsive centor-block m-3" style="height: 400px;"/>
                </a>
            </div>
            <div class="d-flex flex-row justify-content-center align-items-center"  style="background-color: rgb(239,242,249);">
            	<a href="${pageContext.request.contextPath}/take/list">
            		<img src = "resources/images/main2_img.png" style="width:700px; height: 400px;"/>
            	</a>
                <div class="d-flex flex-column">
                    <span>병원을 인수하고</span>
                    <span>싶으시다고요?</span>
                    <span>이곳에서 인수에 대한</span>
                    <span>정보를 얻으세요!</span>
                </div>
            </div>
            <div class="d-flex flex-column justify-content-center align-items-center" style="height: 400px; background-color: rgb(248,244,239);">
                <div>
	                <a href = "/interior/example">
	                	<img src = "resources/images/main3_img.png"/>
	                    <img src = "resources/images/main4_img.jpg"/>
	                </a>
                </div>
                <div style="font-size: 30px;">
                    <span>자신만의 병원을 찾아보세요</span>
                    <span style="font-weight: bold; color: rgb(242, 101, 45);">:D</span>
                </div>
            </div>
            <div class="d-flex flex-column justify-content-center align-items-center" style="height: 400px; background-color: rgb(239,242,249);">
                <div>
                	<a href="${pageContext.request.contextPath}/community/board/list" ><img src = "resources/images/main5_1.png" width="420px" height="230px"/></a>
                	<a href="${pageContext.request.contextPath}/community/market/list"><img src = "resources/images/main5_2.png" width="420px" height="230px"/></a>
                	<a href="${pageContext.request.contextPath}/community/notice/list"><img src = "resources/images/main5_3.png" width="420px" height="230px"/></a>
                </div>
                
                <div style="font-size: 30px;">
                    <span>여러사람들과 소통하고 즐기세요</span>
                    <span style="font-weight: bold; color: rgb(242, 101, 45);">:D</span>
                </div>
            </div>
    </div>        				
<%@ include file="/WEB-INF/views/common/footer.jsp"%>