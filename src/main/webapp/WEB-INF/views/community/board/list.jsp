<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    <section style="flex-grow:1;">
      <div class="d-flex align-items-center justify-content-center mb-5">
      	<img alt="" src="${pageContext.request.contextPath}/resources/images/freeBoard.png" style="width:100%">
      </div>
      <div class="container-fluid">
        <div class="row">
          <div class="col-2"></div>
          <div class="col-8">
            <!-- 게시판 시작 -->
            <div class="row mt-5">
              <div class="col-lg-12">
                <div class="table-responsive">
                  <table
                    class="table project-table table-centered table-nowrap table-hover" 
                  >
                    <thead>
                      <tr>
                        <th scope="col" style="font-size:20px;">#</th>
                        <th scope="col" style="text-align: center; font-size:20px;">제목</th>
                        <th scope="col" style="text-align: center; font-size:20px;">작성자</th>
                        <th scope="col" style="text-align: center; font-size:20px;">작성일</th>
                        <th scope="col" style="font-size:20px;">조회</th>
                      </tr>
                    </thead>
                    <tbody style="font-size:18px;">
                    <c:set var="num" value="${totalBoardNum - ((pager.pageNo-1) * 10) }"/>  
						<c:forEach var="freeboard" items="${freeboards}">
		                    <tr>
		                      <th scope="row">${num }</th>
		                      <td><a class="text-dark" href="boardDetail?freeNo=${freeboard.freeNo}&pageNo=${pager.pageNo}">${freeboard.freeTitle}</a></td>
		                      <td style="text-align: center;">${freeboard.userDto.userNickname}</td>
		                      <td style="text-align: center;"><fmt:formatDate value="${freeboard.freeRegistDate}" pattern="yyyy-MM-dd"/></td>
		                      <td>${freeboard.freeHitCount}</td>
		                    </tr>
		                    <c:set var="num" value="${num-1}"></c:set>
						</c:forEach>
                    </tbody>
                  </table>
                </div>
                <!-- end project-list -->
                
                <div class="float-right">
                    <a href="insert" type="button" class="btn p-2 btn-outline-dark m-1 border" style="font-size: 20px; width:90px;">글쓰기</a>
                </div>
                
				<!-- 페이지 처리 -->
                <div class="pt-3 my-3">
                  <ul class="pagination justify-content-center mb-0">
	               	<li class="page-item">
						<a class="page-link" href="list?pageNo=1">First</a>
					</li>
					<c:if test="${pager.groupNo>1}">
						<li class="page-item">
							<a class="page-link" href="list?pageNo=${pager.startPageNo-1}">Previous</a>
						</li>
					</c:if>
                    
                    <c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}"><!-- 시작 페이지부터 마지막 페이지까지 반복 -->
						<c:if test="${pager.pageNo != i}">
							<li class="page-item">
								<a class="page-link" href="list?pageNo=${i}">${i}</a>
							</li>
						</c:if>
						<c:if test="${pager.pageNo == i}">
							<li class="page-item active">
								<a class="page-link" href="list?pageNo=${i}">${i}</a>
							</li>
						</c:if>
					</c:forEach>
					<c:if test="${pager.groupNo<pager.totalGroupNo}">
						<li class="page-item">
	                      <a class="page-link" href="list?pageNo=${pager.endPageNo+1}">Next</a>
	                    </li>
					</c:if>
					<li class="page-item">
	                	<a class="page-link" href="list?pageNo=${pager.totalPageNo}">Last</a>
	                </li>
                  </ul>
                </div>
                <!-- 페이지 처리 끝 -->
	            <div id="search" class="mb-5 mt-3">
	              <form id="searchForm" action="list" class="form-inline my-2 my-lg-0 justify-content-center" enctype="multipart/form-data">
	                <select id="searchType" name="searchType" class="border rounded m-1" style="padding: 6px 12px;">
	                  <option value="all" <c:if test="${searchType ne '내용' || searchType ne '제목'}">selected</c:if>>전체</option>
	                  <option value="content" <c:if test="${searchType eq '내용'}">selected</c:if>>내용</option>
	                  <option value="title" <c:if test="${searchType eq '제목'}">selected</c:if>>제목</option>
	                </select>
	                <input 
	                	class="form-control my-1"
	                	type="text" 
	                	style="padding:9px;"
	                	name="searchContent" 
	                	placeholder="검색어를 입력해 주세요." 
	                	aria-label="Search" 
	                	width="300" 
	                	value="${searchContent}"/>
	                <input type="submit" value="검색" class="btn btn-outline-success my-2 my-sm-0 ml-1"/>
	              </form>
                </div>                
              </div>
            </div>
          </div>
          <div class="col-2"></div>
        </div>
      </div>
    </section>
    <script>
    	
    </script>
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>