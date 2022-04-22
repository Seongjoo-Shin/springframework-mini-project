<%@ page contentType="text/html; charset=UTF-8"%>
	<footer class="footer" style="background-color: rgb(231, 231, 236); bottom: 0px;">    
        <div class="row w-100" style="height: 200px;">
            <div class="col-4 mt-auto p-3">
                Developer | 백수민 신성주 신현주 양승현
            </div>
            <div class="col-4 mt-5 text-center">
                <div>
                    <img src="${pageContext.request.contextPath}/resources/images/logo.png" width="350px"/>
                </div>
            </div>
            <div class="col-4 mt-auto p-1" >
                <div style="float:right;">
                    <img class="border rounded p-2" src="${pageContext.request.contextPath}/resources/images/kosa.png" width="100px"/>
                    <img class="border rounded p-3" src="${pageContext.request.contextPath}/resources/images/osstem_ci.png" width="100px"/>
                    <div class="font-weight-bold ml-5 p-2" style="color: rgb(88, 90, 95);">Project Github<img src="${pageContext.request.contextPath}/resources/images/gitLogo.png" width="30px"/></div>
                </div>
            </div>
        </div>
        <div class="btn-top on">
		    <a href="#">Top
		        <div class="progress1">
		        <img src="/resources/images/totop.png"/>
		            <span class="left">
		                <em class="progress-bar1" style="transform: rotate(360deg) scaleX(-1);"></em>
		            </span>
		            <span class="right">
		                <em class="progress-bar1" style="transform: rotate(180deg);"></em>
		            </span>
		        </div>
		    </a>
		</div>
    </footer>
</body>
</html>