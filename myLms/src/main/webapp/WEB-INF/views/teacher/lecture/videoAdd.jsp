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




function addLecture () {
	let f = document.videoForm;
	let str;
	
	if("${mode}" == "add"){
		str = "videoAdd";
	} else {
		str = "videoUpdate";
	}
	
	f.action = "${pageContext.request.contextPath}/teacher/lecture/"+str;
    f.submit();
};




window.addEventListener("load", function(){
	const inputFileEl = document.querySelector("form input[name=videoSelectFile]");
	const inputTimeEl = document.querySelector("form input[name=videoTotalTime]");
	const videoEl = document.getElementById("lvideo");
	
	inputFileEl.addEventListener("change", function(){
		const file = inputFileEl.files[0];
		if(! file) {
			return;
		}
		const videoUrl = URL.createObjectURL(file);
		videoEl.setAttribute("src", videoUrl);
		  
		videoEl.onloadedmetadata = function() {
			const secondsNumber = parseFloat(videoEl.duration);
			let hours = Math.floor(secondsNumber / 3600);
			let minutes = Math.floor((secondsNumber - hours * 3600) / 60);
			let seconds = secondsNumber - hours * 3600 - minutes * 60;
			  
			inputTimeEl.value = secondsNumber;
		};
	});
});

$(function(){
	$("#major").val(${lectureNum}).prop("selected", true);
});

</script>


		<div class="back">
			<div class="contents">
				<div class="title">
					<p>영상 ${mode == "add" ? "업로드" : "수정"}</p>
				</div>
				
				<div class="formPart">
					<form name="videoForm" method="post" enctype="multipart/form-data">
						<table>
							<tr>
								<td>강의명</td>
								<td colspan="3"><input type="text" id="videoName" name="videoName" value="${dto.videoName}" class="form-control"></td>
							</tr>
							<tr>
								<td>수업</td>
								<td>
									<select class="form-select" id="major" name="lectureNum">
										<c:forEach var="li" items="${list}">
											<option value="${li.lectureNum}">${li.lectureName}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td>영상 등록</td>
								<td colspan="3"><input type="file" name="videoSelectFile" class="form-control" accept="video/*"></td>
							</tr>
							<tr>
								<td>미리보기</td>
								<td colspan="3"><video class="lectureVideo form-control" src="" id="lvideo" controls="controls"></video></td>
							</tr>
							<tr>
								<td>영상 길이</td>
								<td colspan="3"><input type="text" class="form-control" id="videoTotalTime" name="videoTotalTime" readonly="readonly" placeholder="영상 길이"></td>
							</tr>
						</table>
						<c:if test="${mode == 'update'}">
							<input type="hidden" name="videoFileNum" value="${videoFileNum}">
						</c:if>
						<p class="buttonP"><button type="button" class="addBtn" onclick="addLecture();">강의 ${mode == "add" ? "업로드" : "수정"}하기</button><button type="button" onclick="location.href='${pageContext.request.contextPath}/teacher/lecture/videoList'">취소</button></p>
					</form>
				</div>
				
				
			</div>
		</div>

	</div>
</div>

