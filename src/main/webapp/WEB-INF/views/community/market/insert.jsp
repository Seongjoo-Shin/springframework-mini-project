<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <section style="flex-grow:1;">
      <div style="height: 250px;" class="bg-light d-flex align-items-center justify-content-center">
        <h1 class="">거래 게시판</h1>
      </div>
      <div class="container-fluid my-5">
        <div class="row">
          <div class="col-2"></div>
          <div class="col-8">
            <div class="h3 border-bottom mb-3"><img src="${pageContext.request.contextPath}/resources/images/writing.png">글쓰기</div>
	            <div class="mb-5"><!-- action="insertMarketContent"  -->
	              <form method="post" id="marketInsertForm" action="" enctype="multipart/form-data">
					<select id="category" name="category" class="mb-3 form-select-lg float-left" aria-label=".form-select-lg example">
					  <option value="0" selected>카테고리 선택</option>
					  <option value="1">장비</option>
					  <option value="2">가구</option>
					  <option value="3">소모품</option>
					  <option value="4">기타</option>
					</select>
					<small id="selectHelp" class="form-text text-danger mx-5" style="display:none">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*카테고리를 선택해 주세요!</small>					
	                <input type="text" name="title" class="form-control mt-3 mb-3" placeholder="제목을 입력하세요"></input>
	                <div class="border rounded" style="background-color: rgb(231, 231, 236);">
		                <div id="explainNomal" class="p-3 text-center">
	                      <img src="${pageContext.request.contextPath}/resources/images/mascot.png" width="90px"/>
	                      <h6>최소 1장 이상 등록해야 하며, 가로 사진을 권장합니다.</h6>
	                      <label for="chooseFile1" class="btn btn-info m-1">사진 등록</label>
	                      <input type="file" id="chooseFile1"  name="chooseFile1" accept="image/*" style="display:;" onchange="getImageFiles(event)" multiple>
	                    </div>
	                    <div id="nomalImgField">
                           <div id="nomalImgPreview" class="w-100" style="align-items: center; display: inline;">
                           
                           </div>
                        </div>
	                </div>
	                <input id="price" name="price" type="text" class="form-control mt-3" placeholder="₩가격 (숫자만 입력해주세요)"></input>
	                <small id="priceHelp" class="form-text text-danger" style="display:none">&nbsp;&nbsp;&nbsp;*가격란엔 숫자만 입력해주세요!</small>
	                <textarea name="content" class="form-control mt-3" placeholder="게시물 내용을 작성해 주세요." style="height: 300px; overflow:auto; resize:none" maxlength="500"></textarea>
	              </form>
	              	<div class="pagination justify-content-center mb-0">
	                   	<button onclick="submitBtnClick()" class="btn bg-light mt-3 mx-3 btn-lg" style="border: solid 1px rgb(224, 216, 216);">등&nbsp;&nbsp;&nbsp;록</button>
	                   	<button onclick="cancle()" class="btn bg-light mt-3 mx-3 btn-lg" style="border: solid 1px rgb(224, 216, 216);">취&nbsp;&nbsp;&nbsp;소</button>
	                </div>              
	            </div>            
          <div class="col-2"></div>
        </div>
      </div>
      </div>
    </section>
		
    <script>
  		//이미지 첨부파일을 저장하기 위한 배열
	    var uploadFiles = [];
  		
    	//첨부파일에 번호를 붙이기 위해 사용하는 변수로, id에 붙여준다.
        var fileNo = 0;
  		
        //이미지를 등록하게 되면 미리보기를 보여주는 엘리먼트를 id로 가져온다.
	    const nomalImgPreview = document.getElementById("nomalImgPreview");
	    
	  	//이미지를 추가하는 버튼을 제어하기 위한 변수
	    var useYn = 0;
	  	
	  	//일반 사진을 등록할 때 실행되는 함수이다.
	    function getImageFiles(e) {
	  		
	    	//첨부된 이미지 파일들을 가져온다.
	        const files = e.currentTarget.files;
	        console.log(files);
	        
	        //이미지 미리보기 엘리먼트에 추가된 자식노드의 수가 6개가 넘어가거나, 미리보기 엘리먼트의 자식노드와 첨부된 파일의 갯수가 6개를 넘어가게 되면 업로드할 수 없다!(최대 6장이기 때문에)
	        console.log(nomalImgPreview.childElementCount + files.length);
	        if(nomalImgPreview.childElementCount > 6 || (nomalImgPreview.childElementCount + files.length) > 6){
            	swal({
            		icon:"${pageContext.request.contextPath}/resources/images/errorMascot.png",
            		text:"이미지는 최대 6장까지만 업로드가 가능합니다."
            	});
                return;
	        }
	        
	        //모든 첨부 파일들에 대해 파일 각각을 처리하기 위해 forEach를 사용했다.
	        [...files].forEach(file => {
	        	console.log("모든 첨부 파일");
	        	console.log(file);
	        	console.log("-----------")
	        	//첨부파일의 형식이 이미지가 아니라면,
	            if(!file.type.match("image/.*")){
                	swal({
                		icon:"${pageContext.request.contextPath}/resources/images/errorMascot.png",
                		text:"이미지파일만 입력해 주세요.(예 - .jpg .png )"
                	});
                	return;
	            }
	            $("#explainNomal").css('display', 'none');
	            if(files.length <= 6){
	                uploadFiles.push(file);
	                const reader = new FileReader();
	                reader.onload = (e) => {
	                    const preview = createImagePreview(e, file);
	                    nomalImgPreview.appendChild(preview);
	                    useYn++;
	                };
	                reader.readAsDataURL(file);
	            }
	        });
	        if(useYn === 0){
	            const btn = createBtn();
	            const nomalImgField = document.getElementById("nomalImgField");
	            nomalImgField.appendChild(btn);
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
	
	    //이미지 미리보기에서 x버튼 눌러서 그림 삭제할 때
	    function deleteImg(_this){
	        $(_this).parent('span').remove();
	        if(nomalImgPreview.childElementCount === 0){
	            $("#addBtn").remove();
	            $("#explainNomal").css('display', 'block');
	            useYn = 0;
	        }
	    }
    
		var input = document.getElementById("price");
		
		//가격 유효성 검사
		input.oninput = function(){
			console.log("가격이 입력되었습니다.");
			let resultCheckData = true;
			
			//가격에는 숫자만 들어가게
			var pricePattern = /^[0-9]+$/;
			var price = $("#price").val();
			var pricePatternTest = pricePattern.test(price); //유효성 검사 만족하는지 결과 true,false
			console.log(pricePatternTest);
			
			if(pricePatternTest){
				$("#priceHelp").css("display","none");
			}else{
				$("#priceHelp").css("display","block");
				resultCheckData = false;
			}	
			
			console.log(resultCheckData)
			//유효성 검사를 통과했다면
			if(resultCheckData){
				console.log("유효성 검사 통과 ")
				//document.querySelector("#marketInsertForm").submit();
			}else{
				
			}
		};
		

		//select 1차 유효성 검사
		const selectElement = document.querySelector('#category');
		
		selectElement.addEventListener('change', (event) => {
			var selected = $("#category option:selected").val();
			console.log(selected);
			if(selected === '0'){
				$("#selectHelp").css("display","");
			}else{
				$("#selectHelp").css("display","none");
			}
			
		});

		
		//등록 버튼을 눌렀을 때
		function submitBtnClick(){
			
			//폼 태그안의 input태그들은 name값으로 접근 가능하다.
        	var form = document.getElementById("marketInsertForm");
            var formData = new FormData(form);
            
            const selectElement = document.querySelector('#category');
            var selected = $("#category option:selected").val();
            
            //select 유효성 검사
            if(selected === '0'){
            	swal({
					title:"카테고리 미선택.",
					text: "카테고리를 선택해주세요!",
					icon:"${pageContext.request.contextPath}/resources/images/errorMascot.png"
				});
				return;
            }else{
            	$("#selectHelp").css("display","none");
            }
            
            //이미지 첨부파일 formData에 담기
            if($("#nomalImgPreview").children().length == 0){
            	swal({
					title:"이미지를 등록해주십시오.",
					text: "이미지를 최소 1장은 등록해야 합니다.",
					icon:"${pageContext.request.contextPath}/resources/images/errorMascot.png"
					
				});
				return;
            }else{
            	for (var i = 0; i < uploadFiles.length; i++) {
                    // 삭제되지 않은 파일만 폼데이터에 담기
                    if (uploadFiles[i] != "") {
                        formData.append("attach_file", uploadFiles[i]);
                    }
                }
            }//이미지 첨부파일 formData에 담기 끝

            $.ajax({
            	method:'POST',
            	url: 'insertMarketContent',
            	data: formData,
            	contentType: false,
            	processData:false
            }).done((data)=>{
            	swal({
					text: "판매 상품이 등록되었습니다."
				}).then(()=>{
					$(location).attr("href", "marketInsertCancle");
				});
            })
            
		}
		
	//글쓰기 취소 버튼 눌렀을 경우
	function cancle(){
		$(location).attr("href", "marketInsertCancle")
	}
		
		
		//form태그에 onsubmit="handleCheckData" 해준 경우
/* 		function handleCheckData(){
			console.log("타니?");
			event.priventDefault(); //이벤트 실행 잠깐 막음
			let resultCheckData = true;
			
			//가격에는 숫자만 들어가게
			var pricePattern = '/^[0-9]+$/';
			var price = $("#price").val();
			var pricePatternTest = pricePattern.test(price); //유효성 검사 만족하는지 결과 true,false
			console.log(pricePatternTest);
			
			if(pricePatternTest){
				$("#price").removeClass("bg-danger");
			}else{
				$("#price").addClass("bg-danger");
				resultCheckData = false;
			}	
			
			console.log(resultCheckData)
			//유효성 검사를 통과했다면
			if(resultCheckData){
				console.log("유효성 검사 통과 ")
				//document.querySelector("#marketInsertForm").submit();
			}} */
    </script>
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>