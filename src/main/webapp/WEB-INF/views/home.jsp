<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
	.hometext {
		font-size: 20px;
	}
</style>
	<script> 
        AOS.init(); 
    </script>
    <section class="container-fluid">
    	<div class="row">
    		<div class="col-5 d-flex" data-aos="fade-up" data-aos-duration="2000" >
    			<div class="d-flex flex-column justify-content-center align-items-center p-4 mt-5 ml-4 h-80" >
	    			<div class="" >
	    				<div class="">
	    					<a href="${pageContext.request.contextPath}/opening/opening">
			                	<img class="border rounded shadow" src="resources/images/mainMap.png" class="img-responsive centor-block w-100 ml-2" style="height: 450px;"/>
			                </a>
			                <div class="d-flex flex-column mt-4">
			                    <div>
			                        <span style="font-size: 30px; font-weight: bold;">START</span>
			                        <span style="font-size: 30px; font-weight: bold; color: rgb(242, 101, 45);">:D</span>
			                        <span style="font-size: 30px; font-weight: bold">EN</span>
			                        <span style="font-size: 30px;">은</span>
			                    </div>
			                    <span class="hometext" style="font-size: 25px;">START DENTIST들과 함께 합니다.</span>
			                    <div>
			                    	<span class="hometext" style="font-size: 25px;">자신만의 병원을 찾아보세요</span>
			                    	<span class="hometext" style="font-weight: bold; color: rgb(242, 101, 45); font-size: 25px;">:D</span>
			                    </div>
			                </div>
	    				</div>
	            	</div>
	    		</div>
	    		<div style="border-right: 2px solid #dee2e6; height:650px; z-index: 100" class="mt-5 ml-5"></div>
    		</div>
    		
    		<div class="col-7" data-aos="fade-left" data-aos-duration="2000">
    			<div class="row">
    				<div class="d-flex flex-row justify-content-center align-items-center rounded mt-3 mr-3p-2  w-100" style="">
		            	<a href="${pageContext.request.contextPath}/take/list">
		            		<img style="margin:16px;" src = "resources/images/mainInsu2.png"/>
		            	</a>
		                <div class="d-flex flex-column ml-5">
		                    <span class="hometext" style="font-size: 25px;">병원을 인수하고 싶으시다고요?</span>
		                    <div >
		                    	<span class="hometext" style="font-size: 25px;">인수에 대한 정보를 얻어보세요</span>
		                    	<span class="hometext" style="font-weight: bold; color: rgb(242, 101, 34); font-size: 25px;">:D</span></span>
		                    </div>
		                    
		                </div>
		            </div>
    			</div>
    			<div class="border"></div>
    			<div class="row">
    				<div class="d-flex flex-column justify-content-center align-items-center rounded mt-3 mr-3 p-4 w-100" >
		                <div>
			                <a href = "/interior/example" class="d-flex w-100 pt-2" style="text-decoration: none;">
			                	<img class="border rounded shadow" src = "resources/images/mainHos1.jpg" width="400px" height="250px"/>
			                    <img class="border rounded ml-4 shadow" src = "resources/images/mainHos2.jpg" width="400px" height="250px"/>
			                </a>
		                </div>
		                <div style="font-size: 30px;" class="mt-3 mb-1">
		                    <span>자신만의 병원을 인테리어 해보세요 </span>
		                    <span style="color: rgb(242, 101, 34);">:D</span>
		                </div>
		            </div>
    			</div>
    		</div>
    	</div>
    	<div class="row">
    		<div data-aos="fade-up" data-aos-duration="2000" class="d-flex flex-column w-100 justify-content-center align-items-center mt-3 p-2">
			  <div class="container-fluid row pt-5" style="height: 250px;">
			    <div class="col-1"></div>
			    <div class="col-10 row mb-3">
			      <div class="col-4">
			        <div class="border p-3 bg-light rounded h-100">
			          <div style="border-bottom: solid 2px rgb(138, 138, 138)" class="pb-2 mb-2">
			            <span class="h3">&nbsp;자유 게시판</span>
			            <a class="h3 float-right text-dark" href="/community/board/list">+</a>
			          </div>
			          <table class="w-100">
			          <colgroup>
			          	<col width="75%"/>
			          	<col width="25%"/>
			          </colgroup>
			          <c:if test="${freeboards.size() > 0}">
			          <c:forEach var="freeboard" items="${freeboards}">
   			          	<tr>
			          		<td><a class="text-dark" href="/community/board/boardDetail?freeNo=${freeboard.freeNo}" style="font-size:20px;">${freeboard.freeTitle }</a></td>
			          		<td><small class="ml-3"><fmt:formatDate value="${freeboard.freeRegistDate}" pattern="yyyy-MM-dd"/></small></td>
			          	</tr>
			          </c:forEach>
			          </c:if>
			          <c:if test="${freeboards.size() < 1}">
			          	<tr">
			          		<td colspan="2" class="text-center" style="font-size:20px;">등록된 게시물이 없습니다.</td>
			          	</tr>
			          </c:if>
			          </table>
			        </div>
			      </div>
			      
			      <div class="col-4">
			        <div class="border p-3 bg-light rounded h-100">
			          <div style="border-bottom: solid 2px rgb(138, 138, 138)" class="pb-2 mb-2">
			            <span class="h3">&nbsp;거래 게시판</span>
			            <a class="h3 float-right text-dark" href="/community/market/list">+</a>
			          </div>
			          <table class="w-100">
			          <colgroup>
			          	<col width="75%"/>
			          	<col width="25%"/>
			          </colgroup>
			          <c:if test="${marketboards.size() > 0}">
			          <c:forEach var="marketboard" items="${marketboards}">
			          	<tr>
			          		<td><a class="text-dark" href="/community/market/marketDetail?marketNo=${marketboard.marketNo}" style="font-size:20px;">${fn:substring(marketboard.marketTitle,0, 15)}</a></td>
			          		<td><small class="ml-3"><fmt:formatDate value="${marketboard.marketRegistDate}" pattern="yyyy-MM-dd"/></small></td>
			          	</tr>
			          </c:forEach>
			          </c:if>
			          <c:if test="${marketboards.size() < 1}">
			          	<tr>
			          		<td colspan="2" class="text-center" style="font-size:20px;">등록된 게시물이 없습니다.</td>
			          	</tr>
			          </c:if>
			          </table>
			        </div>
			      </div>
			      
			      <div class="col-4">
			        <div class="border p-3 bg-light rounded h-100">
			          <div style="border-bottom: solid 2px rgb(138, 138, 138)" class="pb-2 mb-2">
			            <span class="h3">&nbsp;공지사항</span>
			            <a class="h3 float-right text-dark" href="/community/notice/list">+</a>
			          </div>
			          <table class="w-100">
			          <colgroup>
			          	<col width="75%"/>
			          	<col width="25%"/>
			          </colgroup>
			          <c:if test="${noticeboards.size() > 0}">
			          <c:forEach var="noticeboards" items="${noticeboards}">
			          	<tr>
			          		<td><a class="text-dark" href="/community/notice/noticeDetail?noticeNo=${noticeboards.noticeNo}" style="font-size:20px;">${noticeboards.noticeTitle }</a></td>
			          		<td><small class="ml-3"><fmt:formatDate value="${noticeboards.noticeRegistDate}" pattern="yyyy-MM-dd"/></small></td>
			          	</tr>
			          </c:forEach>
			          </c:if>
			          <c:if test="${noticeboards.size() < 1}">
			          	<tr>
			          		<td colspan="2" class="text-center mt-2" style="font-size:20px;">등록된 게시물이 없습니다.</td>
			          	</tr>
			          </c:if>
			          </table>
			        </div>
			      </div>
			      
			    </div>
			  	<div class="col-1"></div>
			  </div>
			  <div style="font-size: 25px;" class="mt-5 mb-4">
			    <span class="p-2">여러사람들과 소통하고, 정보를 얻을 수 있어요.</span>
			    <span style="font-weight: bold; color: rgb(242, 101, 45)">:D</span>
			  </div>
			</div>
    	</div>
    </section>      				
<%@ include file="/WEB-INF/views/common/footer.jsp"%>