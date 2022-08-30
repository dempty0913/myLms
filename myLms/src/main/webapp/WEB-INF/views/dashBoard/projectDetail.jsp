<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">

.detailProject {
	padding: 30px 80px;
	background: #EAEFF7;
	overflow-y:scroll; height:100vh;
	font-family: 'GmarketSansMedium';
}

.detailContents {
	background: white;
	border-radius: 12px;
	padding: 30px 20px;
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

.btnList .btn {
	background: white;
	color: #2F4352;
	border: 2px solid #2F4352;
	margin-right: 10px;
}

.btnList .submitBtn {
	background: #2F4352;
	color: white;
}

.file {
	border: 1px solid lightgray;
	border-radius: 15px;
	padding: 5px 8px;
	color: gray;
	margin-bottom: 12px;
}

.title .clear {
	border: 3px solid blue;
}

</style>


		<div class="detailProject">
			<div class="detailContents">
				<div class="title">
					<div class="left">
						<p>${dto.projectSubject}</p>
						<p>${dto.regDate} ~ ${dto.eDate}</p>
					</div>
					<c:choose>
						<c:when test="${pst.originalFileName != null}">
							<div class="right clear">
								<p>제출</p>
							</div>
						</c:when>
						<c:otherwise>
							<div class="right">
								<p>미제출</p>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
				
				<hr>
				
				<div class="mainContent">
					<div class="content">
						<c:if test="${dto.originalFileName != null}">
							<div class="file">
								<a href="${pageContext.request.contextPath}/dashBoard/download?projectNum=${dto.projectNum}">첨부파일 : ${dto.originalFileName}</a>
							</div>
						</c:if>
						<p>${dto.projectContent}</p>
					</div>
					
					<div class="bottom">
						<div class="submitFile">
							<c:if test="${not empty pst.originalFileName}">
								<p>제출파일 : ${dto.originalFileName2}</p>
								<p>${dto.submitDate}</p>
							</c:if>
						</div>
						<div class="btnList">
							<p>
								<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/dashBoard/detail?mode=2&lectureNum=${dto.lectureNum}&lectureApplyNum=${lectureApplyNum}'">목록</button>
								<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/dashBoard/projectUpdate?projectNum=${dto.projectNum}&lectureNum=${dto.lectureNum}&lectureApplyNum=${lectureApplyNum}'">수정</button>
								<button type="button" class="btn submitBtn" onclick="location.href='${pageContext.request.contextPath}/dashBoard/projectSubmit?projectNum=${dto.projectNum}&lectureNum=${dto.lectureNum}&lectureApplyNum=${lectureApplyNum}'">제출</button>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
</div>
