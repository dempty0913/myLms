<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
.myStudy {
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

.searchFilter {
	display: flex;
	justify-content: space-between;
	margin-bottom: 40px;
}

.myStudy .searchFilter .input-group {
	font-size: 17px;
	margin-right: 15px;
}

.myStudy .searchFilter .input-group .input-group-text {
	background: white;
}

.searchLeft {
	display: flex;
	width: 100%;
}

.searchBtn {
	width: 15%;
	background: #2F4352;
	color: white;
	border-radius: 4px;
}


.myStudy .searchFilter .form-select {
	width: 17%;
}



.mainContent {
	margin-top: 20px;
}

.firstLine {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 15px;
}

.firstLine .insertBtn {
	width: 11%;
	background: #2F4352;
	color: white;
	border-radius: 4px;
	padding: 5px 10px;
}

.mainContent .firstP {
	font-size: 16px;
	margin-left: 8px;
}

.mainContent .firstP span {
	font-size: 18px;
	font-weight: bold;
	color: #576A80;
}

.lecture {
	border-radius: 18px;
	background: white;
	margin-bottom: 20px;
	padding: 15px 40px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	cursor: pointer;
}

.lecture .lectureLeft {

}

.lecture .lectureLeft .lectureTitle {
	display: flex;
	margin-bottom: 10px;
	align-items: center;
}

.lecture .lectureLeft .lectureTitle p {
	font-size: 22px;
	color: #2F4352;
	margin-right: 15px;
}

.lecture .lectureLeft .lectureTitle .box {
	border: none;
	border-radius: 25px;
	background: #94B5D9;
	color: white;
	padding: 7px 12px;
	margin-right: 5px;
	height: 38px;
}

.lecture .lectureLeft .lectureTitle .lectureType {
	background: #D4BDDB;
	
}

.lecture .lectureRight {
	border: 3px solid #DBE6F7;
	border-radius: 18px;
	width: 80px;
	height: 80px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

.lecture .lectureRight .count {
	text-align: center;
}

.lecture .lectureRight .count p:nth-child(2) {
	font-size: 18px;
	font-weight: bold;
}

.lecture .studyContent {
	width: 800px;
	height: 48px;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	overflow: hidden;
}

.regDate {
	color: gray;
	font-size: 15px;
	margin-top: 8px;
}

.mark_ing {
	width: 47px;
	height: 25px;
	background: #0d6efd;
	color: white;
	font-size: 13px;
	font-weight: bold;
	text-align: center;
	margin-right: 8px;
	line-height: 25px;
}

.mark_finsh {
	width: 57px;
	height: 25px;
	background: lightgray;
	color: white;
	font-size: 13px;
	font-weight: bold;
	text-align: center;
	margin-right: 8px;
	line-height: 25px;
}


.mainContent .selectMode {
	margin-bottom: 20px;
}

.mainContent .selectMode li {
	width: 120px;
}

.mainContent .selectMode button {
	width: 100%;
}

.mainContent .selectMode .nav-link:nth-child(2) {
	color: #2F4352;
}
</style>

<script type="text/javascript">

$(function(){
	$(".lecture").click(function(){
		let id = $(this).attr('id');
		id = id.replace('lecture', '');
		location.href = "${pageContext.request.contextPath}/study/detail?studyNum="+id;
	});
});


function searchList() {
	const f = document.searchForm;
	f.submit();
}

</script>


		<div class="myStudy">
			<div class="contents">
				<div class="title">
					<p>스터디</p>
				</div>
				
				<form name="searchForm" class="search" method="post" action="${pageContext.request.contextPath}/study/home">
					<div class="searchFilter">
						<div class="searchLeft">
								<div class="input-group">
									<span class="input-group-text" id="basic-addon1"><i class="fa-solid fa-magnifying-glass"></i></span>
									<input type="text" class="form-control" name="keyword" value="${keyword}" placeholder="제목, 내용으로 검색하세요">
								</div>
								<button type="button" class="searchBtn" onclick="searchList();">검색</button>
						</div>
					</div>
				</form>
				
				
				<div class="mainContent">
					<ul class="nav nav-tabs selectMode" id="myTab" role="tablist">
						<li class="nav-item" role="presentation">
							<button class="nav-link active" id="home-tab"  data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">전체</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link" id="profile-tab" onclick="location.href='${pageContext.request.contextPath}/study/myTab'" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">내 스터디</button>
						</li>
					</ul>
					
					<div class="firstLine">
						<p class="firstP">총 <span>${dataCount}개</span>의 글</p>
						<button type="button" class="insertBtn" onclick="location.href='${pageContext.request.contextPath}/study/add'">등록하기</button>
					</div>
					<c:forEach var="li" items="${list}">
						<div class="lecture" id="lecture${li.studyNum}">
							<div class="lectureLeft">
								<div class="lectureTitle">
									<c:if test="${li.status == 0}">
										<div class="mark_ing">
											모집중
										</div>
									</c:if>
									<c:if test="${li.status == 1}">
										<div class="mark_finsh">
											모집완료
										</div>
									</c:if>
									<p>${li.subject}</p>
								</div>
								<div class="studyContent">
									<p>
										${li.content}
									</p>
								</div>
								<p class="regDate">${li.regDate}</p>
							</div>
							<!-- 
							<div class="lectureRight">
								<div class="count">
									<p>댓글</p>
									<p>5</p>
								</div>
							</div>
							 -->
						</div>
					</c:forEach>
				</div>
				
				<div class="page">
					${dataCount == 0 ? "등록된 게시글이 없습니다." : paging}
				</div>
				
			</div>
		</div>

	</div>
</div>
