<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
.back {
	background: #EAEFF7;
	overflow-y:scroll; height:100vh;
	font-family: 'GmarketSansMedium';
}

.contents {
	padding: 30px 100px;
	margin-bottom: 50px;
}

.formPart {
	background: white;
	border-radius: 8px;
	width: 50%;
	padding: 40px 60px;
	margin: 20vh auto;
}


.title {
	font-size: 35px;
	font-weight: bold;
	margin-bottom: 20px;
	font-family: 'Cafe24Ssurround';
	color: #2F4352;
	text-align: center;
}

.btnGroup {
	text-align: center;
}

button {
	background: white;
	border: 3px solid #2F4352;
	border-radius: 8px;
	padding: 8px 15px;
}


</style>
<script type="text/javascript">


</script>


		<div class="back">
			<div class="contents">
			
				<div class="formPart">
					<div class="title">
						<p>정보 수정을 완료했습니다</p>
					</div>
					
					<p class="btnGroup">
						<button type="button" onclick="location.href='${pageContext.request.contextPath}/home/home'">메인화면으로 이동</button>
					</p>
				</div>
				
				
			</div>
		</div>

	</div>
</div>

