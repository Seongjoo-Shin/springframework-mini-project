<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

    <script>
        function selectAll(selectAll)  {
            const checkboxes = document.querySelectorAll('input[type="checkbox"]');
            
            checkboxes.forEach((checkbox) => {
                checkbox.checked = selectAll.checked
            })
        }
        
	    function receiveMsg(messageNo){
            var url = "<%=request.getContextPath() %>/messageView?messageNo="+messageNo;
            var option = "width = 300, height = 350, top = 100, left = 200, location = no";
            window.open(url, "message", option);
        }
        
        function fn_checkedDel(){
        	var cnt = $("input[name='messageNo']:checked").length;

        	swal(cnt+"개의 쪽지를 삭제하시겠습니까?", {
        		dangerMode: true,
        		buttons: true,
        	}).then((result) => {
        		if(result == true){
        			var arr = new Array();
                	$("input[name='messageNo']:checked").each(function(){
                		arr.push($(this).attr('id'));
                	});
                	if(cnt == 0){
        				swal("선택된 게시물이 없습니다.");
                	} else {
                		console.log(arr);
                		$.ajax({
                			type: 'POST',
                			url: '/mypage/message/sdeleteMsg',
                			dataType: 'json',
                			data: {delArr: arr},
                		}).done((data) => {
                			swal(data.messgae).then(() => {
                				location.reload();
                			})
                		}).fail((data) => {
                		});
                	}
        		} else {
        			$("#allSelect").prop("checked", false);
        			$("input[name='messageNo']:checked").prop("checked", false);
        		}
        	})
        	
        }
    </script>
    <section>
        <div class="container-fluid h-100 mt-5">
            <div class="row">
                <div class="col-2">
                    <div class="p-5 justify-content-center">
                        <div class="mt-5"><a href="/mypage/modify" class="btn btn-outline-dark w-100 p-2">내 정보 수정</a></div>
                        <div class="mt-2"><a href="/mypage/myboard/board" class="btn btn-outline-dark w-100 p-2">작성글</a></div>
                        <div class="mt-2"><a href="/mypage/message/receive" class="active btn btn-outline-dark w-100 p-2">쪽지함</a></div>
                        <div class="mt-2"><a href="/mypage/prefer/buildingprefer" class="btn btn-outline-dark w-100 p-2">찜목록</a></div>
                        <div class="mt-2"><a href="/mypage/withdrawl" class="btn btn-outline-dark w-100 p-2">회원탈퇴</a></div>
                    </div>
                </div>
                <div class="col-8">
                    <h3 class="m-3">쪽지함</h3>
                    <div class="row">
                        <ul class="nav nav-tabs">
                            <li class="nav-item">
                                <a class="nav-link h5 text-dark" href="/mypage/message/receive">받은쪽지함</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active h5 text-dark" href="/mypage/message/send">보낸쪽지함</a>
                            </li>
                        </ul>
                    </div>
                    <div class="row">
                        <table class="table table-hover">
                            <thead>
                                <tr class="text-center">
                                    <th>제목</th>
                                    <th>보낸날</th>
                                    <th>받은사람</th>
                                    <th>회신여부</th>
                                    <td><input type="checkbox" onclick="selectAll(this)" id="allSelect"/></td>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="message" items="${messages}">
                            	<tr class="text-center">
                                    <td><a onclick="javascript:receiveMsg('${message.messageNo}');" class="text-dark">${message.messageTitle}</a></td>
                                    <td><fmt:formatDate value="${message.messageDate}" pattern="yyyy-MM-dd HH:mm"/></td>
                                    <td>${message.messageReceiver}</td>
                                    <td>
                                    	<c:if test="${message.messageReplyYN == 1}">답장완료</c:if>
                                    	<c:if test="${message.messageReplyYN != 1}">답장미완료</c:if>
                                    </td>
                                    <td><input type="checkbox" class="delete" name="messageNo" id="${message.messageNo}"/></td>
                                </tr>
                            </c:forEach>
                            <c:if test="${total eq 0 }">
                            	<tr>
                            		<td class="text-center" colspan="5"><h5>보낸 쪽지가 없습니다.</h5></td>
                            	</tr>
                            </c:if>
                            </tbody>
                        </table>
                    </div>
                    <div class="row float-right">
                    	<c:if test="${total > 0}">
                        <div class="mr-2">
                            <input type="button" value="삭제" class="float-right btn btn-sm btn-outline-dark" onclick="fn_checkedDel();"/>
                        </div>
                        </c:if>
                    </div>
                    <div class="row d-flex justify-content-center mb-5">
                    <c:if test="${total > 0}">
						<ul class="pagination justify-content-center mb-0">
			               	<li class="page-item">
								<a class="page-link" href="/mypage/message/send?pageNo=1">First</a>
							</li>
							<c:if test="${pager.groupNo>1}">
								<li class="page-item">
									<a class="page-link" href="/mypage/message/send?pageNo=${pager.startPageNo-1}">Previous</a>
								</li>
							</c:if>
		                    <c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}"><!-- 시작 페이지부터 마지막 페이지까지 반복 -->
								<c:if test="${pager.pageNo != i}">
									<li class="page-item">
										<a class="page-link" href="/mypage/message/send?pageNo=${i}">${i}</a>
									</li>
								</c:if>
								<c:if test="${pager.pageNo == i}">
									<li class="page-item active">
										<a class="page-link" href="/mypage/message/send?pageNo=${i}">${i}</a>
									</li>
								</c:if>
							</c:forEach>
							<c:if test="${pager.groupNo<pager.totalGroupNo}">
								<li class="page-item">
			                      <a class="page-link" href="/mypage/message/send?pageNo=${pager.endPageNo+1}">Next</a>
			                    </li>
							</c:if>
							<li class="page-item">
			                	<a class="page-link" href="/mypage/message/send?pageNo=${pager.totalPageNo}">Last</a>
			                </li>
	                	</ul>
	                </c:if>
                    </div>
                </div>
                <div class="col-2">
                    
                </div>
            </div>
        </div>
    </section>
    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    