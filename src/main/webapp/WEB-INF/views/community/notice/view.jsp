<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

    <section style="flex-grow:1;">
      <div class="d-flex align-items-center justify-content-center pt-3">
      	<img alt="" src="${pageContext.request.contextPath}/resources/images/notice.png" style="width:100%">
        <!-- <h1 class="">공지사항</h1> -->
      </div>
      <div class="container-fluid mt-5">
        <div class="row">
          <div class="col-2"></div>
          <div class="col-8">
            <div class="mb-5">
              <div>
                <p class="d-inline-block h6 mx-2">글쓴이 <span class="ml-1">${noticeboard.userDto.userNickname}</span></p>
                <p class="d-inline-block h6 float-right mx-2">조회수: <span>${noticeboard.noticeHitCount}</span></p>
                <p class="d-inline-block h6  float-right mx-2"><fmt:formatDate value="${noticeboard.noticeRegistDate}" pattern="HH:mm"/></p>
                <p class="d-inline-block h6 float-right mx-2"><fmt:formatDate value="${noticeboard.noticeRegistDate}" pattern="yyyy-MM-dd"/></p>            
              </div>
              <div id="noticeTitle" class="h4 p-3" style="border: 1px solid rgb(224, 224, 224); border-radius: 10px; ">${noticeboard.noticeTitle}</div>
              <div id="noticeContent" class="px-3 py-5" style="border: 1px solid rgb(224, 224, 224); border-radius: 10px;">
                ${noticeboard.noticeContent}
              </div>
            </div>
            <div class="buttons my-5 d-flex justify-content-center">
                <a class="btn btn-outline-dark mr-3" style="width:100px; height:40px;" href="list">목록</a>
            </div>       
          <div class="col-2"></div>
        </div>
      </div>
      </div>
    </section>
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>