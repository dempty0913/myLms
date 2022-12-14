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

.formPart {
	background: white;
	border-radius: 8px;
	width: 100%;
	padding: 40px 60px;
}

.formPart table {
	border-collapse: collapse;
	width: 100%;
	margin-bottom: 15px;
}

.formPart table td {
	padding: 6px 15px;
}

.formPart table td:nth-child(2n+1) {
	border-right: 1px solid gray;
}

.formPart button {
	background: white;
	border: 3px solid #2F4352;
	border-radius: 8px;
	padding: 8px 15px;
}

.formPart button:first-child {
	margin-right: 8px;
}

.buttonP {
	text-align: center;
}

#year {
	width: 100px;
	text-align: center;
	border: 1px solid lightgray;
	border-radius: 8px;
}

#semester {
	width: 100px;
	text-align: center;
	border: 1px solid lightgray;
	border-radius: 8px;
}

.lectureVideo {
	height: 400px;
	padding: 10px 15px;
}

</style>
<script type="text/javascript">

$(function(){
	let vid = document.getElementById("lectureVideo");
	let time;
	$('#listBtn').click(function(){
		saveTime = vid.currentTime;
		location.href='${pageContext.request.contextPath}/dashBoard/detail?mode=1&lectureNum=${dto.lectureNum}&lectureApplyNum=${lectureApplyNum}&videoFileNum=${videoFileNum}&saveTime='+saveTime;
	});
});


</script>


		<div class="back">
			<div class="contents">
				<div class="title">
					<p>강의</p>
				</div>
				
				<div class="formPart">
					<table>
						<tr>
							<td>제목</td>
							<td colspan="3">${dto.videoName}</td>
						</tr>
						<tr>
							<td>등록일</td>
							<td>
								<p>${dto.regDate}</p>
							</td>
						</tr>
						<tr>
							<td>강의</td>
							<td colspan="3"><video id="lectureVideo" class="lectureVideo form-control" src="${pageContext.request.contextPath}/uploads/video/${dto.videoFileName}" id="lvideo" controls="controls"></video></td>
						</tr>
						<tr>
					</table>

					<p class="buttonP"><button type="button" id="listBtn" onclick="">목록</button></p>
				</div>
				
				
			</div>
		</div>

	</div>
</div>

