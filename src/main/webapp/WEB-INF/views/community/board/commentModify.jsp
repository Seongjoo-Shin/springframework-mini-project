<%@ page contentType="text/html; charset=UTF-8" %>

   	<form method="post" action="updateComment" id="updateComment">
   		<input type="hidden" name="commentNo" value="${commentNo}"/>
   		<input type="hidden" name="freeNo" value="${freeNo}"/>
       	<div class="row" style="display: flex;">
          <div style="flex: 8; padding: 4px 13px;">
            	<p style="font-weight: bold;">${userNickname}</p>
            	<textarea style="display: block; width: 100%; height: 60px; resize: none;" name="commentContent">${commentContent}</textarea>
          </div>
          <div class="d-flex flex-column justify-content-end mb-3" style="margin-right: 13px;">
            <button type="submit" class="commentBtn">등록</button>
          </div>
       	</div>		              
   	</form>
