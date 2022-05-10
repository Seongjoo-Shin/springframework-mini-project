<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

    <section style="flex-grow:1;">
      <div class="d-flex align-items-center justify-content-center">
      	<img alt="" src="${pageContext.request.contextPath}/resources/images/noticeBoard3.png" style="width:100%">
      </div>
      <div class="container-fluid my-5">
        <div class="row">
          <div class="col-2"></div>
          <div class="col-8">
            <div class="h3 border-bottom mb-3"><img src="${pageContext.request.contextPath}/resources/images/writing.png">글쓰기</div>
	            <div class="mb-4">
	              <form method="post" action="insertNoticeContent" id="insertForm">
	                <input id="title" name="title" type="text" class="form-control my-3" style="font-size: 25px;" placeholder="제목을 입력하세요" required="required"/>
	                <textarea name="content" class="form-control" placeholder="게시물 내용을 작성해 주세요." style="height: 300px; overflow:auto; resize:none; font-size: 22px;" maxlength="500" required="required"></textarea>
	                <div class="pagination justify-content-center mb-0 mt-5">
	                    <button type="button" onclick="goSubmit()" class="btn btn-outline-info border rounded p-2 m-2" style="font-size: 22px; width: 100px;">등  록</button>
	                    <button type="button" onclick="cancle()" class="btn btn-outline-danger border rounded p-2 m-2" style="font-size: 22px; width: 100px;">취  소</button>
	                </div>             
	              </form>              
	            </div>
	        </div>                
          <div class="col-2"></div>
        </div>
      </div>
    </section>
    <script>
	    function cancle(){
	      	$(location).attr("href", "insertNoticeCancle")
	    }
	    function goSubmit(){
	    	$("#title").
	      	$("#insertForm").submit(); //form태그의 action="insertContent"탐
	   }
  	</script>
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>