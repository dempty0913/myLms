<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
.top {
	width: 100%;
	padding: 30px 80px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	background: #4D565E;
	color: white;
}

.top p:first-child {
	font-size: 22px;
	font-weight: bold;
}

.topBottom {
	display: flex;
	justify-content: space-between;
}

.topBottom p:first-child {
	font-size: 40px;
	font-family: 'Do Hyeon', sans-serif;
}

.topBottom p:nth-child(2) {
	font-size: 28px;	
	font-family: 'Do Hyeon', sans-serif;
}

.list-group {
	width: 20%;
}

.nav-tabs {
	margin: 30px 80px;
}

.nav-item {
	width: 50%;
	text-align: center;
	font-size: 18px;
	font-weight: bold;
}

.select .form-select {
	width: 100px;
	margin: 15px 100px;
}

.videoList {
	margin: 15px 100px;
}

.video {
	width: 100%;
	text-align: center;
	border-collapse: collapse;
	font-size: 18px;
}

.video tr {
	border-bottom: 1px solid black;
	cursor: pointer;
}

.video td {
	padding: 8px 0;
}

.video thead {
	color: gray;
	font-weight: bold;
}


</style>

		
<ul class="nav nav-tabs">
	<li class="nav-item">
		<a class="nav-link" href="${pageContext.request.contextPath}/dashBoard/detail?mode=1&lectureNum=${lectureNum}&lectureApplyNum=${lectureApplyNum}">수업</a>
	</li>
	<li class="nav-item">
		<a class="nav-link active" aria-current="page" href="#">과제</a>
	</li>
</ul>


<div class="videoList">
	<table class="video table table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th width="42%">과제</th>
				<th>등록일</th>
				<th>마감일</th>
				<th width="15%">제출여부</th>
			</tr>
		</thead>
		<c:forEach var="pr" items="${projectList}">
			<tr onclick="location.href='${pageContext.request.contextPath}/dashBoard/projectDetail?projectNum=${pr.projectNum}&lectureNum=${lectureNum}&lectureApplyNum=${lectureApplyNum}'">
				<td>${pr.listNum}</td>
				<td>${pr.projectSubject}</td>
				<td>${pr.regDate}</td>
				<td>${pr.eDate}</td>
				<td>${pr.originalFileName2 == null ? "미제출" : "제출"}</td>
			</tr>				
		</c:forEach>
	</table>
</div>

<div class="page">
	${dataCount == 0 ? "등록된 게시글이 없습니다." : paging}
</div>

