<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
.back {
	overflow-y:scroll; height:100vh;
	font-family: 'GmarketSansMedium';
}

.top {
	width: 100%;
	padding: 30px 80px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	background: #4D565E;
	color: white;
}

.top p:first-child {
	font-size: 22px;
	font-weight: bold;
}

.topBottom {
	display: flex;
	justify-content: space-between;
}

.topBottom p:first-child {
	font-size: 40px;
	font-family: 'Do Hyeon', sans-serif;
}

.topBottom p:nth-child(2) {
	font-size: 28px;	
	font-family: 'Do Hyeon', sans-serif;
}

.list-group {
	width: 20%;
}

.nav-tabs {
	margin: 30px 80px;
}

.nav-item {
	width: 50%;
	text-align: center;
	font-size: 18px;
	font-weight: bold;
}

.videoList {
	margin: 30px 100px;
}

.video {
	width: 100%;
	text-align: center;
	border-collapse: collapse;
	font-size: 18px;
}

.video tr {
	border-bottom: 1px solid black;
}

.video td {
	padding: 8px 0;
}

.video thead {
	color: gray;
	font-weight: bold;
}

.watchBtn {
	background: #2F4352;
	color: white;
	border-radius: 4px;
	padding: 0 12px;
}

.page {
	margin-top: 20px;
}

.accordion-body .accordion-unit {
	display: flex;
	justify-content: space-between;
	padding: 10px 20px;
}


.checkPart {
	margin: 30px 100px;
}

.attCheck {
	border-collapse: collapse;
	width: 100%;
}

.attCheck td {
	border: 1px solid lightgray;
	padding: 5px 8px;
}

.attCheck tr {
	height: 30px;
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
				alert("요청 처리가 실패 했습니다.");
				return false;
			}
	    	
			console.log(jqXHR.responseText);
		}
	});
}

$(function(){
	attendanceCheck();
	listPage(1);
});

function listPage(page) {
	let url, query, selector;
	if(${mode == 1}){
		url = "${pageContext.request.contextPath}/dashBoard/videoList";
		query = "lectureNum=${dto.lectureNum}&lectureApplyNum=${lectureApplyNum}";
		selector = ".detailList";
	} else {
		url = "${pageContext.request.contextPath}/dashBoard/projectList";
		query = "lectureNum=${dto.lectureNum}&lectureApplyNum=${lectureApplyNum}";
		selector = ".detailList";
	}
	
	const fn = function(data){
		$(selector).html(data);
	};
	ajaxFun(url, "get", query, "html", fn);
}

function attendanceCheck() {
	let url = "${pageContext.request.contextPath}/dashBoard/checkList";
	let query = "lectureApplyNum=" + ${lectureApplyNum};
	let selector = ".checkPart";
	
	const fn = function(data){
		$(selector).html(data);
		
		attendanceWrite();
	};
	ajaxFun(url, "get", query, "html", fn);
}

function attendanceWrite() {
	let url = "${pageContext.request.contextPath}/dashBoard/checkWrite";
	let query = "lectureApplyNum=" + ${lectureApplyNum};
	
	const fn = function(data){
		console.log(data);
		for(let i=0; i < data.list.length; i++){
			let name = "week" + data.list[i].week;
			console.log(name);
			
			$("#"+name).text("출석");
		}
	};
	ajaxFun(url, "get", query, "json", fn);
}



</script>


		<div class="back">
			<div class="lecture">
			
				<div class="top">
					<p>${dto.year} - ${dto.semester}학기</p>
					<div class="topBottom">
						<p>${dto.lectureName}</p>
						<p>${dto.userName} 교수</p>
					</div>
				</div>
				
			</div>
			
			
			<div class="checkPart">
				
			</div>
			
			
			<div class="detailList">
				
			</div>
		</div>

	</div>
</div>

