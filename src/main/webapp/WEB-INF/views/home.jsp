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
            <div class="d-flex flex-column justify-content-center align-items-center" style="height: 400px; background-color: rgb(239, 242, 249)">
			  <div class="container row">
			    <div class="col-1"></div>
			    <div class="col-10 row">
			      <div class="col-4 p-3">
			        <div class="border p-3 bg-light rounded">
			          <div style="border-bottom: solid 2px rgb(138, 138, 138)" class="pb-2 mb-2">
			            <span class="h3">&nbsp;자유 게시판</span>
			            <a class="h3 float-right text-dark" href="homeToBoard">+</a>
			          </div>
			          <table>
			            <tr><td><a href="homeToBoardView" class="text-dark">자유 게시판 제목입니다.</a></td></tr>
			            <tr><td><a>자유 게시판 제목입니다.</a></td></tr>
			            <tr><td><a>자유 게시판 제목입니다.</a></td></tr>
			            <tr><td><a>자유 게시판 제목입니다.</a></td></tr>
			            <tr><td><a>자유 게시판 제목입니다.</a></td></tr>
			          </table>
			        </div>
			      </div>
			      <div class="col-4 p-3">
			        <div class="border p-3 bg-light rounded">
			          <div style="border-bottom: solid 2px rgb(138, 138, 138)" class="pb-2 mb-2">
			            <span class="h3">&nbsp;거래 게시판</span>
			            <a class="h3 float-right text-dark" href="homeToMarket">+</a>
			          </div>
			          <table>
			            <tr><td><a href="homeToMarketView" class="text-dark">거래 게시판 제목입니다.</a></td></tr>
			            <tr><td><a>거래 게시판 제목입니다.</a></td></tr>
			            <tr><td><a>거래 게시판 제목입니다.</a></td></tr>
			            <tr><td><a>거래 게시판 제목입니다.</a></td></tr>
			            <tr><td><a>거래 게시판 제목입니다.</a></td></tr>
			          </table>
			        </div>
			      </div>
			      <div class="col-4 p-3">
			        <div class="border p-3 bg-light rounded">
			          <div style="border-bottom: solid 2px rgb(138, 138, 138)" class="pb-2 mb-2">
			            <span class="h3">&nbsp;공지사항</span>
			            <a class="h3 float-right text-dark" href="homeToNotice">+</a>
			          </div>
			          <table>
			            <tr><td><a href="homeToNoticeView" class="text-dark">공지 사항 제목입니다.</a></td></tr>
			            <tr><td><a>공지 사항 제목입니다.</a></td></tr>
			            <tr><td><a>공지 사항 제목입니다.</a></td></tr>
			            <tr><td><a>공지 사항 제목입니다.</a></td></tr>
			            <tr><td><a>공지 사항 제목입니다.</a></td></tr>
			          </table>
			        </div>
			      </div>
			    </div>
			  </div>
			  <div class="col-1"></div>
			  <div style="font-size: 30px">
			    <span>여러사람들과 소통하고 즐기세요</span>
			    <span style="font-weight: bold; color: rgb(242, 101, 45)">:D</span>
			  </div>
			</div>

    </div>        				
<%@ include file="/WEB-INF/views/common/footer.jsp"%>