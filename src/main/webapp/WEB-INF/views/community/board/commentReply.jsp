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