<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

    <section style="flex-grow:1;">
      <div style="height: 250px;" class="bg-light d-flex align-items-center justify-content-center">
        <h1 class="">공지사항</h1>
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
                        <th scope="col">공지</th>
                        <th scope="col" style="text-align: center;">제목</th>
                        <th scope="col">작성자</th>
                        <th scope="col" style="text-align: center;">작성일</th>
                        <th scope="col">조회</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="i" begin="1" end="10">
                     	<tr style="cursor: pointer">
	                        <td><button class="noticeBtn">공지</button></td>
	                        <td><a class="text-dark" href="noticeDetail">New admin Design</a></td>
	                        <td>닉네임</td>
	                        <td style="text-align: center;">2022.02.12</td>
	                        <td>13</td>
                     	</tr>
                    </c:forEach>
                    </tbody>
                  </table>
                </div>
                <!-- end project-list -->
                
                <div class="float-right">
                    <a href="insert" type="button" class="btn px-2 btn-secondary">글쓰기</a>
                </div>
                
				<!-- 페이징처리 -->
                <div class="pt-3 my-3">
                  <ul class="pagination justify-content-center mb-0">
                    <li class="page-item disabled">
                      <a
                        class="page-link"
                        href="#"
                        tabindex="-1"
                        aria-disabled="true"
                        >Previous</a>
                    </li>
                    <c:forEach var="i" begin="11" end="20">
                    	<li class="page-item">
                      		<a class="page-link" href="#"><p><c:out value="${i}"/></p></a>
                    	</li>
                    </c:forEach>
                    <li class="page-item">
                      <a class="page-link" href="#">Next</a>
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
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>