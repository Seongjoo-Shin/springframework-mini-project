<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

    <section>
      <div style="height: 250px;" class="bg-light d-flex align-items-center justify-content-center">
        <h1 class="">거래 게시판</h1>
      </div>
      <div class="container-fluid h-100 my-5">
        <div class="row">
          <div class="col-2"></div>
          <div class="col-8">
            <div class="h3 border-bottom mb-3"><img src="${pageContext.request.contextPath}/resources/images/writing.png">글쓰기</div>
	            <div class="mb-5">
	              <form method="post" action="insertMarketContent" id="insertForm">
					<select class="form-select-lg" aria-label=".form-select-lg example">
					  <option selected>카테고리 선택</option>
					  <option value="1">장비</option>
					  <option value="2">가구</option>
					  <option value="3">소모품</option>
					  <option value="3">기타</option>
					</select>
	                <input type="text" class="form-control my-3" placeholder="제목을 입력하세요"></input>
	                <div class="border rounded" style="background-color: rgb(231, 231, 236);">
		                <div id="tempImage1" class="p-3 text-center">
	                      <img src="${pageContext.request.contextPath}/resources/images/mascot.png" width="90px"/>
	                      <h6>최소 3장 이상 등록해야 하며, 가로 사진을 권장합니다.</h6>
	                      <label for="chooseFile1" class="btn btn-info m-1">사진 등록</label>
	                      <input type="file" id="chooseFile1"  name="chooseFile1" accept="image/*" style="display: none;" onchange="getImageFiles(event)" required multiple>
	                    </div>
	                    <div id="imageField1">
                           <div id="imagePreview1" class="w-100" style="align-items: center; display: inline;"></div>
                        </div>
	                </div>
	                <input type="text" class="form-control my-3" placeholder="₩가격"></input>
	                <textarea class="form-control" placeholder="게시물 내용을 작성해 주세요." style="height: 300px; overflow-y:scroll; resize:none"></textarea>
	                <div class="pagination justify-content-center mb-0">
                    <button type="button" onclick="goSubmit()" class="btn bg-light mt-3 mx-3 btn-lg" style="border: solid 1px rgb(224, 216, 216);">등&nbsp;&nbsp;&nbsp;록</button>
                    <button type="button" onclick="cancle()" class="btn bg-light mt-3 mx-3 btn-lg" style="border: solid 1px rgb(224, 216, 216);">취&nbsp;&nbsp;&nbsp;소</button>
	                </div>
               
	              </form>              
	            </div>            
          <div class="col-2"></div>
        </div>
      </div>
      </div>
    </section>

    <script>
	    const uploadFiles = [];
	    const imagePreview1 = document.getElementById("imagePreview1");
	    
	    var useYn = 0;
	    function getImageFiles(e) {
	        const files = e.currentTarget.files;
	        console.log(files);
	        console.log(imagePreview1.childElementCount + files.length);
	        if(imagePreview1.childElementCount > 6 || (imagePreview1.childElementCount + files.length) > 6){
	            alert("이미지는 최대 6장까지 업로드가 가능합니다.");
	            return;
	        }
	        [...files].forEach(file => {
	            if(!file.type.match("image/.*")){
	                alert("이미지 파일만 업로드 가능합니다.", {title:'START:DEN'});
	                return;
	            }
	            $("#tempImage1").css('display', 'none');
	            if(files.length <= 15){
	                uploadFiles.push(file);
	                const reader = new FileReader();
	                reader.onload = (e) => {
	                    const preview = createImagePreview(e, file);
	                    imagePreview1.appendChild(preview);
	                    useYn++;
	                };
	                reader.readAsDataURL(file);
	            }
	        });
	        if(useYn === 0){
	            const btn = createBtn();
	            const imageField1 = document.getElementById("imageField1");
	            imageField1.appendChild(btn);
	        }
	    }
	
	    function createImagePreview(e, file){
	        const span = document.createElement('span');
	        const img = document.createElement('img');
	        const deleteBtn = document.createElement('span');
	
	        img.setAttribute('src', e.target.result);
	        img.setAttribute('data-file', file.name);
	        img.setAttribute('width', '200px');
	        img.setAttribute('height', '150px');
	        img.style.border = '1px solid gainsboro';
	        img.style.padding = '10px';
	        img.style.backgroundColor = 'white';
	
	        deleteBtn.setAttribute('onclick', 'deleteImg(this)');
	        deleteBtn.innerHTML = "X";
	        deleteBtn.style.padding = "10px";
	        deleteBtn.style.border = "1px solid rgb(231, 231, 236)";
	        deleteBtn.style.backgroundColor = 'white';
	        deleteBtn.style.marginRight = "8px";
	        deleteBtn.style.cursor = "pointer";
	
	        span.appendChild(img);
	        span.appendChild(deleteBtn);
	        return span;
	    }
	
	    function createBtn(){
	        const span = document.createElement('span');
	        span.setAttribute('id','addBtn');
	
	        const addBtnLabel = document.createElement('label');
	        addBtnLabel.setAttribute('width', '150px');
	        addBtnLabel.setAttribute('height', '100px');
	        addBtnLabel.style.alignContent = "center";
	
	        const img = document.createElement('img');
	        img.setAttribute('src', "${pageContext.request.contextPath}/resources/images/plusBtn.png");
	        img.setAttribute('width', '100px');
	        img.setAttribute('height', '90px');
	        img.style.padding = '10px';
	        img.style.margin = '5px';
	
	        addBtnLabel.appendChild(img);
	        addBtnLabel.setAttribute('for','chooseFile1');
	        addBtnLabel.style.cursor = 'pointer';
	
	        span.appendChild(addBtnLabel);
	        return span;
	    }
	
	    function deleteImg(_this){
	        $(_this).parent('span').remove();
	        if(imagePreview1.childElementCount === 0){
	            $("#addBtn").remove();
	            $("#tempImage1").css('display', 'block');
	            useYn = 0;
	        }
	    }
	
	    function cancle(){
		      $(location).attr("href", "insertMarketCancle")
		    }
		    function goSubmit(){
		      $("#insertForm").submit();	//form태그의 action="insertContent"탐
		}

    </script>
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>