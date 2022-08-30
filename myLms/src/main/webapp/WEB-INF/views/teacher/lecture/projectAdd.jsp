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
	
	$('#year').val(year);
	$('#semester').val(sem);
});


function addProject () {

	let f = document.addForm;
	
	f.action = "${pageContext.request.contextPath}/teacher/lecture/project/${mode}";
    f.submit();
};

$(function(){
	$("#major").val(${lectureNum}).prop("selected", true);
});
</script>


		<div class="back">
			<div class="contents">
				<div class="title">
					<p>과제${mode == "add" ? "등록" : "수정"}</p>
				</div>
				
				<div class="formPart">
					<form name="addForm" method="post" enctype="multipart/form-data">
						<table>
							<tr>
								<td>과제명</td>
								<td colspan="3"><input type="text" id="projectSubject" name="projectSubject" value="${dto.projectSubject}" class="form-control"></td>
							</tr>
							<tr>
								<td>과제 설명</td>
								<td colspan="3"><textarea class="form-control" id="projectContent" name="projectContent">${dto.projectContent}</textarea></td>
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
								<td>마감일</td>
								<td><input type="text" id="eDate" name="eDate" value="${dto.eDate}" class="form-control" placeholder="EX) YYYY-MM-DD"></td>
							</tr>
							<tr>
								<td>첨부파일</td>
								<td colspan="3"><input class="form-control" name="selectFile" multiple="multiple" type="file" id="formFile"></td>
							</tr>
						</table>
						<c:if test="${mode == 'update'}">
							<input type="hidden" name="projectNum" value="${dto.projectNum}">
						</c:if>
						<p class="buttonP"><button type="button" class="addBtn" onclick="addProject();">과제 ${mode == "add" ? "추가" : "수정"}하기</button><button type="button" onclick="location.href='${pageContext.request.contextPath}/teacher/lecture/projectList'">취소</button></p>
					</form>
				</div>
				
				
			</div>
		</div>

	</div>
</div>

