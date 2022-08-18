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
}

.video td {
	padding: 8px 0;
}

.video thead {
	color: gray;
	font-weight: bold;
}


</style>

		
		<div class="lecture">
			<div class="top">
				<p>2022 - 2학기</p>
				<div class="topBottom">
					<p>자바 프로그래밍</p>
					<p>김자바 교수</p>
				</div>
			</div>
			
		</div>
		
		<ul class="nav nav-tabs">
			<li class="nav-item">
				<a class="nav-link" href="#">수업</a>
			</li>
			<li class="nav-item">
				<a class="nav-link active" aria-current="page" href="#">과제</a>
			</li>
		</ul>
		
		<div class="select">
			<select class="form-select">
				<option>전체</option>
				<option>미제출</option>
				<option>제출</option>				
			</select>
		</div>
		
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
				<c:forEach var="i" begin="1" end="5">
					<tr onclick="#">
						<td>${i}</td>
						<td>피라미드 만들기</td>
						<td>2022-07-22</td>
						<td>2022-07-28</td>
						<td>제출</td>
					</tr>				
				</c:forEach>
			</table>
		</div>

	</div>
</div>

