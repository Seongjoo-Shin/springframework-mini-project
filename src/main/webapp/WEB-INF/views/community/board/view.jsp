<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
                <p class="d-inline-block h6 mx-2">글쓴이 <span class="ml-1">${freeBoardDto.userDto.userNickname}</span></p>
                <p class="d-inline-block h6 float-right mx-2">조회수: <span>${freeBoardDto.freeHitCount}</span></p>
                <p class="d-inline-block h6  float-right mx-2"><fmt:formatDate value="${freeBoardDto.freeRegistDate}" pattern="HH:mm"/></p>
                <p class="d-inline-block h6 float-right mx-2"><fmt:formatDate value="${freeBoardDto.freeRegistDate}" pattern="yyyy-MM-dd"/></p>            
              </div>
              <div id="free-board-title" class="h4 p-3" style="border: 1px solid rgb(224, 224, 224); border-radius: 10px;">${freeBoardDto.freeTitle}</div>
              <div id="free-board-content" class="px-3 py-5" style="border: 1px solid rgb(224, 224, 224); border-radius: 10px;">
              	${freeBoardDto.freeContent}
              </div>
              <div class="text-center my-3">
				<c:if test="${sessionUserId == freeBoardDto.freeWriter}">
					<a href="/community/board/update?freeNo=${freeBoardDto.freeNo}" class="btn btn-sm btn-outline-dark" style="width:100px;">수정</a>
				</c:if>  	
				<c:if test="${from ne 'mypage'}">
					<a href="/community/board/list" class="btn btn-sm btn-outline-dark" style="width:100px;">목록</a>
				</c:if>
				<c:if test="${from eq 'mypage'}">
					<a href="/mypage/myboard/board?pageNo=${pageNo}" class="btn btn-sm btn-outline-dark" style="width:100px;">목록</a>
				</c:if>
				<c:if test="${sessionUserId == freeBoardDto.freeWriter}">
					<a href="/community/board/freeBoardPostingDelete?freeNo=${freeBoardDto.freeNo}" class="btn btn-sm btn-outline-dark" style="width:100px;">삭제</a>
				</c:if> 
              </div>
              <div class="h6 ml-2" style="font-weight: bold;">댓글</div>
              <div id="free-board-coment">
	              <ul>
 	              	<c:forEach var="commentDto" items="${comments}" varStatus="status">	  
		        		<li class="list-group-item">
		        			<div id ="innerContainer${commentDto.commentNo}"></div>
		        			<div id="container${commentDto.commentNo}" class="row">
		        			<div class="col-10">
			              		<input id="freeNo${commentDto.commentNo}" type="hidden" name="freeNo" value="${commentDto.freeNo}"/>
			              		<input id="commentNo${commentDto.commentNo}" type="hidden" name="commentNo" value="${commentDto.commentNo}"/>
			              		<input id="upperNo${commentDto.commentNo}" type="hidden" name="upperNo" value="${commentDto.upperNo}"/>
			              		<input id="commentDepth${commentDto.commentNo}" type="hidden" name="commentDepth" value="${commentDto.commentDepth}"/>
			                     <div style="flex: 8; padding: 4px 13px;">
		                         <p id="commentWriter${commentDto.commentNo}" style="font-weight: bold;">${commentDto.userDto.userNickname}</p>
		                         <div id="commentContent${commentDto.commentNo}" class="comment-text">
		                           ${commentDto.commentContent}
		                         </div>
		                         <p><small><fmt:formatDate value="${commentDto.commentRegistDate}" pattern="yyyy-MM-dd HH:mm"/></small></p>
		                       </div>		                     		                    			
		        			</div>
							<div class="col-2">
		                  		<div class="d-flex flex-column comment2" style="margin-right: 13px;">
		                  			<button class="commentBtn" onclick="bringReplyJson('${commentDto.commentNo}')">답글</button>
		                       		<c:if test="${sessionUserId == commentDto.commentWriter}">
	             				       <button class="commentBtn" onclick="updateContent('${commentDto.commentNo}')">수정</button>
	             				       <form method="post" action="commentDelete">
	             				       		<input type="hidden" name="freeNo" value="${commentDto.freeNo}"/>
	             				       		<input id="${status.index}" type="hidden" name="commentNo" value="${commentDto.commentNo}"/>
	             				       		<button type="submit" class="commentBtn" style="width:90px;">삭제</button>
	             				       	</form>                                 
		                       		</c:if>
		                      	</div>							
							</div>
		                  	</div>
		                  	<div id ="replyContainer${commentDto.commentNo}"></div>
		                  	<div id ="replyComment${commentDto.commentNo}"></div>
		                  </li>	                  
	              	  </c:forEach>  
		              <li class="list-group-item">
		              	<form method="post" action="insertComment" id="insertComment">
		              		<input type="hidden" name="freeNo" value="${freeBoardDto.freeNo}"/>
	                      	<div class="row" style="display: flex;">
		                        <div style="flex: 8; padding: 4px 13px;">
		                          	<p style="font-weight: bold;">${sessionUserNickname}</p>
		                          	<textarea placeholder="댓글을 입력해 주세요." style="display: block; width: 100%; height: 60px; resize: none;" name="commentContent"></textarea>
		                        </div>
		                        <div class="d-flex flex-column justify-content-end mb-3" style="margin-right: 13px;">
		                          <button type="submit" class="commentBtn">등록</button>
		                        </div>
	                      	</div>		              
		              	</form>
	                  </li>	              
	              </ul>
              </div>
            </div>           
          <div class="col-2"></div>
        </div>
      </div>
      </div>
    </section>
<script>
	function updateContent(commentNo){
		var freeNo = $("#freeNo"+commentNo).val();
		var commentContent = $("#commentDto"+commentNo).val();
		var userNickname = $("#commentWriter"+commentNo).text();    
		console.log("userNickname");
		var userId = "${sessionUserId}";
		$("#container"+commentNo).attr('style','display:none');
		
		console.log(userNickname);

		$.ajax({
			url: "/community/board/updateContent",
			data: {"commentContent":commentContent, "commentNo":commentNo, "userId":userId,
					"userNickname":userNickname, "freeNo":freeNo},
			method: "post"
		}).done((data)=>{
			$("#innerContainer"+commentNo).html(data);
		}) 
	}

	function bringReplyJson(commentNo){
		var param = {
			upperNo : $("#upperNo"+commentNo).val(),
			freeNo : $("#freeNo"+commentNo).val(),
			userId : "${sessionUserId}",
			commentDepth : $("#commentDepth"+commentNo).val()
		}

		$.ajax({
			url: "/community/board/bringReplyJson",
			data: param,
			method: "post"
		
		}).done((data)=>{
			var html = '';
			html +='	<div class="row pl-5" style="display: flex;">';
			html +='		<div style="flex: 8; padding: 4px 13px;">';
			html +='			<p style="font-weight: bold;">\''+data.sessionUserNickname+'\'</p>';
			html +='			<textarea id="textarea\''+data.upperNo+'\'" placeholder="댓글을 입력해 주세요." style="display: block; width: 100%; height: 60px; resize: none;"></textarea>';
			html +='		</div>';
			html +='		<div class="d-flex flex-column justify-content-end mb-3" style="margin-right: 13px;">';
			html +='		  <button type="submit" class="commentBtn" onclick="registReply(\''+data.commentNo+'\')">등록</button>';
			html +='		</div>';
			html +='	</div>';
			
			$("#replyContainer"+commentNo).html(html);
		})
	}
	
	function registReply(commentNo){
		var resParam = {
				upperNo : $("#upperNo"+commentNo).val(),
				freeNo : $("#freeNo"+commentNo).val(),
				sessionUserId : "${sessionUserId}",
				commentDepth : $("#commentDepth"+commentNo).val(),
				commentContext: $("#textarea"+commentNo).text()
			}

		$.ajax({
			url: "community/board/registReply",
			data: resParam,
			method:"post"
		}).done((data)=>{
			$("#container"+commentNo).attr('style','display:none');
			
			var html = '';
			html += '<div id="container\''+data.commentDto.commentNo+'\' class="row">';
			html += '<div class="col-10">';            
			html += '   <div style="flex: 8; padding: 4px 13px;">';
			html += '     <p id="commentWriter\''+data.commentDto.commentNo+'\' style="font-weight: bold;">\''+data.commentDto.userDto.userNickname+'\'</p>';
			html += '     <div id="commentContent\''+data.commentDto.commentNo+'\' class="comment-text">';
			html += data.commentDto.commentContent;
			html += '     </div>';
			html += '     <p><small>'+data.commentDto.commentRegistDate+'</small></p>';
			html += '   </div>';                    		                    			
			html += '</div>';
			html += '<div class="col-2">';
			html += '	<div class="d-flex flex-column comment2" style="margin-right: 13px;">';
// 			html += '   		<c:if test="${sessionUserId == commentDto.commentWriter}">';
			if('${sessionUserId}'==data.commentDto.commentWriter){
				html += '	       <form method="post" action="commentDelete">';
				html += '	       		<input type="hidden" name="freeNo" value="${commentDto.freeNo}"/>';
				html += '	       		<input id="${status.index}" type="hidden" name="commentNo" value="\''+data.commentDto.commentNo+'\'/>';
				html += '	       		<button type="submit" class="commentBtn" style="width:90px;">삭제</button>';
				html += '	       	</form>';          		 	                                         
			}
// 			html += '   		</c:if>';
			html += '     </div>	';						
			html += '</div>';
			html += '</div>';
			
			$("#container"+commentNo).html(resParam);
		})
		
	}
		
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>