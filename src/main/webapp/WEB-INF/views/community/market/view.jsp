<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script>
        function selectAll(selectAll)  {
            const checkboxes = document.querySelectorAll('input[type="checkbox"]');
            
            checkboxes.forEach((checkbox) => {
                checkbox.checked = selectAll.checked
            })
        }

        function changeImg(img){
            var path = document.getElementById("interImg").src;
            var cntInter = document.getElementById("interCnt").innerHTML;

            if(path.includes("Before")){
                $("#interImg").attr("src", "/images/interestAfter.png");
                document.getElementById("interCnt").innerHTML = Number(cntInter) + 1;
            } else {
                $("#interImg").attr("src", "/images/interestBefore.png");
                document.getElementById("interCnt").innerHTML = Number(cntInter) - 1;
            }
            
        }

        function openMsgForm(){
            var url = "messageForm.html";
            var option = "top=10, left=10, width=320px, height=220px, status=no, menubar=no, toolbar=no, resizable=no";
            window.open(url, option);
        }
    </script>
    <section>
        <div class="container-fluid h-100">
            <div style="height: 250px;" class="bg-light d-flex align-items-center justify-content-center">
                <h1 class="">거래 게시판</h1>
            </div>
            <div class="row">
                <div class="col-2">
                </div>
                <div class="col-8 mt-5">
                    <div class="card">
                        <div class="card-body" style="margin:0 120px;">
                            <div class="h4">
                                <span>글쓴이 : </span><span>컴포즈</span>
                                <a class="btn btn-outline-dark ml-2" onclick="openMsgForm()">쪽지보내기</a>
                                <span class="date float-right mr-5">2022-04-11 13:50</span>
                            </div>
                            <div class="title h5 mt-5 mb-3">
                                <span>제목이 들어가는 공간 입니다.</span>
                            </div>
                            <div class="image">
                                <img src="https://via.placeholder.com/450x300" width="450px" height="300px"/>
                                <img src="https://via.placeholder.com/450x300" width="450px" height="300px"/>
                                <a id="moreImg" href="#" class="btn btn-primary p-3" style="vertical-align: middle;"><span>+</span></a>
                            </div>
                            <div class="price h5 mt-4">
                                <span>500,000,000원</span>
                            </div>
                            <div style="width:100%" class="mt-5">
                                <p>
                                    내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.내용이 들어갑니다.
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="buttons mt-5 d-flex justify-content-center">
                        <a class="btn btn-outline-dark mr-3" style="width:100px; height:50px;">목록</a>
                        <button class="btn btn-outline-dark ml-3" style="width:100px;" onclick="changeImg(this);"><img id="interImg" class="mr-2" src="/images/interestBefore.png" width="30px;" "/><span id="interCnt">12</span></button>
                    </div>
                </div>
                <div class="col-2">
                </div>
            </div>
        </div>
    </section>

    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>