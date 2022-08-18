<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
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
	listPage(1);
});

function listPage(page) {
	let url = "${pageContext.request.contextPath}/dashBoard/videoList";
	let query = "lectureNum=${dto.lectureNum}";
	let selector = ".detailList";
	
	const fn = function(data){
		$(selector).html(data);
	};
	ajaxFun(url, "get", query, "html", fn);
}

</script>


		
		<div class="lecture">
			<div class="top">
				<p>${dto.year} - ${dto.semester}학기</p>
				<div class="topBottom">
					<p>${dto.lectureName}</p>
					<p>${dto.userName} 교수</p>
				</div>
			</div>
			
		</div>
		
		<div class="detailList">
			
		</div>

	</div>
</div>

