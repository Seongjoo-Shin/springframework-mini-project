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
              <form method="post" action="" id="insertForm">
                <input id="title" type="text" class="form-control my-3" maxlength="100" placeholder="제목을 입력하세요" name="title" style="font-size: 25px;"></input>
                <textarea id="content" class="form-control" placeholder="게시물 내용을 작성해 주세요." maxlength="4000" style="height: 300px; overflow:auto; resize:none; font-size: 22px;" name="content"></textarea>
                <div class="pagination justify-content-center mt-2">
	                <button type="button" onclick="goSubmit()" class="btn btn-outline-info border rounded p-2 m-2" style="font-size: 22px; width: 100px;">등  록</button>
	                <button type="button" onclick="cancle()" class="btn btn-outline-danger border rounded p-2 m-2" style="font-size: 22px; width: 100px;">취  소</button>
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
	      $(location).attr("href", "insertCancle")
	    }
	    
	   	function goSubmit() {
	   		var title = document.getElementById('title');
	   		var titleValue = title.value;
	   		
	   		var content = document.getElementById('content');
	   		var contentValue = content.value;
		
			let form = document.getElementById('insertForm');
	   		
	   		form.action = 'insertContent';
	   		form.method = 'POST';
	
	    	if(!titleValue){
	        	swal({
	        		icon:"${pageContext.request.contextPath}/resources/images/errorMascot.png",
	        		text:"제목을 작성해주세요!"
	        	});
	        	return;
	    	}else if(!contentValue){
	        	swal({
	        		icon:"${pageContext.request.contextPath}/resources/images/errorMascot.png",
	        		text:"내용을 작성해주세요!"
	        	});
	    		return;
	    	}else{
	        	swal({text:"작성되었습니다!"}).then(()=>{
	        		form.submit();
				});
	        	
	    	}
		}    
  	</script>
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>