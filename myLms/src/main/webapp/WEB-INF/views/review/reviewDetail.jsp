<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
.contents {
	background: #EAEFF7;
	overflow-y:scroll; height:100vh;
	font-family: 'GmarketSansMedium';
}

.mainContent {
	padding: 50px 100px;
	margin-bottom: 50px;
}


.topPart {
}

.left {
	display: flex;
	border-right: 2px solid lightgray;
	padding-right: 60px;
}

.backBtn {
	color: #2F4352;
	background: white;
	border: 3px solid #2F4352;
	padding: 0 25px;
	height: 50px;
	margin-right: 8px;
}

.writeBtn {
	background: #2F4352;
	color: white;
	padding: 0 25px;
	height: 50px;
}


.lectureTitle {
	font-size: 30px;
	margin-bottom: 15px;
}

.topLeft {
	margin-right: 110px;
}

.topLeft table {
	border-collapse: collapse;
}

.topLeft table td {
	padding: 6px 35px;
}

.topLeft table td:nth-child(2n+1) {
	border-right: 1px solid lightgray;
	padding-left: 0;
}

.right {
	padding-left: 60px;
	display: flex;
	flex-direction: column;
	justify-content: center;
}

.right span {
	font-weight: bold;
}

.right .test {
	margin-bottom: 8px;
}

.right .test p:first-child {
	font-weight: bold;
	font-size: 17px;
}

.right .project p:first-child {
	font-weight: bold;
	font-size: 17px;
}


.reviewContents .myReview {
	background: white;
	margin-top: 30px;
	padding: 25px 35px;
}

.reviewContents .allReview {
	background: white;
	margin-top: 30px;
	padding: 25px 35px;
}

.reviewContents .smallTitle {
	font-size: 18px;
	font-weight: bold;
}

.reviewContents .reviewContent {
	padding: 15px 15px;
}

.myReviewTop {
	display: flex;
	justify-content: space-between;
}


.reviewContents table {
	border-collapse: collapse;
	margin-bottom: 13px;
}

.reviewContents table td {
	padding: 6px 35px;
}

.reviewContents table td:nth-child(2n+1) {
	border-right: 1px solid lightgray;
	padding-left: 0;
}

.updateBtn {
	color: #2F4352;
	background: white;
	border: 3px solid #2F4352;
	padding: 0 35px;
	height: 50px;
}

.allReview .reviewContent {
	padding: 40px 15px;
}

.deleteBtn {
	background: #2F4352;
	color: white;
	padding: 0 25px;
	height: 50px;
}

</style>

<script type="text/javascript">

function deleteReview() {
	if(confirm("리뷰를 삭제하시겠습니까 ? ")){
		location.href='${pageContext.request.contextPath}/review/delete?lectureReviewNum=${myRev.lectureReviewNum}&lectureNum=${myRev.lectureNum}';
	}
}

</script>


		<div class="contents">
			<div class="mainContent">
				<div class="topPart" style="background: white; padding: 25px 35px; display: flex;">
					<div class="left">
						<div class="topLeft">
							<p class="lectureTitle">${dto.lectureName}</p>
							<table>
								<tr>
									<td>${dto.major}</td>
									<td>전공</td>
								</tr>
								<tr>
									<td>${dto.userName} 교수</td>
									<td>${dto.day}&nbsp;${dto.time}교시</td>
								</tr>
							</table>
						</div>
						<button type="button" class="backBtn" onclick="location.href='${pageContext.request.contextPath}/review/home'">목록</button>
						<c:if test="${dto.check == 1 and empty myRev}">
							<button type="button" class="writeBtn" onclick="location.href='${pageContext.request.contextPath}/review/write?lectureNum=${dto.lectureNum}&lectureApplyNum=${dto.lectureApplyNum}'">후기 작성</button>
						</c:if>
					</div>
					<div class="right">
						<div class="test">
							<p>시험난이도</p>
							<p><span>상</span> ${level.tTop}% &nbsp;&nbsp;<span>중</span> ${level.tMid}% &nbsp;&nbsp;<span>하</span> ${level.tBot}%</p>
						</div>
						<div class="project">
							<p>과제난이도</p>
							<p><span>상</span> ${level.pTop}% &nbsp;&nbsp;<span>중</span> ${level.pMid}% &nbsp;&nbsp;<span>하</span> ${level.pBot}%</p>
						</div>
					</div>
				</div>
				
				
				<div class="reviewContents">
					<c:if test="${not empty myRev}">
						<div class="myReview">
							<p class="smallTitle">내 후기</p>
							<div class="reviewContent">
								<div class="myReviewTop">
									<table>
										<tr>
											<td>시험난이도&nbsp;&nbsp;${myRev.testLevel}</td>
											<td>${myRev.year}년&nbsp; ${myRev.semester}학기 수업</td>
										</tr>
										<tr>
											<td>과제난이도&nbsp;&nbsp;${myRev.projectLevel}</td>
											<td>등록일&nbsp;&nbsp;${myRev.regDate}</td>
										</tr>
									</table>
									<p>
										<button type="button" class="updateBtn" onclick="location.href='${pageContext.request.contextPath}/review/update?lectureNum=${dto.lectureNum}&lectureApplyNum=${dto.lectureApplyNum}'">수정</button>
										<button type="button" class="deleteBtn" onclick="deleteReview();">삭제</button>
									</p>
								</div>
								<p>${myRev.content}</p>
							</div>
						</div>
					</c:if>
					
					<div class="allReview">
						<p class="smallTitle">모든 후기</p>
						<c:forEach var="li" items="${list}">
							<div class="reviewContent">
								<div class="myReviewTop">
									<table>
										<tr>
											<td>시험난이도&nbsp;&nbsp;${li.testLevel}</td>
											<td>${li.year}년 ${li.semester}학기 수업</td>
										</tr>
										<tr>
											<td>과제난이도&nbsp;&nbsp;${li.projectLevel}</td>
											<td>등록일&nbsp;&nbsp;${li.regDate}</td>
										</tr>
									</table>
								</div>
								<p>${li.content}</p>
							</div>
							<hr>
						</c:forEach>
						
						<div class="page">
							${dataCount == 0 ? "등록된 게시글이 없습니다." : paging}
						</div>
					</div>
				</div>
				
			</div>
		</div>

	</div>
</div>

</body>
</html>