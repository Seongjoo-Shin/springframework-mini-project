<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

    <section style="flex-grow:1;">
      <div class="d-flex align-items-center justify-content-center pt-3">
      	<img alt="" src="${pageContext.request.contextPath}/resources/images/notice.png" style="width:100%">
        <!-- <h1 class="">공지사항</h1> -->
      </div>
      <div class="container-fluid ">
        <div class="row">
          <div class="col-2"></div>
          <div class="col-8">
            <!-- 게시판 시작 -->
            <div class="row mt-5">
              <div class="col-lg-12">
                <div class="table-responsive">
                  <table class="table project-table table-centered table-nowrap table-hover">
                    <thead>
                      <tr>
                        <th scope="col" >공지</th>
                        <th scope="col" style="text-align: center;">제목</th>
                        <th scope="col">작성자</th>
                        <th scope="col" style="text-align: center;">작성일</th>
                        <th scope="col">조회</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="noticeboard" items="${noticeboards}">
                     	<tr style="cursor: pointer">
	                        <td><button class="noticeBtn">공지</button></td>
	                        <td><a class="text-dark" href="noticeDetail?noticeNo=${noticeboard.noticeNo}">${noticeboard.noticeTitle}</a></td>
	                        <td>${noticeboard.userDto.userNickname}</td>
	                        <td style="text-align: center;"><fmt:formatDate value="${noticeboard.noticeRegistDate}" pattern="yyyy-MM-dd"/></td>
	                        <td>${noticeboard.noticeHitCount}</td>
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
              </div>
            </div>
          </div>
          <div class="col-2"></div>
        </div>
      </div>
    </section>
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>