<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

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
                <p class="d-inline-block h6 mx-2">글쓴이 <span class="ml-1">admin</span></p>
                <p class="d-inline-block h6 float-right mx-2">조회수: <span>10</span></p>
                <p class="d-inline-block h6  float-right mx-2">23:02</p>
                <p class="d-inline-block h6 float-right mx-2">2022-04-21</p>            
              </div>
              <div id="free-board-title" class="h4 p-3" style="border: 1px solid rgb(224, 224, 224); border-radius: 10px; ">New admin Design</div>
              <div id="free-board-content" class="px-3 py-5" style="border: 1px solid rgb(224, 224, 224); border-radius: 10px;">
                <p>안녕하세요. start:den 홍보팀입니다.<p>
				<br>
				<p>현재 홈페이지 리뉴얼 관계로 다소 부족한 매장 정보나 관계 없는 이미지가 노출될 수 있습니다.</p>
				<br>
				<p>빠른 시일 내 최적화를 통해 안정적인 서비스를 제공하도록 하겠습니다.</p>
				<br>
				<p>불편을 드려 대단히 죄송합니다.</p>
				<br>
				<p>기간 : 4월 21일 - 5월 16일</p>
				<p>문의 : startDen@mycompany.com</p>
              </div>
            </div>           
          <div class="col-2"></div>
        </div>
      </div>
      </div>
    </section>
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>