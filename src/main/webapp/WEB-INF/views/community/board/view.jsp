<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    <section>
      <div style="height: 250px;" class="bg-light d-flex align-items-center justify-content-center">
        <h1 class="">자유 게시판</h1>
      </div>
      <div class="container-fluid h-100 mt-5">
        <div class="row">
          <div class="col-2"></div>
          <div class="col-8">
            <div class="mb-5">
              <div>
                <p class="d-inline-block h6 mx-2">글쓴이 <span class="ml-1">${freeBoardDto.userDto.userNickname}</span></p>
                <p class="d-inline-block h6 float-right mx-2">조회수: <span>${freeBoardDto.freeHitCount}</span></p>
                <p class="d-inline-block h6  float-right mx-2"><fmt:formatDate value="${freeBoardDto.freeRegistDate}" pattern="hh:mm"/></p>
                <p class="d-inline-block h6 float-right mx-2"><fmt:formatDate value="${freeBoardDto.freeRegistDate}" pattern="yyyy-MM-dd"/></p>            
              </div>
              <div id="free-board-title" class="h4 p-3" style="border: 1px solid rgb(224, 224, 224); border-radius: 10px;">${freeBoardDto.freeTitle}</div>
              <div id="free-board-content" class="px-3 py-5" style="border: 1px solid rgb(224, 224, 224); border-radius: 10px;">${freeBoardDto.freeContent}</div>
              <div class="text-center mt-3">
				<c:if test="${sessionUserId == freeBoardDto.freeWriter}">
					<a href="/community/board/freeBoardPostingDelete?freeNo=${freeBoardDto.freeNo}" class="btn btn-sm btn-outline-dark" style="width:100px;">수정</a>
				</c:if>  	
				<a href="/community/board/list" class="btn btn-sm btn-outline-dark" style="width:100px;">목록</a>
				<c:if test="${sessionUserId == freeBoardDto.freeWriter}">
					<a href="/community/board/freeBoardPostingDelete?freeNo=${freeBoardDto.freeNo}" class="btn btn-sm btn-outline-dark" style="width:100px;">삭제</a>
				</c:if> 
              </div>
              <div id="free-board-coment" class="my-5">
                  <div class="h6" style="font-weight: bold;">댓글</div>
                  <ul class="list-group">
                    <li class="list-group-item">
                      <div class="row" style="display: flex;">
                        <div style="flex: 8; padding: 4px 13px;">
                          <p style="font-weight: bold;">만식's 주인</p>
                          <div class="comment-text">
                            Google Style Login Page Design Using Bootstrap
                          </div>
                          <p><small>2022-04-10</small></p>
                        </div>
                        <div class="d-flex flex-column comment2" style="margin-right: 13px;">
                          <button class="commentBtn">수정</button>
                          <button class="commentBtn">삭제</button>
                        </div>
                      </div>
                    </li>
                    <li class="list-group-item">
                      <div class="row" style="display: flex;">
                        <div style="flex: 8; padding: 4px 13px;">
                          <p style="font-weight: bold;">만식's 주인</p>
                          <textarea placeholder="댓글을 입력해 주세요." style="display: block; width: 100%; height: 60px; resize: none; maxlength="150"></textarea>
                        </div>
                        <div class="d-flex flex-column justify-content-end mb-3" style="margin-right: 13px;">
                          <button class="commentBtn" >등록</button>
                        </div>
                      </div>
                  </li>
                  </ul>
              </div>
            </div>           
          <div class="col-2"></div>
        </div>
      </div>
      </div>
    </section>
    <script>
    	
    </script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>