<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    <section>
      <div style="height: 250px;" class="bg-light d-flex align-items-center justify-content-center">
        <h1 class="">자유 게시판</h1>
      </div>
      <div class="container-fluid h-100">
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
                        <th scope="col">#</th>
                        <th scope="col" style="text-align: center;">제목</th>
                        <th scope="col" style="text-align: center;">작성자</th>
                        <th scope="col" style="text-align: center;">작성일</th>
                        <th scope="col">조회</th>
                      </tr>
                    </thead>
                    <tbody>          
						<c:forEach var="freeboard" items="${freeboards}">
		                    <tr>
		                      <th scope="row">${freeboard.freeNo}</th>
		                      <td><a href="boardDetail?freeNo=${freeboard.freeNo}">${freeboard.freeTitle}</a></td>
		                      <td style="text-align: center;">${freeboard.userDto.userNickname}</td>
		                      <td  style="text-align: center;"><fmt:formatDate value="${freeboard.freeRegistDate}" pattern="yyyy-MM-dd"/></td>
		                      <td>${freeboard.freeHitCount}</td>
		                    </tr>
						</c:forEach>
                    </tbody>
                  </table>
                </div>
                <!-- end project-list -->
                
                <div class="float-right">
                    <a href="insert" type="button" class="btn px-2 btn-secondary">글쓰기</a>
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
<!--                     <li class="page-item disabled">
                      <a
                        class="page-link"
                        href="#"
                        tabindex="-1"
                        aria-disabled="true"
                        >Previous</a>
                    </li> -->
                    
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