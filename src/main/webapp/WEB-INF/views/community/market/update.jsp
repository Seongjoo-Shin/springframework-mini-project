<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<script>
	$(function(){
    	//만약 사진에 뭐가 있다면! 일단 미리보기에 사진 띄우기
    	if($("#nomalImgPreview").children().length != 0){
    		$("#explainNomal").css('display', 'none');
    		
    		const btn = createBtn();
            const nomalImgField = document.getElementById("nomalImgField");
            nomalImgField.appendChild(btn);
    		useYn = 1;
    		fileNo = $("#nomalImgPreview").children().length;
    		console.log("fn : " + fileNo);
    	}
	});
    </script>
    <section style="flex-grow:1;">
      <div style="height: 250px;" class="bg-light d-flex align-items-center justify-content-center">
        <h1 class="">거래 게시판</h1>
      </div>
      <div class="container-fluid my-5">
        <div class="row">
          <div class="col-2"></div>
          <div class="col-8">
            <div class="h3 border-bottom mb-3"><img class="mr-2" src="${pageContext.request.contextPath}/resources/images/writing.png">글쓰기</div>
	            <div class="mb-5"><!-- action="insertMarketContent"  -->
	              <form action="" id="marketInsertForm" enctype="multipart/form-data">
					<select id="category" name="category" class="form-select-lg" aria-label=".form-select-lg example">
					  <option value="0">카테고리 선택</option>
					  <option value="1" <c:if test="${marketBoardDto.marketCategory eq '1'}">selected</c:if>>장비</option>
					  <option value="2" <c:if test="${marketBoardDto.marketCategory eq '2'}">selected</c:if>>가구</option>
					  <option value="3" <c:if test="${marketBoardDto.marketCategory eq '3'}">selected</c:if>>소모품</option>
					  <option value="4" <c:if test="${marketBoardDto.marketCategory eq '4'}">selected</c:if>>기타</option>
					</select>
					<input id="marketNo" name="marketNo" value="${marketBoardDto.marketNo}"/>
					
	                <input type="text" name="title" class="form-control my-3" value="${marketBoardDto.marketTitle}"/>
	                <div class="border rounded" style="background-color: rgb(231, 231, 236);">
		                <div id="explainNomal" class="p-3 text-center">
	                      <img src="${pageContext.request.contextPath}/resources/images/mascot.png" width="90px"/>
	                      <h6>최소 1장 이상 등록해야 하며, 가로 사진을 권장합니다.</h6>
	                      <label for="chooseFile1" class="btn btn-info m-1">사진 등록</label>
	                      <input type="file" id="chooseFile1"  name="chooseFile1" accept="image/*" style="display: none;" onchange="getImageFiles(event)" multiple>
	                    </div>
	                    <div id="nomalImgField">
                           <div id="nomalImgPreview" class="w-100" style="align-items: center; display: inline;">
                           		<!-- 수정 -->
                              	<c:if test="${not empty marketFilesSize}">
                              		<c:forEach var="marketFile" items="${marketFiles}" varStatus="status">
                          				<span id="file${status.index}">
                            				<img id="img${status.index}" name="exist" src="getImageByteArrayToFile?marketNo=${marketBoardDto.marketNo}&img=${status.index}" data-file="${marketFile.attachOriginalName}" seq="${marketFile.marketFileNo}" width="200px" height="150px" style="border: 1px solid gainsboro; padding: 10px; background-color :white;" />
                            				<a class="btn" onclick="deleteImg(${status.index})" style="margin-right:8px; cursor:pointer;">X</a>
                           				</span>
                              		</c:forEach>
                              	</c:if>                           	
                           </div>
                        </div>
	                </div>
	               
	                <input id="price" name="price" type="text" class="form-control mt-3" value="${marketBoardDto.marketPrice}"/>
	                <small id="priceHelp" class="form-text text-danger" style="display:none;">&nbsp;&nbsp;&nbsp;*가격란엔 숫자만 입력해주세요!</small>
	                <textarea name="content" class="form-control mt-3" style="height: 300px; overflow-y:scroll; resize:none">${marketBoardDto.marketContent}</textarea>
	              </form>
	              	<div class="pagination justify-content-center mb-0">
	                   	<button onclick="updateBtnClick()" class="btn bg-light mt-3 mx-3 btn-lg" style="border: solid 1px rgb(224, 216, 216);">수&nbsp;&nbsp;&nbsp;정</button>
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
    	
    	//만약, checkNum과 fileNo가 같아지면, 업로드되어 있는 파일이 아무것도 없게 됨!
        var checkNum = 0;    	
  		
        //이미지를 등록하게 되면 미리보기를 보여주는 엘리먼트를 id로 가져온다.
	    const nomalImgPreview = document.getElementById("nomalImgPreview");
	    
	  	//이미지를 추가하는 버튼을 제어하기 위한 변수
	    var useYn = 0;
	  	
    	//수정하는 상태일 경우, DB에 저장된 사진 중, 삭제할 것들의 seq를 저장하는 배열이다.
    	var deleteDBImgBySeq = [];
	  	
	  	//일반 사진을 등록할 때 실행되는 함수이다.
	    function getImageFiles(e) {
	  		
	  		console.log("123");
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
	
            deleteBtn.setAttribute("class", "btn btn-danger");
            deleteBtn.setAttribute('onclick', 'deleteImg(' + fileNo + ')');
	        deleteBtn.innerHTML = "X";
	        deleteBtn.style.padding = "10px";
	        deleteBtn.style.border = "1px solid rgb(231, 231, 236)";
	        deleteBtn.style.backgroundColor = 'white';
	        deleteBtn.style.marginRight = "8px";
	        deleteBtn.style.cursor = "pointer";

            span.setAttribute("id","file" + fileNo);
	        span.appendChild(img);
	        span.appendChild(deleteBtn);
	        
            fileNo++;
            
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
        function deleteImg(fnum){
        	if($('#img'+fnum).attr("name") == 'exist'){
        		console.log("db에 저장된 것 삭제할 경우");
        		deleteDBImgBySeq.push($('#img'+fnum).attr("seq"));
        		console.log("--"+$('#img'+fnum).attr("seq"));
        		document.querySelector("#file" + fnum).remove();
        		
        		
        	}else{
        		document.querySelector("#file" + fnum).remove();
        		var DBImgCnt = 0;
        		if(`${type}` == 'updateEnroll'){
        			var DBImgCnt = `${nomalCnt}`;
                	DBImgCnt++;
        		}
            	console.log(fnum-DBImgCnt);
            	uploadFiles[fnum-DBImgCnt] = "";
            	console.log(uploadFiles);
            	
        	}
        	console.log($("#nomalImgPreview").children().length);
        	if($("#nomalImgPreview").children().length == 0){
            	$("#addBtn").remove();
                $("#explainNomal").css('display', 'block');
                useYn = 0;
            }
        }
    
		var input = document.getElementById("price");
		
		//유효성 검사
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
		
		//수정 버튼을 눌렀을 때
		function updateBtnClick(){
			
			//폼 태그안의 input태그들은 name값으로 접근 가능하다.
        	var form = document.querySelector("#marketInsertForm");
            var formData = new FormData(form);
            console.log(formData);
            
            
            //select 유효성 검사
            if($("#category").val == 0){
            	swal({
					text: "이미지를 최소 1장은 등록해야 합니다.",
					icon:"${pageContext.request.contextPath}/resources/images/errorMascot.png"
				});
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

            //DB상에 존재하는 이미지 파일을 삭제하기 위해 시퀀스들을 저장한 배열을 append한다!
            formData.append("deleteDBImgBySeq",deleteDBImgBySeq);
           	for(var i=0; i<deleteDBImgBySeq.length; i++){
           		console.log(i+"번째 요소->>"+deleteDBImgBySeq[i]);
           	}
            
            
            $.ajax({
            	method:'POST',
            	url: 'updateMarketContent',
            	data: formData,
            	contentType: false,
            	processData:false
            }).done((data)=>{
            	var result = data;
            	swal({
					text: "수정 되었습니다."
				}).then(()=>{
					location.href = document.referrer;
				});
            })
		}
		
	//글쓰기 취소 버튼 눌렀을 경우
	function cancle(){
		$(location).attr("href", "marketInsertCancle")
	}
	
    </script>
      
<%@ include file="/WEB-INF/views/common/footer.jsp" %>