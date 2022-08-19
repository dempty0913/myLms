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


.lectureList .accordion-unit {
	padding: 11px 10px;
}

.line {
	display: flex;
	justify-content: space-between;
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
							<li><a href="${pageContext.request.contextPath}/teacher/lecture/home">수업</a></li>
							<li><a href="${pageContext.request.contextPath}/teacher/lecture/videoList">영상</a></li>
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
						<p class="smallTitle">과제 업로드 목록</p>
						<button type="button" class="btn addBtn" onclick="location.href='${pageContext.request.contextPath}/teacher/lecture/project/add'">과제 등록</button>
					</div>
					<div class="lectureList">
						
						<div class="accordion" id="accordionPanelsStayOpenExample">
							<c:forEach var="li" items="${list}" varStatus="status">
								<div class="accordion-item">
									<h2 class="accordion-header" id="panelsStayOpen-heading${status.index}">
										<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse${status.index}" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
										  ${li.lectureName}
										</button>
									</h2>
									<div id="panelsStayOpen-collapse${status.index}" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingOne">
										<div class="accordion-body">
											<c:forEach var="pl" items="${projectList}">
												<c:if test="${li.lectureNum == pl.lectureNum}">
													<div class="accordion-unit">
														<a href="#" class="line">
															<p><i class="fa-solid fa-book"></i>&nbsp;&nbsp;${pl.projectSubject}</p>
															<p>${pl.eDate}까지</p>
														</a>
													</div>
													<hr>
												</c:if>
											</c:forEach>
										</div>
									</div>
								</div>
							</c:forEach>
							
						</div>
					
					</div>

				</div>
			
				
			</div>
		</div>

	</div>
</div>


