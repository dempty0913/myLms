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

.lectureList table {
	border-collapse: collapse;
	width: 100%;
	text-align: center;
}

.lectureList table tr {
	border-bottom: 1px solid gray;
}

.lectureList table td {
	padding: 7px 0;
}

.btn {
	border-radius: 8px;
	border: none;
	padding: 7px 15px;
}

.detailBtn {
	background: #2F4352;
	color: white;
}

.detailBtn:hover {
	background: white;
	border: 2px solid #2F4352;
	color: #2F4352;
	padding: 5px 13px;
}



.modal-body {
	display: flex;
	justify-content: space-between;
	height: 200px;
	margin-bottom: 30px;
}

.leftContent p:first-child {
	color: gray;
	font-size: 22px;
}

.leftContent p:nth-child(2) {
	font-size: 35px;
	font-weight: bold;
	margin-bottom: 8px;
}

.leftContent ul {
	font-size: 20px;
}


.rightContent button {
	font-size: 18px;
	padding: 5px 17px;
	border-radius: 12px;
}

.rightContent .updateBtn {
	background: #2F4352;
	color: white;
}

.rightContent .deleteBtn {
	background: white;
	border: 2px solid #2F4352;
}

.goal {
	width: 100%;
}

legend {
	float: none; 
	padding: inherit;
	font-size: 22px;
	font-weight: bold;
}

.page {
	margin-top: 15px;
}

</style>
<script type="text/javascript">

function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data) {
			fn(data);
		},
		beforeSend:function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error:function(jqXHR) {
			if(jqXHR.status===403) {
				login();
				return false;
			}
	    	
			console.log(jqXHR.responseText);
		},
	});
}

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
	
	applyCount(lectureNum);
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

function applyCount(lectureNum) {
	let url = "${pageContext.request.contextPath}/teacher/lecture/applyCount";
	let query = "lectureNum="+lectureNum;
	
	var fn = function(data){
		console.log(data);
		let c = data.count;
		if(c != 0) {
			$('#deleteBtn').hide();
		}
	};

	ajaxFun(url, "get", query, "json", fn);
	
}

</script>

		<div class="back">
			<div class="contents">
				<div class="title">
					<p>수업</p>
				</div>
				
				<div class="middle">
					<div class="middleLeft">
						<ul>
							<li>수업</li>
							<li><a href="${pageContext.request.contextPath}/teacher/lecture/videoList">영상</a></li>
							<li><a href="${pageContext.request.contextPath}/teacher/lecture/projectList">과제</a></li>
						</ul>
					</div>
					
					<select class="form-select">
						<option>현재 학기</option>
						<option>전체</option>
					</select>
				</div>
				
				<div class="mainLayout">
					<div class="titlePart">
						<p class="smallTitle">수업 목록</p>
						<button type="button" class="btn addBtn" onclick="location.href='${pageContext.request.contextPath}/teacher/lecture/add'">수업 추가</button>
					</div>
					<div class="lectureList">
						<table>
							<tr>
								<td>수업명</td>
								<td>요일</td>
								<td>교시</td>
								<td>상세</td>
							</tr>
							<c:forEach var="li" items="${list}">
								<tr>
									<td>${li.lectureName}</td>
									<td>${li.day}</td>
									<td>${li.time}교시</td>
									<td><button type="button" class="btn detailBtn" onclick="location.href='${pageContext.request.contextPath}/teacher/lecture/lectureApplyList?lectureNum=${li.lectureNum}&lectureName=${li.lectureName}'">상세</button></td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div class="page">
						${dataCount == 0 ? "등록된 게시글이 없습니다." : paging}
					</div>
				</div>
			
				
			</div>
		</div>

	</div>
</div>

<!-- detail Modal -->
<div class="modal fade" id="detailModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">수업 상세</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <div class="modalContent py-4 px-4">
	      <div class="modal-body">
			<div class="leftContent">
				<p id="first"></p>
				<p id="subject"></p>
				<ul>
					<li id="major"></li>
					<li id="name"></li>
					<li id="date"></li>
					<li id="midDate">중간고사 날짜 : <span></span></li>
					<li id="finDate">기말고사 날짜 : <span></span></li>
				</ul>
			</div>
			
			<div class="rightContent">
				<button type="button" id="updateBtn" class="updateBtn" value="" onclick="updateLecture();">수정</button>
				<button type="button" id="deleteBtn" class="deleteBtn" value="" onclick="deleteLecture();">삭제</button>
			</div>
	      </div>
	      
	      <div class="goal">
		      <fieldset class="border pb-4 px-4">
		      	<legend class="w-auto">강의 목표</legend>
		      	<p id="info"></p>
		      </fieldset>
	      </div>
      </div>
      
    </div>
  </div>
</div>
