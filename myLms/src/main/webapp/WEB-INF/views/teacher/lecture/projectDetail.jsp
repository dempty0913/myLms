<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">

.detailProject {
	padding: 30px 80px;
	background: #EAEFF7;
	overflow-y:scroll; height:100vh;
	font-family: 'GmarketSansMedium';
}

.detailContents {
	background: white;
	border-radius: 12px;
	padding: 30px 20px;
}

.title {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 10px 20px;
}

.title .left p:first-child {
	font-size: 28px;
	font-weight: bold;
}

.title .right {
	border: 3px solid red;
	border-radius: 30px;
	padding: 10px 20px;
	font-size: 20px;
	font-weight: bold;
}

.mainContent {
	padding: 20px 20px;
	font-size: 18px;
	height: 60vh;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}

.bottom {
	display: flex;
	justify-content: space-between;
}

.mainContent .submitFile {
	border: 2px solid gray;
	border-radius: 12px;
	padding: 8px 20px;
	display: flex;
	justify-content: space-between;
	width: 70%;
}

.btnList {
	display: flex;
	justify-content: space-between;
	width: 100%;
}

.btnList button {
	padding: 8px 20px;
	font-weight: bold;
	border-radius: 15px;
}

.btnList .btn {
	background: white;
	color: #2F4352;
	border: 2px solid #2F4352;
	margin-right: 10px;
}

.btnList .submitBtn {
	background: #2F4352;
	color: white;
}

.file {
	border: 1px solid lightgray;
	border-radius: 15px;
	padding: 5px 8px;
	color: gray;
	margin-bottom: 12px;
}

.title .clear {
	border: 3px solid blue;
}

.applyList {
	background: white;
	border-radius: 12px;
	padding: 30px 40px;
	margin: 20px 0 80px 0;
	font-size: 18px;
}

.applyList table {
	border-collapse: collapse;
	width: 100%;
	text-align: center;
	margin-top: 10px;
}

.applyList table tr {
	border-bottom: 1px solid gray;
}

.applyList table td {
	padding: 5px 0;
}

.applyTop {
	display: flex;
	justify-content: space-between;
}

.applyTop button {
	border-radius: 8px;
	background: #2F4352;
	color: white;
	padding: 3px 5px; 
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
			if(jqXHR.status===403) {
				login();
				return false;
			}
	    	
			console.log(jqXHR.responseText);
		},
	});
}


function deleteBtn() {
	let lectureNum = $('#deleteBtn').val();
	
	if(confirm("과제를 삭제 하시겠습니까 ? ")) {
		location.href = '${pageContext.request.contextPath}/teacher/lecture/project/delete?projectNum=${dto.projectNum}&lectureNum=${dto.lectureNum}';
	}
}


$(function(){
	$("body").on("click", ".applyBtn", function(){
		listPage();
	});
});

function listPage() {
	let url = "${pageContext.request.contextPath}/teacher/lecture/project/applyList";
	let query = "projectNum=${dto.projectNum}";
	let selector = "#applyList";
	
	const fn = function(data){
		$(selector).html(data);
	};
	ajaxFun(url, "get", query, "html", fn);
}


</script>


		<div class="detailProject">
			<div class="detailContents">
				<div class="title">
					<div class="left">
						<p>${dto.projectSubject}</p>
						<p>${dto.regDate} ~ ${dto.eDate}</p>
					</div>
				</div>
				
				<hr>
				
				<div class="mainContent">
					<div class="content">
						<c:if test="${dto.originalFileName != null}">
							<div class="file">
								<a href="${pageContext.request.contextPath}/teacher/lecture/download?projectNum=${dto.projectNum}">첨부파일 : ${dto.originalFileName}</a>
							</div>
						</c:if>
						<p>${dto.projectContent}</p>
					</div>
					
					<div class="bottom">
						<div class="btnList">
							<p class="btnP">
								<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/teacher/lecture/projectList'">목록</button>
								<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/teacher/lecture/project/update?projectNum=${dto.projectNum}&lectureNum=${dto.lectureNum}'">수정</button>
								<c:if test="${count == 0}">
									<button type="button" class="btn deleteBtn" onclick="deleteBtn();">삭제</button>
								</c:if>
							</p>
							<p>
								<button type="button" class="btn applyBtn">제출된 과제 보기</button>
							</p>
						</div>
					</div>
				</div>
			</div>
			
			
			<div id="applyList">
				
				
				
			</div>
			
		</div>

	</div>
</div>
