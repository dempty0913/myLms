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

</style>


		<div class="contents">
			<div class="mainContent">
				<div class="topPart" style="background: white; padding: 25px 35px; display: flex;">
					<div class="left">
						<div class="topLeft">
							<p class="lectureTitle">자바 프로그래밍</p>
							<table>
								<tr>
									<td>컴퓨터공학</td>
									<td>전공</td>
								</tr>
								<tr>
									<td>김자바 교수</td>
									<td>월, 목 21, 22교시</td>
								</tr>
							</table>
						</div>
						<button type="button" class="writeBtn">후기 작성</button>
					</div>
					<div class="right">
						<div class="test">
							<p>시험난이도</p>
							<p><span>상</span> 80% &nbsp;&nbsp;<span>중</span> 10% &nbsp;&nbsp;<span>하</span> 10%</p>
						</div>
						<div class="project">
							<p>과제난이도</p>
							<p><span>상</span> 80% &nbsp;&nbsp;<span>중</span> 10% &nbsp;&nbsp;<span>하</span> 10%</p>
						</div>
					</div>
				</div>
				
				
				<div class="reviewContents">
					<div class="myReview">
						<p class="smallTitle">내 후기</p>
						<div class="reviewContent">
							<div class="myReviewTop">
								<table>
									<tr>
										<td>시험난이도&nbsp;&nbsp;상</td>
										<td>2022년 1학기 수업</td>
									</tr>
									<tr>
										<td>과제난이도&nbsp;&nbsp;중</td>
										<td>등록일&nbsp;&nbsp;2022-07-07</td>
									</tr>
								</table>
								<button type="button" class="updateBtn">수정</button>
							</div>
							<p>수업에 정말 열정적이셔서 많이 배울 수 있는 수업이었습니다. 시험과 과제 난이도는 다른 과목에 비해 어려운 편이지만 수업만 열심히 들으면 제출할 수 있습니다</p>
						</div>
					</div>
					
					<div class="allReview">
						<p class="smallTitle">모든 후기</p>
						<c:forEach var="i" begin="1" end="5">
							<div class="reviewContent">
								<div class="myReviewTop">
									<table>
										<tr>
											<td>시험난이도&nbsp;&nbsp;상</td>
											<td>2022년 1학기 수업</td>
										</tr>
										<tr>
											<td>과제난이도&nbsp;&nbsp;중</td>
											<td>등록일&nbsp;&nbsp;2022-07-07</td>
										</tr>
									</table>
								</div>
								<p>수업에 정말 열정적이셔서 많이 배울 수 있는 수업이었습니다. 시험과 과제 난이도는 다른 과목에 비해 어려운 편이지만 수업만 열심히 들으면 제출할 수 있습니다</p>
							</div>
							<hr>
						</c:forEach>
					</div>
				</div>
				
			</div>
		</div>

	</div>
</div>

</body>
</html>