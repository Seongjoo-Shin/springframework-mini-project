<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

    <section style="flex-grow:1;">
      <div class="d-flex align-items-center justify-content-center mb-5">
      	<img alt="" src="${pageContext.request.contextPath}/resources/images/freeBoard.png" style="width:100%">
      </div>
      <div class="container-fluid my-5">
        <div class="row">
          <div class="col-2"></div>
          <div class="col-8">
            <div class="h3 border-bottom mb-3"><img src="${pageContext.request.contextPath}/resources/images/writing.png">글쓰기</div>
            <div class="mb-5">
              <form id="updateForm" method="post" action="updateForm" enctype="multipart/form-data">
              	<input type="hidden" name="freeNo" value="${freeBoardDto.freeNo}"/>
                <input type="text" class="form-control my-3" name="title" value="${freeBoardDto.freeTitle}"></input>
                <textarea class="form-control" style="height: 300px; resize:none;" name="content" maxlength="500" >${freeBoardDto.freeContent}</textarea>
                <div class="pagination justify-content-center mb-0">
                    <button type="button" onclick="goSubmit()" class="btn bg-light mt-3 mx-3 btn-lg" style="border: solid 1px rgb(224, 216, 216);">수정 완료</button>
                    <button type="button" onclick="cancle()" class="btn bg-light mt-3 mx-3 btn-lg" style="border: solid 1px rgb(224, 216, 216);">취&nbsp;&nbsp;&nbsp;소</button>
                </div>
              </form>              
            </div>            
            <div class="col-2"></div>
          </div>
        </div>
      </div>
    </section>
    <script>
	    function cancle(){
		      /* $(location).attr("href", "insertCancle") */
	    	location.href = document.referrer;
	    }
		function goSubmit(){
		      $("#updateForm").submit(); //form태그의 action="insertContent"탐
		    }    
    </script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>