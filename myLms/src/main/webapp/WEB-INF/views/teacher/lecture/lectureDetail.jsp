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

.middle {
	background: white;
	border-radius: 8px;
	padding: 10px 20px;
	width: 100%;
	font-size: 20px;
}

.firstLine {
	display: flex;
	justify-content: space-between;
}

.lecInfo {
	font-size: 17px;
	color: gray;
}



.mainLayout {
	background: white;
	border-radius: 8px;
	margin-top: 30px;
	padding: 20px 30px;
}

.mainLayout .smallTitle {
	font-size: 20px;
	margin-bottom: 0;
}

.titlePart {
	display: flex;
	justify-content: space-between;
	padding: 0 10px;
	align-items: center;
	margin-bottom: 17px;
}

.titlePart .addBtn {
	background: #2F4352;
	color: white;
	padding: 5px 20px;
}

.lectureList {
	overflow-y:scroll;
	height: 40vh;
}

.lectureList table {
	border-collapse: collapse;
	width: 100%;
	text-align: center;
}

.lectureList table tr {
	border-bottom: 1px solid gray;
}

.lectureList table td {
	padding: 7px 0;
	border: 1px solid gray;
}

.btn {
	border-radius: 8px;
	border: none;
	padding: 5px 10px;
}

.detailBtn {
	background: #2F4352;
	color: white;
}

.detailBtn:hover {
	color: white;
}


.modal-body {
	display: flex;
	justify-content: space-between;
	height: 200px;
	margin-bottom: 30px;
}

.leftContent p:first-child {
	color: gray;
	font-size: 22px;
}

.leftContent p:nth-child(2) {
	font-size: 35px;
	font-weight: bold;
	margin-bottom: 8px;
}

.leftContent ul {
	font-size: 20px;
}


.rightContent button {
	font-size: 18px;
	padding: 5px 17px;
	border-radius: 12px;
}

.listBtn {
	background: white;
	border: 2px solid #2F4352;
}

.updateBtn {
	background: #2F4352;
	color: white;
}

.updateBtn:hover {
	color: white;
}

.deleteBtn {
	background: white;
	border: 2px solid #2F4352;
}

.goal {
	width: 100%;
}

legend {
	float: none; 
	padding: inherit;
	font-size: 22px;
	font-weight: bold;
}

.page {
	margin-top: 15px;
}


.memInfo {
	border-collapse: collapse;
	text-align: center;
	width: 100%;
}

.memInfo td {
	border: 1px solid gray;
}

</style>
<script type="text/javascript">
function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data) {
			fn(data);
		},
		beforeSend:function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error:function(jqXHR) {
			if(jqXHR.status === 403) {
				login();
				return false;
			} else if(jqXHR.status === 400) {
				alert("?????? ????????? ?????? ????????????.");
				return false;
			}
	    	
			console.log(jqXHR.responseText);
		}
	});
}

$(function(){
	attendanceWrite();
});



function attendanceWrite() {
	let url = "${pageContext.request.contextPath}/teacher/lecture/attendanceWrite";
	let query = "lectureNum=" + ${lectureNum};
	
	const fn = function(data){
		console.log(data);
		
		$(".majorS").text(data.lecDto.major + " ??????");
		$(".yearS").text(data.lecDto.year + " ??? " + data.lecDto.semester + " ?????? ??????");
		$(".timeS").text(data.lecDto.day + " " + data.lecDto.time + " ??????");
		if(data.lecDto.midSDate != null){
			$(".midS").text("???????????? ?????? : " + data.lecDto.midSDate);
		} else {
			$(".midS").text("???????????? ?????? : ??????");
		}
		
		if(data.lecDto.finSDate != null){
			$(".finS").text("???????????? ?????? : " + data.lecDto.finSDate);
		} else {
			$(".finS").text("???????????? ?????? : ??????");
		}
		
		
		for(let i=0; i < data.list.length; i++){
			let name = "lec" + data.list[i].lectureApplyNum + "week" + data.list[i].week;
			
			$("#"+name).text("??????");
		}
	};
	ajaxFun(url, "get", query, "json", fn);
}


function updateLecture() {
	
	location.href = '${pageContext.request.contextPath}/teacher/lecture/update?lectureNum='+${lectureNum};
}

function deleteLecture() {
	
	if(confirm("????????? ?????? ?????????????????? ? ")) {
		location.href = '${pageContext.request.contextPath}/teacher/lecture/delete?lectureNum='+${lectureNum};
	}
}


function memberDetail(lectureApplyNum) {
	let url = "${pageContext.request.contextPath}/teacher/lecture/memberDetail";
	let query = "lectureApplyNum=" + lectureApplyNum;
	
	const fn = function(data){
		console.log(data);
		
		$(".name").text(data.dto.userName);
		$(".tel").text(data.dto.userPhone);
		$(".email").text(data.dto.userEmail);
	};
	ajaxFun(url, "get", query, "json", fn);
}

</script>

		<div class="back">
			<div class="contents">
			
				<div class="title">
					<p>??????</p>
				</div>
				
				<div class="middle">
					<div class="firstLine">
						<p>?????????&nbsp;&nbsp;|&nbsp;&nbsp;${lectureName}</p>
						<div class="btnGroup">
							<button type="button" class="btn listBtn" onclick="location.href='${pageContext.request.contextPath}/teacher/lecture/home'">??????</button>
							<button type="button" class="btn updateBtn" onclick="updateLecture();">??????</button>
							<button type="button" class="btn deleteBtn" onclick="deleteLecture();">??????</button>
						</div>						
					</div>
					
					<div class="lecInfo">
						<p class="majorS"></p>
						<p class="yearS"></p>
						<p class="timeS"></p>
						<p class="midS"></p>
						<p class="finS"></p>
					</div>
				</div>
				
				<div class="mainLayout">
					<div class="titlePart">
						<p class="smallTitle">???????????? ??????</p>
					</div>
					<div class="lectureList">
						<table>
							<tr>
								<td></td>
								<td>??????</td>
								<td>1??????</td>
								<td>2??????</td>
								<td>3??????</td>
								<td>4??????</td>
								<td>5??????</td>
								<td>6??????</td>
								<td>7??????</td>
								<td>8??????</td>
								<td>9??????</td>
								<td>10??????</td>
								<td>11??????</td>
								<td>12??????</td>
								<td>13??????</td>
								<td>14??????</td>
								<td>15??????</td>
							</tr>
							<c:forEach var="li" items="${list}">
								<tr>
									<td><button type="button" class="btn detailBtn" value="${li.lectureApplyNum}"  data-bs-toggle="modal" data-bs-target="#detailModal" onclick="memberDetail(${li.lectureApplyNum});">??????</button></td>
									<td>${li.userName}</td>
									<td id="lec${li.lectureApplyNum}week1"></td>
									<td id="lec${li.lectureApplyNum}week2"></td>
									<td id="lec${li.lectureApplyNum}week3"></td>
									<td id="lec${li.lectureApplyNum}week4"></td>
									<td id="lec${li.lectureApplyNum}week5"></td>
									<td id="lec${li.lectureApplyNum}week6"></td>
									<td id="lec${li.lectureApplyNum}week7"></td>
									<td id="lec${li.lectureApplyNum}week8"></td>
									<td id="lec${li.lectureApplyNum}week9"></td>
									<td id="lec${li.lectureApplyNum}week10"></td>
									<td id="lec${li.lectureApplyNum}week11"></td>
									<td id="lec${li.lectureApplyNum}week12"></td>
									<td id="lec${li.lectureApplyNum}week13"></td>
									<td id="lec${li.lectureApplyNum}week14"></td>
									<td id="lec${li.lectureApplyNum}week15"></td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			
				
			</div>
		</div>

	</div>
</div>

<!-- detail Modal -->
<div class="modal fade" id="detailModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">
    
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">?????? ??????</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      
		<div class="modal-body">
			<table class="memInfo">
				<tr>
					<td width="25%;">??????</td>
					<td class="name"></td>
				</tr>
				<tr>
					<td>????????????</td>
					<td class="tel"></td>
				</tr>
				<tr>
					<td>?????????</td>
					<td class="email"></td>
				</tr>
			</table>
		</div>
     
		<div class="modal-footer">
			<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">??????</button>
		</div>

      
    </div>
  </div>
</div>
