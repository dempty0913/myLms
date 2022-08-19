<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
.back {
	background: #EAEFF7;
	height:100vh;
	font-family: 'GmarketSansMedium';
}

.contents {
	padding: 50px 100px;
	margin-bottom: 50px;
}

.boxes {
	display: flex;
	justify-content: space-between;
}

.box {
	width: 47%;
	height: 550px;
	background: white;
	border-radius: 8px;
	padding: 20px 30px;
}

.mainRight {
	width: 47%;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}

.box2 {
	height: 250px;
	width: 100%;
}

.boxTitle {
	font-size: 20px;
	margin-bottom: 15px;
}

.list {
	margin-top: 15px;
}

.listItem {
	display: flex;
	justify-content: space-between;
	margin-bottom: 10px;
}

.listTitle {
	display: flex;
	justify-content: space-between;
	margin-bottom: 11px;
	padding: 0 15px;
}

.list2 {
	margin-top: 11px;
}

.listItem2 {
	display: flex;
	justify-content: space-between;
	margin-bottom: 8px;
}

.more {
	text-align: right;
}
</style>


		<div class="back">
			<div class="contents">
				<div class="boxes">
					<div class="box box1">
						<p class="boxTitle">이번 학기 수업</p>
						<hr>
						<div class="list">
							<c:forEach var="li" items="${list}">
								<div class="listItem">
									<p>${li.lectureName}</p>
									<p>${li.day} / ${li.time}교시</p>
								</div>
							</c:forEach>
						</div>
					</div>
					
					<div class="mainRight">
						<div class="box box2">
							<p class="boxTitle">최근 등록한 영상</p>
							<div class="listTitle">
								<p>수업</p>
								<p>제목</p>
								<p>등록일</p>
							</div>
							<hr>
							<div class="list2">
								<c:forEach var="vd" items="${videoList}" begin="0" end="3">
									<div class="listItem2">
										<p>${vd.lectureName}</p>
										<p>${vd.videoName}</p>
										<p>${vd.regDate}</p>
									</div>
								</c:forEach>
							</div>
							<p class="more">더보기 ></p>
						</div>
						
						<div class="box box2">
							<p class="boxTitle">최근 등록한 과제</p>
							<div class="listTitle">
								<p>수업</p>
								<p>제목</p>
								<p>등록일</p>
							</div>
							<hr>
							<div class="list2">
								<c:forEach var="pr" items="${projectList}" begin="0" end="3">
									<div class="listItem2">
										<p>${pr.lectureName}</p>
										<p>${pr.projectSubject}</p>
										<p>${pr.regDate}</p>
									</div>
								</c:forEach>
							</div>
							<p class="more">더보기 ></p>
						</div>
					</div>
					
					
				</div>
			</div>
		
		</div>
		
		
	</div>
</div>






