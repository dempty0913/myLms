<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">

.detailProject {
	padding: 30px 80px;
}


.title {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 10px 20px;
}

.title .left p:first-child {
	font-size: 28px;
	font-weight: bold;
}

.title .right {
	border: 3px solid red;
	border-radius: 30px;
	padding: 10px 20px;
	font-size: 20px;
	font-weight: bold;
}

.mainContent {
	padding: 20px 20px;
	font-size: 18px;
	height: 60vh;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}

.bottom {
	display: flex;
	justify-content: space-between;
}

.mainContent .submitFile {
	border: 2px solid gray;
	border-radius: 12px;
	padding: 8px 20px;
	display: flex;
	justify-content: space-between;
	width: 70%;
}

.btnList button {
	padding: 8px 20px;
	font-weight: bold;
	border-radius: 15px;
}

.btnList button:first-child {
	background: white;
	color: #2F4352;
	border: 2px solid #2F4352;
	margin-right: 10px;
}

.btnList button:nth-child(2) {
	background: #2F4352;
	color: white;
}

</style>


		<div class="detailProject">
			<div class="detailContents">
				<div class="title">
					<div class="left">
						<p>피라미드 만들기</p>
						<p>2022-07-20 ~ 2022-07-25</p>
					</div>
					<div class="right">
						<p>미제출</p>
					</div>
				</div>
				
				<hr>
				
				<div class="mainContent">
					<div class="content">
						<p>거꾸로 피라미드를 만들어 파일을 제출하세요.</p>
					</div>
					
					<div class="bottom">
						<div class="submitFile">
							<p>제출파일 : triangle.java</p>
							<p>2022-07-22</p>
						</div>
						<div class="btnList">
							<p>
								<button type="button">수정</button>
								<button type="button">제출</button>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
</div>
