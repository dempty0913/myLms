<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
.myMessage {
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

.messageList {
	display: flex;
	justify-content: space-between;
}

.messageList .leftList {
	width: 47%;
	height: 70vh;
	background: white;
	overflow-y:scroll; height:70vh;
	padding: 20px 15px;
}

.messageList .leftList .itemList {
	width: 100%;
	height: 100%;
}

.messageList .leftList .itemList .item {
	display: flex;
	align-items: center;
	justify-content: space-between;
	text-align: center;
	padding: 10px 10px;
}

.messageList .leftList .itemList .item p:nth-child(1) {
	width: 15%;
}

.messageList .leftList .itemList .item p:nth-child(2) {
	width: 50%;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	overflow: hidden;
}

.messageList .leftList .itemList .item p:nth-child(3) {
	width: 25%;
}

.messageList .rightDetail {
	width: 47%;
	height: 70vh;
	background: white;
	overflow-y:scroll; height:70vh;
	padding: 30px 25px;
}

.messageList .rightDetail p:nth-child(2) {
	color: gray;
	margin-bottom: 20px;
}

.messageList .rightDetail hr {
	margin-bottom: 20px;
}

</style>


		<div class="myMessage">
			<div class="contents">
				<div class="title">
					<p>쪽지</p>
				</div>
				
				<div class="messageList">
					<div class="leftList">
						<div class="itemList">
							<c:forEach var="i" begin="1" end="10">
								<div class="item">
									<p>김자바</p>
									<p>안녕하세요 자바 프로그래밍 시험 날짜가 변경되어 공지합니다. 6월11일 -> 6월13일로 변경되었습니다.</p>
									<p>2022-05-05</p>
								</div>
								<hr> 
							</c:forEach>
						</div>
					</div>
					
					<div class="rightDetail">
						<p>보낸사람 : 김자바</p>
						<p>2022-05-05</p>
						<hr>
						<p>안녕하세요 자바 프로그래밍 시험 날짜가 변경되어 공지합니다. 6월11일 -> 6월13일로 변경되었습니다.</p>
					</div>
				</div>
			</div>
		</div>

	</div>
</div>

