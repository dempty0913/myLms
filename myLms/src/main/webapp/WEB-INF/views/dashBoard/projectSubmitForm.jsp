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

</style>
<script type="text/javascript">

function addLecture () {
	/*
	let days = [];
	$('input:checkbox[name=day]:checked').each(function () {
	    days.push($(this).val());
	});
	let day = days.join(',');
	console.log(day);
	*/
	
	let f = document.addForm;
	let str;
	if("${mode}" == "submit"){
		str = "projectSubmit";
	} else {
		str = "projectUpdate";
	}
	f.action = "${pageContext.request.contextPath}/dashBoard/"+str;
    f.submit();
};
</script>


		<div class="back">
			<div class="contents">
				<div class="title">
					<p>과제 제출</p>
				</div>
				
				<div class="formPart">
					<form name="addForm" method="post" enctype="multipart/form-data">
						<table>
							<tr>
								<td>과제명</td>
								<td colspan="3">${dto.projectSubject}</td>
							</tr>
							<tr>
								<td>과제내용</td>
								<td colspan="3">${dto.projectContent}</td>
							</tr>
							<tr>
								<td>과제 첨부</td>
								<td colspan="3"><input class="form-control" name="selectFile" type="file" id="formFile"></td>
							</tr>
						</table>
						<input type="hidden" name="lectureNum" value="${dto.lectureNum}">
						<input type="hidden" name="lectureApplyNum" value="${lectureApplyNum}">
						<input type="hidden" name="projectNum" value="${projectNum}">
						<input type="hidden" name="submitNum" value="${dto.submitNum}">
						<p class="buttonP"><button type="button" class="addBtn" onclick="addLecture();">과제 제출</button><button type="button" onclick="location.href='${pageContext.request.contextPath}/dashBoard/projectDetail?projectNum=${projectNum}&lectureNum=${lectureNum}&lectureApplyNum=${lectureApplyNum}'">취소</button></p>
					</form>
				</div>
				
				
			</div>
		</div>

	</div>
</div>

