<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">

.dashContents {
	background: #EAEFF7;
	font-family: 'GmarketSansMedium';
	height:100vh;
}

.topText {
	font-size: 26px;
	margin-bottom: 20px;
	font-weight: bold;
	font-family: 'Cafe24Ssurround';
	color: #2F4352;
}

.dashBoard {
	padding: 30px 100px;
}

.dashBoard .card {
	border-radius: 15px;
	border: none;
	box-shadow: 0px 0px 10px #8198A8;
	cursor: pointer;
}

.dashBoard .card .card-header {
	background: #DAE1E6;
	border-radius: 15px 15px 0 0;
	color: #72808C;
	display: flex;
	justify-content: space-between;
	align-items: center;
	font-size: 17px;
}

.dashBoard .card .card-header a {
	color: #72808C;
	text-decoration: none;
}

.dashBoard .card .card-header a:hover {
	color: blue;
}

.dashBoard .card .card-header i {
	font-size: 20px;
}

.dashBoard .card .card-body p:nth-child(1) {
	font-weight: bold;
	font-size: 25px;
	color: #2F4352;
}

.dashBoard .card .card-body p:nth-child(2) {
	font-size: 17px;
}

.page {
	margin-top: 20px;
}

</style>
<script type="text/javascript">
$(function() {
	const now = new Date();
	const year = now.getFullYear();
	const month = now.getMonth() + 1;
	
	if(month == 13) {
		month = 1;
	}
	
	let sem;
	
	if(month >= 2 && month <8) {
		sem = 1;
	} else {
		sem = 2;
	}
	
	let str = year + " - " + sem + "학기 수업";
	$('#yearS').text(str);
});


function detailDash(lectureNum, lectureApplyNum) {
	
	location.href = "${pageContext.request.contextPath}/dashBoard/detail?mode=1&lectureNum="+lectureNum+"&lectureApplyNum="+lectureApplyNum;
}

</script>

		<div class="dashContents">
			<div class="dashBoard">
				<div class="topText">
					<p id="yearS"></p>
				</div>
				
				<div class="row row-cols-1 row-cols-md-3 g-5">
					<c:forEach var="li" items="${list}">
						<div class="col">
							<div class="card h-100" onclick="detailDash('${li.lectureNum}', '${li.lectureApplyNum}');">
								<div class="card-header">
									<p>${li.major}</p>
									<a href="${pageContext.request.contextPath}/dashBoard/delete?lectureApplyNum=${li.lectureApplyNum}"><i class="fa-regular fa-circle-xmark"></i></a>
								</div>
								<div class="card-body py-4">
									<p>${li.lectureName}</p>
									<p>${li.userName} 교수</p>
									<p>${li.day} / ${li.time} 교시</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			
			<div class="page">
				${dataCount == 0 ? "" : paging}
			</div>
		</div>

	</div>
</div>
