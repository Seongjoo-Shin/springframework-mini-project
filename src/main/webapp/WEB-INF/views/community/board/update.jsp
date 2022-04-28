<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

    <section>
      <div class="container-fluid h-100 my-5">
        <div class="row">
          <div class="col-2"></div>
          <div class="col-8">
            <div class="h3 border-bottom mb-3"><img src="${pageContext.request.contextPath}/resources/images/writing.png">글쓰기</div>
            <div class="mb-5">
              <form id="freeBoardWriteForm" method="post" action="freeBoardWrite" enctype="multipart/form-data">
                <input type="text" class="form-control my-3" placeholder="제목을 입력하세요" name="title"></input>
                <textarea class="form-control" placeholder="게시물 내용을 작성해 주세요." style="height: 300px; overflow-y:scroll" name="content"></textarea>
                <button type="submit" class="btn bg-light mt-3 float-right" style="border: solid 1px rgb(224, 216, 216);">취  소</button>
                <button type="submit" class="btn bg-light mt-3 float-right" style="border: solid 1px rgb(224, 216, 216);">저  장</button>                
              </form>              
            </div>            
            <div class="col-2"></div>
          </div>
        </div>
      </div>
    </section>
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>