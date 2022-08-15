<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css" type="text/css">
<script type="text/javascript">
$(function() {
	const now = new Date();
	const year = now.getFullYear();
	const month = now.getMonth() + 1;
	
	if(month == 13) {
		month = 1;
	}
	
	let sem;
	
	if(month >= 2 && month <8) {
		sem = 1;
	} else {
		sem = 2;
	}
	
	let result = year + " - " + sem + "학기";
	
	$('.date').text(result);
});

function detailBtn(year, semester, lectureName, major, day, time, midSDate, finSDate, lectureInfo, userName) {
	let name = userName + " 교수";
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
}

function addLecture() {
	let lectureNum = $('.addBtn').val();
	
	location.href = "${pageContext.request.contextPath}/home/add?lectureNum="+lectureNum;
}
</script>

		<div class="contents">
			<div class="topLayout">
				<div class="topText">
					<p class="date"></p>
					<p>수업을 추가해보세요</p>
				</div>
				
				<form name="searchForm" class="search">
					<input type="text" placeholder="수업명, 교수명, 전공으로 검색">
					<button type="button">검색</button>
				</form>
			</div>
			
		</div>
		
		<hr>
		
		<div class="lectureList">
			<table class="lecture">
				<tr>
					<td>전공</td>
					<td>수업명</td>
					<td>요일</td>
					<td>시간</td>
					<td>교수명</td>
					<td>담기</td>
					<td>상세</td>
				</tr>
				<c:forEach var="li" items="${list}">
					<tr>
						<td>${li.major}</td>
						<td>${li.lectureName}</td>
						<td>${li.day}
						<td>${li.time} 교시</td>
						<td>${li.userName} 교수</td>
						<c:choose>
							<c:when test="${li.status == 0}">
								<td><button type="button" value="${li.lectureNum}" class="addBtn" disabled="disabled">담기</button></td>
							</c:when>
							<c:when test="${li.status == 1}">
								<td><button type="button" value="${li.lectureNum}" class="addBtn" onclick="addLecture();">담기</button></td>
							</c:when>
						</c:choose>
						<td><button type="button" value="${li.lectureNum}" onclick="detailBtn('${li.year}', '${li.semester}', '${li.lectureName}', '${li.major}', '${li.day}', '${li.time}', '${li.midSDate}', '${li.finSDate}', '${li.lectureInfo}', '${li.userName}');" class="detailBtn" data-bs-toggle="modal" data-bs-target="#detailModal">상세</button></td>
					</tr>				
				</c:forEach>
			</table>
		</div>
		
		<div class="page">
			${dataCount == 0 ? "등록된 게시글이 없습니다." : paging}
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
				<button type="button" class="lectureFileBtn">수업 계획서</button>
				<button type="button" class="addBtn">+ 담기</button>
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




