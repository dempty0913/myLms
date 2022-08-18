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

.title {
	font-size: 35px;
	font-weight: bold;
	margin-bottom: 20px;
	font-family: 'Cafe24Ssurround';
	color: #2F4352;
}

.middle {
	display: flex;
	justify-content: space-between;
}

.middleLeft {
	background: white;
	border-radius: 8px;
	padding: 10px 20px;
	width: 70%;
}

.middle ul {
	display: flex;
	align-items: center;
	margin-bottom: 0;
}

.middle ul li {
	margin-right: 45px;
}

.middle .form-select {
	width: 20%;
}


.mainLayout {
	background: white;
	border-radius: 8px;
	margin-top: 30px;
	padding: 20px 30px;
}

.mainLayout .smallTitle {
	font-size: 20px;
	margin-bottom: 0;
}

.titlePart {
	display: flex;
	justify-content: space-between;
	padding: 0 10px;
	align-items: center;
	margin-bottom: 20px;
}

.titlePart .addBtn {
	background: #2F4352;
	color: white;
	padding: 5px 20px;
}

.lectureList {
	padding: 0 40px;
}



.page {
	margin-top: 15px;
}

</style>
<script type="text/javascript">

function detailBtn(lectureNum, year, semester, lectureName, major, day, time, midSDate, finSDate, lectureInfo) {
	let name = '${sessionScope.member.userName}';
	name = name + " 교수";
	let first = year + " - " + semester + "학기";
	let date = day + " / " + time + "교시";
	
	if(! midSDate) {
		midSDate = "미정";
	}
	if(! finSDate) {
		finSDate = "미정";
	}
	
	$('#first').text(first);
	$('#subject').text(lectureName);
	$('#major').text(major);
	$('#name').text(name);
	$('#date').text(date);
	$('#midDate span').text(midSDate);
	$('#finDate span').text(finSDate);
	$('#info').text(lectureInfo);
	
	$('#updateBtn').val(lectureNum);
	$('#deleteBtn').val(lectureNum);
	
}

function updateLecture() {
	let lectureNum = $('#updateBtn').val();
	
	location.href = '${pageContext.request.contextPath}/teacher/lecture/update?lectureNum='+lectureNum;
}

function deleteLecture() {
	let lectureNum = $('#deleteBtn').val();
	
	if(confirm("수업을 삭제 하시겠습니까 ? ")) {
		location.href = '${pageContext.request.contextPath}/teacher/lecture/delete?lectureNum='+lectureNum;
	}
}

</script>

		<div class="back">
			<div class="contents">
				<div class="title">
					<p>강의</p>
				</div>
				
				<div class="middle">
					<div class="middleLeft">
						<ul>
							<li>수업</li>
							<li>영상</li>
							<li>과제</li>
							<li>성적</li>
						</ul>
					</div>
					
					<select class="form-select">
						<option>현재 학기</option>
						<option>전체</option>
					</select>
				</div>
				
				<div class="mainLayout">
					<div class="titlePart">
						<p class="smallTitle">강의 업로드 목록</p>
						<button type="button" class="btn addBtn" onclick="location.href='${pageContext.request.contextPath}/teacher/lecture/videoAdd'">영상 업로드</button>
					</div>
					<div class="lectureList">
						
						<div class="accordion" id="accordionPanelsStayOpenExample">
							<div class="accordion-item">
								<h2 class="accordion-header" id="panelsStayOpen-headingOne">
									<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
									  자바 프로그래밍
									</button>
								</h2>
								<div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
									<div class="accordion-body">
										<div class="accordion-unit">
											<a href="#"><i class="fa-solid fa-circle-play"></i>&nbsp;&nbsp;자바란 무엇인가</a>
										</div>
										<div class="accordion-unit">
											<a href="#"><i class="fa-solid fa-circle-play"></i>&nbsp;&nbsp;자바 개념알기</a>
										</div>
									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="panelsStayOpen-headingTwo">
									<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
										C 프로그래밍
									</button>
								</h2>
								<div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
									<div class="accordion-body">
										<div class="accordion-unit">
											<a href="#"><i class="fa-solid fa-circle-play"></i>&nbsp;&nbsp;첫번째 강의</a>
										</div>
										<div class="accordion-unit">
											<a href="#"><i class="fa-solid fa-circle-play"></i>&nbsp;&nbsp;두번째 강의</a>
										</div>
										<div class="accordion-unit">
											<a href="#"><i class="fa-solid fa-circle-play"></i>&nbsp;&nbsp;세번째 강의</a>
										</div>
										<div class="accordion-unit">
											<a href="#"><i class="fa-solid fa-circle-play"></i>&nbsp;&nbsp;네번째 강의</a>
										</div>
									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="panelsStayOpen-headingThree">
									<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
										섹션 2. 커넥션풀과 데이터소스 이해
									</button>
								</h2>
								<div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree">
									<div class="accordion-body">
										<div class="accordion-unit">
											<a href="#"><i class="fa-solid fa-circle-play"></i>&nbsp;&nbsp;첫번째 강의</a>
										</div>
										<div class="accordion-unit">
											<a href="#"><i class="fa-solid fa-circle-play"></i>&nbsp;&nbsp;두번째 강의</a>
										</div>
										<div class="accordion-unit">
											<a href="#"><i class="fa-solid fa-circle-play"></i>&nbsp;&nbsp;세번째 강의</a>
										</div>
										<div class="accordion-unit">
											<a href="#"><i class="fa-solid fa-circle-play"></i>&nbsp;&nbsp;네번째 강의</a>
										</div>
									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="panelsStayOpen-headingFour">
									<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseFour" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
										섹션 3. 트랜잭션 이해
									</button>
								</h2>
								<div id="panelsStayOpen-collapseFour" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree">
									<div class="accordion-body">
										<div class="accordion-unit">
											<a href="#"><i class="fa-solid fa-circle-play"></i>&nbsp;&nbsp;첫번째 강의</a>
										</div>
										<div class="accordion-unit">
											<a href="#"><i class="fa-solid fa-circle-play"></i>&nbsp;&nbsp;두번째 강의</a>
										</div>
										<div class="accordion-unit">
											<a href="#"><i class="fa-solid fa-circle-play"></i>&nbsp;&nbsp;세번째 강의</a>
										</div>
										<div class="accordion-unit">
											<a href="#"><i class="fa-solid fa-circle-play"></i>&nbsp;&nbsp;네번째 강의</a>
										</div>
									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="panelsStayOpen-headingFive">
									<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseFive" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
										섹션 4. 자바 예외 이해
									</button>
								</h2>
								<div id="panelsStayOpen-collapseFive" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree">
									<div class="accordion-body">
										<div class="accordion-unit">
											<a href="#"><i class="fa-solid fa-circle-play"></i>&nbsp;&nbsp;첫번째 강의</a>
										</div>
										<div class="accordion-unit">
											<a href="#"><i class="fa-solid fa-circle-play"></i>&nbsp;&nbsp;두번째 강의</a>
										</div>
										<div class="accordion-unit">
											<a href="#"><i class="fa-solid fa-circle-play"></i>&nbsp;&nbsp;세번째 강의</a>
										</div>
										<div class="accordion-unit">
											<a href="#"><i class="fa-solid fa-circle-play"></i>&nbsp;&nbsp;네번째 강의</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					
					</div>
					<div class="page">
						${dataCount == 0 ? "등록된 게시글이 없습니다." : paging}
					</div>
				</div>
			
				
			</div>
		</div>

	</div>
</div>


