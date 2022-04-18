<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

    <section>
      <div class="container-fluid h-100 my-5">
        <div class="row">
          <div class="col-2"></div>
          <div class="col-8">
            <div class="h3 border-bottom mb-3"><img src="${pageContext.request.contextPath}/resources/images/writing.png">글쓰기</div>
	            <div class="mb-5">
	              <form>
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
	                <input type="text" class="form-control my-3" placeholder="제목을 입력하세요"></input>
	                <div style="height: 125px; overflow-x: auto; overflow-y: hidden;" class="bg-light d-flex"><!--position: absolute; top: 50%; left: 50%;-->
	                  <label class="p-4 upload"><img width="100px" src="${pageContext.request.contextPath}/resources/images/camera.png" class="bg-light"></label>
	                  <ul class="image-preview d-flex" style="list-style: none;"></ul>
	                  <input type="file" class="real-upload" accept="image/png, image/jpeg" multiple required style="display:none"> <!-- 기존의 input file 태그 숨김 style="display:none" -->
	                </div>
	                <input type="text" class="form-control my-3" placeholder="₩가격"></input>
	                <textarea class="form-control" placeholder="게시물 내용을 작성해 주세요." style="height: 300px; overflow-y:scroll"></textarea>
	                <button type="submit" class="btn bg-light mt-3 float-right" style="border: solid 1px rgb(224, 216, 216);">취  소</button>
	                <button type="submit" class="btn bg-light mt-3 float-right" style="border: solid 1px rgb(224, 216, 216);">저  장</button>                
	              </form>              
	            </div>            
          <div class="col-2"></div>
        </div>
      </div>
      </div>
    </section>

    <script>
      const realUpload = document.querySelector('.real-upload');
      const upload = document.querySelector('.upload');

      //input 태그에서 업로드한 파일을 다루는 방법
      /*
        input에 파일이 업로드되면 change event가 발생하게 된다.
        DOM.addEventListener를 통해서 change event를 지정하고 getImageFiles 함수를 등록
      */

      //클릭하면 연결되는 함수
      function getImageFiles(e){ //e는 object event 타입의 object
        //e.currentTarget은 현제 이벤트가 발생한 태그 <input type="file" class="real-upload" accept="image/png, image/jpeg" multiple required style="display:none">를 리턴
        const files = e.currentTarget.files; //files은 object타입의 filelist를 리턴해준다. list 안에는 file들이 들어있음.
        const uploadFiles=[]; //비어있는 배열 생성
        const imagePreview = document.querySelector('.image-preview');  //ul태그 선택자
        const docFrag = new DocumentFragment(); //뭐지?? 
        
        //input태그에서 업로드된 파일의 유효성검사 방법
        if([...files].length >= 7){ //files배열의 크기가 7보다 크다면
          alert('이미지는 최대 6개까지 업로드가 가능합니다.');
          return;
        }

        //업로된 파일이 이미지 파일인지 체크
        //유사배열인 FileList를 스프레드 문법을 통해 Array로 변환해서 forEach 함수로 값을 체크한다.
        [...files].forEach(file =>{
          if(!file.type.match("image/.*")){
            alert('이미지 파일만 업로드가 가능합니다.');
            return;
          }

          //파일 갯수 검사
          if([...files].length<7){ //배열의 길이가 7미만이면 uploadFiles라는 배열에 file을 하나씩 넣어준다.
            uploadFiles.push(file);
            //File 혹은 Blob 객체를 이용해 파일의 내용을 읽고 사용자의 컴퓨터에 저장하는 것을 가능하게 해줍니다.
            const reader = new FileReader(); 
            reader.onload = (e) => {
              //업로드된 이미지 파일 preview 표현하기
              const preview = createElement(e, file);
              imagePreview.appendChild(preview);
            };
            reader.readAsDataURL(file);
          }
        });

        function createElement(e,file){
          const li = document.createElement('li');
          const img = document.createElement('img');

          img.setAttribute('src', e.target.result); //여기 왜이렇게 코딩?
          img.setAttribute('data-file', file.name);
          img.setAttribute('class', 'preview_img');
          img.setAttribute('onclick', 'cancelPopup()');

          li.appendChild(img);

          return li;
        }
      }
      //클릭
      upload.addEventListener('click', () => realUpload.click());
      realUpload.addEventListener('change', getImageFiles); //change event가 발생하는데 이를 getImageFiles함수의 매개변수로 넘겨준다.

      //사진 삭제할건지 물어보는 창
      function cancelPopup(){
        var result = confirm("삭제하시겠어요?");
        if(result){
          document.write("<h2>삭제합니다.</h2>");
        }else{
          document.write("<h2>삭제 취소</h2>");
        }
      }
      
    </script>
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>