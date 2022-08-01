<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
.studyDetail {
	background: #EAEFF7;
	overflow-y:scroll; height:100vh;
	font-family: 'GmarketSansMedium';
}

.contents {
	padding: 30px 100px;
	margin-bottom: 50px;
}

.studyContent {
	background: white; 
	padding: 30px 45px;
}

.title {
	margin-bottom: 25px;
	padding: 0 15px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.title .regDate {
	color: gray;
}


.title_top {
	display: flex;
	margin-bottom: 5px;
	align-items: center;
}

.title_top p {
	font-size: 22px;
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

.content {
	margin-top: 25px;
	font-size: 17px;
	padding: 0 15px;
}

.applyBtn {
	width: 11%;
	background: #2F4352;
	color: white;
	border-radius: 4px;
	padding: 5px 10px;
	width: 150px;
}


.replyPart {
	background: white; 
	padding: 30px 45px;
	margin-top: 25px;
}

.replyPart .addReply {
	display: flex;
	align-items: center;
	margin-bottom: 30px;
}

.replyPart .addReply p {
	margin-right: 15px;
}

.replyPart .addReply textarea {
	width: 80%;
	margin-right: 15px;
	resize: none;
	border: 2px solid lightgray;
	border-radius: 8px;
}

.replyPart .addReply .addReplyBtn {
	background: #2F4352;
	color: white;
	border-radius: 4px;
	padding: 5px 10px;
	width: 130px;
}

.replyItems {
	background: white;
	margin-top: 20px;
	padding: 10px 20px;
}

.replyItems .smallTitle {
	font-size: 20px;
	margin-bottom: 20px;
}

.rContent {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 15px 20px;
}

.replyLeft p:first-child {
	font-size: 17px;
	margin-bottom: 6px;
}

.replyLeft p:nth-child(2) {
	font-size: 14px;
	color: gray;
	text-decoration: underline;
}

.replyRight {
	font-size: 15px;
	color: gray;
}
</style>


		<div class="studyDetail">
			<div class="contents">
				<div class="studyContent">
					<div class="title">
						<div class="title_left">
							<div class="title_top">
								<div class="mark_ing">
									모집중
								</div>
								<!-- 
								<div class="mark_finsh">
									모집완료
								</div>
								 -->
								<p>자바 스터디 모집합니다.</p>
							</div>
							<p class="regDate">2022-07-22</p>
						</div>
						
						<div class="title_right">
							<button type="button" class="applyBtn">신청하기</button>
						</div>
					</div>
					
					<hr>
					
					<div class="content">
						<p>
							스터디 모집글을 아래 양식을 참고해 작성해주세요. 
							꼼꼼히 작성하면 멋진 스터디 팀원을 만나실 수 있을거예요. 
							[개발 스터디 모집 내용 예시] 스터디 주제 : 코딩테스트 준비
							스터디 목표 : 취직 코딩테스트를 위해서 꾸준하게 열심히 하실분 같이 공부해요. 장소는 홍대입구 1번출구 입니다.
						</p>
					</div>
				
				</div>
			
				<div class="replyPart">
					<div class="addReply">
						<p>댓글</p>
						<textarea></textarea>
						<button type="button" class="addReplyBtn">등록</button>
					</div>
					
					<hr>
					
					<div class="replyList">
						<div class="replyItems">
							<p>댓글 5개</p>
							<c:forEach var="i" begin="1" end="5">
								<div class="rContent">
									<div class="replyLeft">
										<p>스터디가 대략 어떻게 진행되나요?</p>
										<p>답글달기</p>
									</div>
									<div class="replyRight">
										<p>2022-07-07 12:12:00</p>
									</div>
								</div>
								<hr>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
</div>

