<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<ul class="nav nav-tabs">
	<li class="nav-item">
		<a class="nav-link active" aria-current="page" href="#">수업</a>
	</li>
	<li class="nav-item">
		<a class="nav-link" href="#">과제</a>
	</li>
</ul>

<div class="videoList">
	<table class="video table table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th width="42%">제목</th>
				<th>등록일</th>
				<th>영상시간</th>
				<th>들은시간</th>
				<th width="12%">미완 / 완료</th>
				<th>듣기</th>
			</tr>
		</thead>
		<c:forEach var="li" items="${videoList}">
			<tr onclick="#">
				<td>1</td>
				<td>${li.videoName}</td>
				<td>${li.regDate}</td>
				<td>${li.videoTotalTime}</td>
				<td>${li.saveTime}</td>
				<td>${li.videoTotalTime == li.saveTime ? "완료" : "미완" }</td>
				<td><button type="button" class="watchBtn" onclick="location.href='${pageContext.request.contextPath}/dashBoard/article?videoFileNum=${li.videoFileNum}'">듣기</button>
			</tr>				
		</c:forEach>
	</table>
	
	
</div>

<div class="page">
	${dataCount == 0 ? "등록된 게시글이 없습니다." : paging}
</div>