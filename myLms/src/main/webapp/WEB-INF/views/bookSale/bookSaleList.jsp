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

.searchFilter {
	display: flex;
	justify-content: space-between;
	margin-bottom: 20px;
}

.top .searchFilter .input-group {
	font-size: 17px;
	margin-right: 15px;
}

.top .searchFilter .input-group .input-group-text {
	background: white;
}

.searchLeft {
	display: flex;
	width: 100%;
	padding-right: 30px;
}

.searchBtn {
	width: 14%;
	background: #2F4352;
	color: white;
	border-radius: 4px;
}


.top .searchFilter .form-select {
	width: 17%;
}


.majorList {
	display: flex;
	flex-wrap: wrap;
	margin-bottom: 20px;
}

.majorList .major {
	border: none;
	border-radius: 20px;
	background: #94B5D9;
	color: white;
	padding: 7px 12px;
	margin-bottom: 10px;
	margin-left: 5px;
	margin-right: 5px;
	box-shadow: 5px 5px 6px #637991;
}

.mainContent .selectMode {
	margin-bottom: 20px;
}

.mainContent .selectMode li {
	width: 100px;
}

.mainContent .selectMode button {
	width: 100%;
}

.mainContent .selectMode .nav-link:nth-child(2) {
	color: #2F4352;
}

.mainContent .listInfo {
	display: flex;
	justify-content: space-between;
	margin-bottom: 18px;
	align-items: center;
}

.mainContent .listInfo .insertBtn {
	width: 150px;
	background: #2F4352;
	color: white;
	border-radius: 4px;
	padding: 7px 10px;
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
	padding: 15px 20px;
	display: flex;
	justify-content: space-between;
}

.lecture .lectureLeft {

}

.lecture .lectureLeft .lectureTitle {
	display: flex;
	margin-bottom: 10px;
}

.lecture .lectureLeft .lectureTitle p {
	font-size: 30px;
	font-weight: bold;
	font-family: 'GmarketSansMedium';
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


.mainContent .card img {
	height: 250px;
}

.mainContent .card .card-body {
	padding: 20px 20px;
}

.btnPTag {
	text-align: center;
}

.detailBtn {
	background: white;
	border: 3px solid #2F4352;
	border-radius: 8px;
	padding: 8px 20px;
	margin-top: 15px;
}

.detailBtn:hover {
	background: #2F4352;
	color: white;
}

</style>


		<div class="back">
			<div class="contents">
				<div class="top">
					<div class="title">
						<p>책방</p>
					</div>
					<div class="searchFilter">
						<div class="searchLeft">
							<div class="input-group">
								<span class="input-group-text" id="basic-addon1"><i class="fa-solid fa-magnifying-glass"></i></span>
								<input type="text" class="form-control" placeholder="수업명, 교수명, 책명으로 검색하세요">
							</div>
							<button type="button" class="searchBtn">검색</button>
						</div>
					</div>
					<div class="majorList">
						<div class="major">글로벌비즈니스</div>
						<div class="major">광고홍보콘텐츠</div>
						<div class="major">공공인재</div>
						<div class="major">경영</div>
						<div class="major">아동</div>
						<div class="major">군사</div>
						<div class="major">금융정보공학</div>
						<div class="major">전자공학</div>
						<div class="major">컴퓨터공학</div>
						<div class="major">소프트웨어</div>
						<div class="major">나노화학생명</div>
						<div class="major">물류시스템공학</div>
						<div class="major">도시공학</div>
						<div class="major">토목건축공학</div>
						<div class="major">공연예술</div>
						<div class="major">음악</div>
						<div class="major">실용음악</div>
						<div class="major">무용예술</div>
						<div class="major">디자인</div>
						<div class="major">영화영상</div>
						<div class="major">미용예술</div>
					</div>
				</div>
				
				
				<div class="mainContent">
					<ul class="nav nav-tabs selectMode" id="myTab" role="tablist">
						<li class="nav-item" role="presentation">
							<button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">전체</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">내 책방</button>
						</li>
					</ul>
					
					<div class="listInfo">
						<p class="firstP">총 <span>10개</span>의 글</p>
						<button type="button" class="insertBtn">책 등록하기</button>
					</div>
					<div class="row row-cols-1 row-cols-md-3 g-4">
						<c:forEach var="i" begin="1" end="5">
							<div class="col">
								<div class="card">
									<img src="https://media.bunjang.co.kr/product/145776295_1_1630498694_w360.jpg" class="card-img-top" alt="...">
									<div class="card-body">
										<h5 class="card-title">쉽게 배우는 자바 판매합니다.</h5>
										<p class="card-text">수업 : 자바프로그래밍</p>
										<p class="card-text">저자 : 김자바</p>
										<p class="btnPTag"><button type="button" class="detailBtn">상세보기</button></p>
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

</body>
</html>