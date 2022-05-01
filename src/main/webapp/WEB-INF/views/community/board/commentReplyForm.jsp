<%@ page contentType="text/html; charset=UTF-8" %>

		              	<form class="pl-5" method="post" action="replyComment" id="replyComment">
		              		<input type="hidden" name="upperNo" value="${upperNo}"/>
		              		<input type="hidden" name="freeNo" value="${freeNo}"/>
		              		<input type="hidden" name="sessionUserId" value="${sessionUserId}"/>
		              		<input type="hidden" name="commentDepth" value="${commentDepth}"/>
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
		              	

		        		<li class="list-group-item p-5" >
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
		                  </li>	               	