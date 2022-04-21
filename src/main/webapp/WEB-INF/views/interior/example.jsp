<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<section class="container-fluid">
      <div class="col-2"></div>
      <div class="col-8" style="margin:0 auto;">
        <div class="row" style="padding: 15px;">
          <h3>인테리어</h3>
        </div>
        <div class="row">
          <div class="col-6">
            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
              <div id = "div" class="carousel-inner">
                <div class="carousel-item active" >
                  <img src="${pageContext.request.contextPath}/resources/images/interior1_1.jpg" class="d-block w-100" style = "height: 400px; border-radius: 5px;">
                </div>
                <div class="carousel-item">
                  <img src="${pageContext.request.contextPath}/resources/images/interior1_2.jpg" class="d-block w-100" style = "height: 400px; border-radius: 5px;">
                </div>
                <div class="carousel-item">
                  <img src="${pageContext.request.contextPath}/resources/images/interior1_3.jpg" class="d-block w-100" style = "height: 400px; border-radius: 5px;">
                </div>
                <div class="carousel-item">
                  <img src="${pageContext.request.contextPath}/resources/images/interior1_4.jpg" class="d-block w-100" style = "height: 400px; border-radius: 5px;">
                </div>
              </div>
              <button class="carousel-control-prev" type="button" data-target="#carouselExampleControls" data-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="sr-only">Previous</span>
              </button>
              <button class="carousel-control-next" type="button" data-target="#carouselExampleControls" data-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="sr-only">Next</span>
              </button>
            </div>
          </div>
          <div class="col-6">
            <div id="panorama" style="border-radius: 10px;"></div>
            <script>
            pannellum.viewer("panorama", {
              type: "equirectangular",
              panorama: "${pageContext.request.contextPath}/resources/images/pano2.jpg",
            });
          </script>
          </div>
        </div>
        <div class="row" style="padding: 15px;">
          <a href="simulator" class="btn btn-sm" style="height: 50px; background-color: rgb(242, 101, 45); font-size: 25px; color: white;">내 인테리어 만들어보기 -></a>
        </div>
      </div>
      
      <div class="col-2"></div>
    </section>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>