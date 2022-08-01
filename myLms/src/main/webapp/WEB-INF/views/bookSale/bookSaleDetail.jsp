<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
.bookSaleDetail {
	background: #EAEFF7;
	overflow-y:scroll; height:100vh;
	font-family: 'GmarketSansMedium';
}

.mainContent {
	padding: 50px 100px;
	margin-bottom: 50px;
}

.saleContent {
	background: white; 
	padding: 25px 35px;
}

.bookTitle {
	font-size: 28px;
	margin-bottom: 20px;
	padding: 0 10px;
}

.contentAll {
	display: flex;
	padding: 20px 10px;
}

.contentAll .contentLeft {
	width: 45%;
	border-right: 2px solid lightgray;
	display: flex;
	justify-content: center;
}

.contentAll .contentLeft img {
	height: 330px;
}

.contentAll .contentRight {
	width: 50%;
	font-size: 18px;
	margin-left: 25px;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}

.bookInfo p {
	margin-bottom: 8px;
}

.contentAll .contentRight .regDate {
	text-align: right;
	color: gray;
	font-size: 15px;
}

.replyContent {
	background: white;
	margin-top: 30px;
	padding: 30px 20px;
}

.replyContent .smallTitle {
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


		<div class="bookSaleDetail">
			<div class="mainContent">
				<div class="saleContent">
					<div class="bookTitle">
						<p>쉽게 배우는 자바 판매합니다.</p>
					</div>
					
					<div class="contentAll">
						<div class="contentLeft">
							<img src="https://media.bunjang.co.kr/product/145776295_1_1630498694_w360.jpg" alt="...">
						</div>
						<div class="contentRight">
							<div class="bookInfo">
								<p>수업명 : 자바 프로그래밍</p>
								<p>전공 : 컴퓨터공학</p>
								<p>교수 : 김자바</p>
								<p>자바 프로그래밍 수업에서 사용한 쉽게 배우는 자바 책입니다. 필기는 책에 안해서 깨끗합니다. </p>
							</div>
							
							<div class="regDate">
								<p>2022-07-07 작성</p>
							</div>
						</div>
					</div>
				</div>	
				
				<div class="replyContent">
					<p class="smallTitle">댓글 5개</p>
					<c:forEach var="i" begin="1" end="5">
						<div class="rContent">
							<div class="replyLeft">
								<p>책 구매 가능할까요?</p>
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

</body>
</html>