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
	            <div class="mb-5">
		          <form action="updateSave" >
	              	<input name="noticeNo" style="display:none;" value="${noticeboard.noticeNo}"/>
	              	<input name="referer" style="display:none;" value="${referer}"/>
	                <input type="text" name="noticeTitle" class="form-control my-3" placeholder="제목을 입력하세요" style="font-size: 25px;" value="${noticeboard.noticeTitle}"></input>
	                <textarea name="noticeContent" class="form-control" placeholder="게시물 내용을 작성해 주세요." style="height: 300px; overflow:auto; font-size: 22px; resize: none;" maxlength="500">${noticeboard.noticeContent}</textarea>
	                <div class="m-2" style="text-align: center;">
	                	<button type="submit" class="btn btn-outline-info border rounded p-2 m-2" style="font-size: 22px; width: 100px;">저  장</button> 
	                	<button type="button" onclick="updateCancle()" class="btn btn-outline-dark border rounded p-2 m-2" style="font-size: 22px; width: 100px;">취  소</button>
	                </div>
	              </form>               
	            </div>
	        </div>                
          <div class="col-2"></div>
        </div>
      </div>
    </section>
	<script>
    	function updateCancle(){
    		location.href = document.referrer;
    	}
    </script>    
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>