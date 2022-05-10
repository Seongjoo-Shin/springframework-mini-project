<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

    <section style="flex-grow:1;">
      <div class="d-flex align-items-center justify-content-center pt-3 mt-2">
      	<img alt="" src="${pageContext.request.contextPath}/resources/images/notice.png" style="width:100%">
        <!-- <h1 class="">공지사항</h1> -->
      </div>
      <div class="container-fluid mt-5">
        <div class="row">
          <div class="col-2"></div>
          <div class="col-8">
            <div class="mb-5">
              <div class="mt-2">
                <p class="d-inline-block h6 mx-2">글쓴이 <span class="ml-1">${noticeboard.userDto.userNickname}</span></p>
                <p class="d-inline-block h6 float-right mx-2">조회수: <span>${noticeboard.noticeHitCount}</span></p>
                <p class="d-inline-block h6  float-right mx-2"><fmt:formatDate value="${noticeboard.noticeRegistDate}" pattern="HH:mm"/></p>
                <p class="d-inline-block h6 float-right mx-2"><fmt:formatDate value="${noticeboard.noticeRegistDate}" pattern="yyyy-MM-dd"/></p>            
              </div>
              
              <div id="noticeTitle" class="h4 p-3 border rounded" style="font-size:25px;">${noticeboard.noticeTitle}</div>
              <div id="noticeContent" class="p-4 border rounded" style="font-size:22px;">
                ${noticeboard.noticeContent}
              </div>
            </div>
            <div class="buttons my-5 d-flex justify-content-center">
                <a class="btn btn-outline-dark p-2 m-2" style="font-size:22px; width: 100px;" href="list?pageNo=${pageNo}">목록</a>
                <c:if test="${sessionMid eq 'admin'}">
               		<a class="btn btn-outline-info p-2 m-2" style="font-size:22px; width: 100px;" href="update?noticeNo=${noticeboard.noticeNo}" >수정</a>
               		<a id="deleteBtn" class="btn btn-outline-danger p-2 m-2" style="font-size:22px; width: 100px;" onclick="deleteNoticeBoard()">삭제</a>
               	</c:if>
            </div>       
          <div class="col-2"></div>
        </div>
      </div>
      </div>
    </section>
    
    <script>
    	function deleteNoticeBoard(){
    		swal("공지 게시물을 삭제하시겠습니까?", {
    			dangerMode: true,
    			buttons: true,
    		}).then((result) => {
    			if(result == true){
    				
    				$.ajax({
    					method: 'POST',
    	            	url:'deleteNoticeBoard',
    	            	data: {noticeNo : `${noticeboard.noticeNo}`}
    				}).done((data) => {
    					if(data == "success"){
    						swal("삭제되었습니다.", {
    	   				      	icon: "success",
    	   				    }).then(()=>{
    	   				    	location.href = "list";
    	   				    });
    					}else{
    						swal("삭제되지 않았습니다.", {
    	   				      	icon: "error",
    	   				    });
    					}
    				});
    				
    			}else{
    				swal("삭제가 취소되었습니다.");
    			}
    		});
    		//delete?noticeNo=${noticeboard.noticeNo}
    	}
    </script>
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>