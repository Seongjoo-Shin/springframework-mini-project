<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

    <section>
      <div class="container-fluid h-100 my-5">
        <div class="row">
          <div class="col-2"></div>
          <div class="col-8 row">
            <div class="minimenu col-12 mb-4" style="border-bottom: solid;">
              <div class="dropdown">
                <button id="dropbtn" class="btn dropbtn" style="height:37.62px"><img src="${pageContext.request.contextPath}/resources/images/stick.png" style="height: 15px; width: 15px;" class="mr-2">카테고리</button><!--눌렀을때 효과-->
                <div class="dropdown-content">
                  <a class="dropdown-item" href="#">전체</a>
                  <a class="dropdown-item" href="#">장비</a>
                  <a class="dropdown-item" href="#">가구</a>
                  <a class="dropdown-item" href="#">소모품</a>
                  <a class="dropdown-item" href="#">기타</a>
                </div>
              </div>
              <div class="dropdown">
                <button id="dropbtn" class="btn dropbtn" style="height: 37.62px;">최신순 ▼</button><!--눌렀을때 효과-->
                <div class="dropdown-content">
                  <a class="dropdown-item" href="#">인기순</a>
                </div>
              </div>
            </div>
            <div class="cardrow mb-4 col-12 d-flex justify-content-center">
            <c:forEach var="i" begin="1" end="4">
              <div class="col-3 marketCard">
                <div class="card marketCard" onclick="location.href='marketDetail'" style="cursor: pointer">
                  <div class="embed-responsive embed-responsive-4by3">
                    <img src="${pageContext.request.contextPath}/resources/images/marketListSample1.jpg" alt="" class="card-img-top row-cols-1 embed-responsive-item"/>
                  </div>
                  <div class="card-body" style="padding: 1rem;">
                    <p style="margin-bottom: 0px;">제목입니다.</p>
                    <p style="margin-bottom: 7px; font-weight: bold;">900,000원</p>
                    <button class="float-right recommentCount"><img src="${pageContext.request.contextPath}/resources/images/fullheart.png" width="16px">13</button>
                    <p style="margin-bottom: 0px; font-size:15px;">작성자</p>
                    <p style="margin-bottom: 0px; font-size:15px;">2022-04-21</p>
                  </div>
                </div>
              </div>       
            </c:forEach>
            </div>
            <div class="cardrow mb-4 col-12 d-flex justify-content-center">
            <c:forEach var="i" begin="1" end="4">
              <div class="col-3 marketCard">
                <div class="card" style="cursor: pointer">
                  <div class="embed-responsive embed-responsive-4by3">
                    <img src="${pageContext.request.contextPath}/resources/images/marketListSample1.jpg" alt="" class="card-img-top row-cols-1 embed-responsive-item"/>
                  </div>
                  <div class="card-body" style="padding: 1rem;">
                    <p style="margin-bottom: 0px;">제목입니다.</p>
                    <p style="margin-bottom: 7px; font-weight: bold;">900,000원</p>
                    <button class="float-right recommentCount"><img src="${pageContext.request.contextPath}/resources/images/emptyheart.png" width="16px">13</button>
                    <p style="margin-bottom: 0px; font-size:15px;">작성자</p>
                    <p style="margin-bottom: 0px; font-size:15px;">2022-04-21</p>
                  </div>
                </div>
              </div>       
            </c:forEach>
            </div>
            <div class="cardrow mb-4 col-12 d-flex justify-content-center">
            <c:forEach var="i" begin="1" end="4">
              <div class="col-3">
                <div class="card">
                  <div class="embed-responsive embed-responsive-4by3">
                    <img src="${pageContext.request.contextPath}/resources/images/marketListSample1.jpg" alt="" class="card-img-top row-cols-1 embed-responsive-item"/>
                  </div>
                  <div class="card-body" style="padding: 1rem;">
                    <p style="margin-bottom: 0px;">제목입니다.</p>
                    <p style="margin-bottom: 7px; font-weight: bold;">900,000원</p>
                    <button class="float-right recommentCount"><img src="${pageContext.request.contextPath}/resources/images/emptyheart.png" width="16px">13</button>
                    <p style="margin-bottom: 0px; font-size:15px;">작성자</p>
                    <p style="margin-bottom: 0px; font-size:15px;">2022-04-21</p>
                  </div>
                </div>
              </div>       
            </c:forEach>
            </div>
            <div class="cardrow mb-4 col-12 d-flex justify-content-center">
            <c:forEach var="i" begin="1" end="4">
              <div class="col-3">
                <div class="card">
                  <div class="embed-responsive embed-responsive-4by3">
                    <img src="${pageContext.request.contextPath}/resources/images/marketListSample1.jpg" alt="" class="card-img-top row-cols-1 embed-responsive-item"/>
                  </div>
                  <div class="card-body" style="padding: 1rem;">
                    <p style="margin-bottom: 0px;">제목입니다.</p>
                    <p style="margin-bottom: 7px; font-weight: bold;">900,000원</p>
                    <button class="float-right recommentCount"><img src="${pageContext.request.contextPath}/resources/images/fullheart.png" width="16px">13</button>
                    <p style="margin-bottom: 0px; font-size:15px;">작성자</p>
                    <p style="margin-bottom: 0px; font-size:15px;">2022-04-21</p>
                  </div>
                </div>
              </div>       
            </c:forEach>
            </div>
            
            <!-- 글쓰기 버튼 -->
            <div class="col-12 d-flex align-content-end justify-content-end">
              <a href="insert" type="button" class="btn px-2 btn-secondary">글쓰기</a>
            </div>
            
            <!-- 페이지 처리 -->
            <div class="col-12 d-flex flex-column align-content-center justify-content-center">
              <div>
                <ul class="pagination justify-content-center mb-3">
                  <li class="page-item disabled">
                    <a
                      class="page-link"
                      href="#"
                      tabindex="-1"
                      aria-disabled="true"
                      >Previous</a>
                  </li>
                  <li class="page-item">
                    <a class="page-link" href="#">11</a>
                  </li>
                  <li class="page-item active">
                    <a class="page-link" href="#">12</a>
                  </li>
                  <li class="page-item">
                    <a class="page-link" href="#">13</a>
                  </li>
                  <li class="page-item">
                    <a class="page-link" href="#">14</a>
                  </li>
                  <li class="page-item">
                    <a class="page-link" href="#">15</a>
                  </li>
                  <li class="page-item">
                    <a class="page-link" href="#">16</a>
                  </li>
                  <li class="page-item">
                    <a class="page-link" href="#">17</a>
                  </li>
                  <li class="page-item">
                    <a class="page-link" href="#">18</a>
                  </li>
                  <li class="page-item">
                    <a class="page-link" href="#">19</a>
                  </li>
                  <li class="page-item">
                    <a class="page-link" href="#">20</a>
                  </li>
                  <li class="page-item">
                    <a class="page-link" href="#">Next</a>
                  </li>
                </ul>
              </div>
              <form class="form-inline my-2 my-lg-0 justify-content-center">
                  <select name="searchType">
                    <option value="제목+내용" selected="select">제목+내용</option>
                    <option value="내용">내용</option>
                    <option value="제목">제목</option>
                    <option value="작성자">작성자</option>
                  </select>
                  <input
                    class="form-control"
                    type="text"
                    placeholder="검색어를 입력해 주세요."
                    aria-label="Search"
                    width="300"
                  />
                  <button class="btn btn-outline-success my-2 my-sm-0" type="submit">
                    검색
                  </button>
                </form>
            </div>
            </div>           
          <div class="col-2"></div>
        </div>
      </div>
    </section>
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>