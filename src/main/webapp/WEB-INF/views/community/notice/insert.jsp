<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

    <section style="flex-grow:1;">
      <div style="height: 250px;" class="bg-light d-flex align-items-center justify-content-center">
        <h1>공 지&nbsp;&nbsp;&nbsp;사 항</h1>
      </div>
      <div class="container-fluid my-5">
        <div class="row">
          <div class="col-2"></div>
          <div class="col-8">
            <div class="h3 border-bottom mb-3"><img src="${pageContext.request.contextPath}/resources/images/writing.png">글쓰기</div>
               <div class="mb-5">
                 <form method="post" action="insertNoticeContent" id="insertForm">
                   <input type="text" class="form-control w-100 p-2 mb-3" style="font-size: 25px;" placeholder="제목을 입력하세요"></input>
                   <div class="custom-file mb-3">
                   <input type="file" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01" onchange="getFiles(event)" multiple>
                   <label style="font-size: 22px;" class="custom-file-label" for="inputGroupFile01">파일 선택</label>
                 </div>
                 <div id="fileDiv" class="border rounded" style="display: none;">
                    <div id="nomalFileList">
                       
                    </div>
                    <div id="imageFileList">
                       
                    </div>
                 </div>
                   <textarea class="form-control mt-2" placeholder="게시물 내용을 작성해 주세요." style="height: 300px; overflow-y:auto; resize:none; font-size: 22px;"></textarea>
                   <div class="d-flex justify-content-center mb-0 mt-4">
                       <button type="button" onclick="goSubmit()" class="btn btn-outline-info border m-2 p-2" style="font-size: 25px; width:130px;">등 록</button>
                       <button type="button" onclick="cancle()" class="btn btn-outline-dark border m-2 p-2" style="font-size: 25px; width:130px;">취 소</button>
                   </div>             
                 </form>              
               </div>
           </div>                
          <div class="col-2"></div>
        </div>
      </div>
    </section>
    <script>
       const nomalFileList = document.getElementById("nomalFileList");
       const imageFileList = document.getElementById("imageFileList");
       
       var uploadImageFiles = [];
       var uploadNomalFiles = [];
       
       var imageFileNum = 1;
       var nomalFileNum = 1;
    
       function cancle(){
         $(location).attr("href", "insertNoticeCancle")
       }
       function goSubmit(){
         $("#insertForm").submit(); //form태그의 action="insertContent"탐
       }
       
       function getFiles(e){
          const files = e.currentTarget.files;
           
           [...files].forEach(file => {
               //첨부파일의 형식이 이미지라면, 
                if(file.type.match("image/.*")){
                   if(imageFileList.childElementCount > 2 || (imageFileList.childElementCount + imageFileNum) > 2 ){ //만약 업로드한 이미지파일이 2장 이상이면!
                      swal({
                         text: "업로드할 수 있는 이미지 파일의 개수는 최대 2장 입니다."
                      });
                      return;
                   }
                   const reader = new FileReader();
                    reader.onload = (e) => {
                       uploadImageFiles.push(file);
                       imageFileNum++;
                       const preview = createPreviewImage(e, file);
                       imageFileList.appendChild(preview);
                    };
                    reader.readAsDataURL(file);
                }else{
                   if(nomalFileList.childElementCount > 5 || (nomalFileList.childElementCount + nomalFileNum) > 5 ){ //만약 업로드한 파일이 5개 이상이면!
                      swal({
                         text: "업로드할 수 있는 일반 파일의 개수는 최대 5개 입니다."
                      });
                      return;
                   }
                   const reader = new FileReader();
                    reader.onload = (e) => {
                       uploadNomalFiles.push(file);
                       nomalFileNum++;
                       const preview = createPreviewFile(e, file);
                       nomalFileList.appendChild(preview);
                    };
                    reader.readAsDataURL(file);
                }
            });
           
           e.target.value = ""; // 같은 파일 upload를 위한 처리
           
           imageFileNum = 1;
           nomalFileNum = 1;
       }
       
       function createPreviewImage(e, file) {
          const span = document.createElement('span');
          return span;
      }
       
       function createPreviewFile(e, file) {
          const span = document.createElement('span');
          return span;
      }
     </script>
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>