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
}

.searchBtn {
	width: 15%;
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


.mainContent {
}

.mainContent .firstP {
	font-size: 16px;
	margin-bottom: 15px;
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
	cursor: pointer;
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


</style>

<script type="text/javascript">

$(function(){
	$(".lecture").click(function(){
		let id =??$(this).attr('id');
		id = id.replace('lecture', '');
		location.href = "${pageContext.request.contextPath}/review/detail?lectureNum="+id;
	});
});


function searchList() {
	const f = document.searchForm;
	f.submit();
}
</script>



		<div class="back">
			<div class="contents">
				<div class="top">
					<div class="title">
						<p>????????????</p>
					</div>
					<form name="searchForm" class="search" method="post" action="${pageContext.request.contextPath}/review/home">
						<div class="searchFilter">
							<div class="searchLeft">
									<div class="input-group">
										<span class="input-group-text" id="basic-addon1"><i class="fa-solid fa-magnifying-glass"></i></span>
										<input type="text" class="form-control" name="keyword" value="${keyword}" placeholder="?????????, ??????????????? ???????????????">
									</div>
									<button type="button" class="searchBtn" onclick="searchList();">??????</button>
							</div>
						</div>
					</form>
					<!-- 
					<div class="majorList">
						<div class="major">?????????????????????</div>
						<div class="major">?????????????????????</div>
						<div class="major">????????????</div>
						<div class="major">??????</div>
						<div class="major">??????</div>
						<div class="major">??????</div>
						<div class="major">??????????????????</div>
						<div class="major">????????????</div>
						<div class="major">???????????????</div>
						<div class="major">???????????????</div>
						<div class="major">??????????????????</div>
						<div class="major">?????????????????????</div>
						<div class="major">????????????</div>
						<div class="major">??????????????????</div>
						<div class="major">????????????</div>
						<div class="major">??????</div>
						<div class="major">????????????</div>
						<div class="major">????????????</div>
						<div class="major">?????????</div>
						<div class="major">????????????</div>
						<div class="major">????????????</div>
					</div>
				</div>
				 -->
				
				<div class="mainContent">
					<p class="firstP">??? <span>${dataCount}???</span> ??????</p>
					<c:forEach var="li" items="${list}">
						<div class="lecture" id="lecture${li.lectureNum}">
							<div class="lectureLeft">
								<div class="lectureTitle">
									<p>${li.lectureName}</p>
									<div class="box lectureMajor">${li.major}</div>
									<div class="box lectureType">??????</div>
								</div>
								<p>${li.userName} ??????</p>
							</div>
							<div class="lectureRight">
								<div class="count">
									<p>??????</p>
									<p>${li.reviewCount}</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				
				<div class="page">
					${dataCount == 0 ? "????????? ???????????? ????????????." : paging}
				</div>
				
			</div>
		</div>


	</div>
</div>

</body>
</html>