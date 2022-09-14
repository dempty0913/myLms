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
	$("input:radio[name='testLevel']:radio[value='${myRev.testLevel}']").prop('checked', true);
	$("input:radio[name='projectLevel']:radio[value='${myRev.projectLevel}']").prop('checked', true);
});

function addReview () {
	let f = document.addForm;
	
	f.action = "${pageContext.request.contextPath}/review/${mode}";
    f.submit();
};
</script>


		<div class="back">
			<div class="contents">
				<div class="title">
					<p>후기${mode == "add" ? "작성" : "수정"}</p>
				</div>
				
				<div class="formPart">
					<form name="addForm" method="post">
						<table>
							<tr>
								<td>수업명</td>
								<td colspan="3">${dto.lectureName}</td>
							</tr>
							<tr>
								<td>전공</td>
								<td>${dto.major}</td>
								<td>년도 / 학기</td>
								<td>${dto.year}년 &nbsp;${dto.semester}학기</td>
							</tr>
							<tr>
								<td>시험 난이도</td>
								<td>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="testLevel" id="inlineRadio1" value="상">
										<label class="form-check-label" for="inlineRadio1">상</label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="testLevel" id="inlineRadio2" value="중">
										<label class="form-check-label" for="inlineRadio2">중</label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="testLevel" id="inlineRadio3" value="하">
										<label class="form-check-label" for="inlineRadio3">하</label>
									</div>
								</td>
								<td>과제 난이도</td>
								<td>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="projectLevel" id="inlineRadio1" value="상">
										<label class="form-check-label" for="inlineRadio1">상</label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="projectLevel" id="inlineRadio2" value="중">
										<label class="form-check-label" for="inlineRadio2">중</label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="projectLevel" id="inlineRadio3" value="하">
										<label class="form-check-label" for="inlineRadio3">하</label>
									</div>
								</td>
							</tr>
							<tr>
								<td>내용</td>
								<td colspan="3"><textarea class="form-control" id="lectureInfo" name="content">${myRev.content}</textarea></td>
							</tr>
						</table>
						<c:if test="${mode == 'update'}">
							<input type="hidden" name="lectureReviewNum" value="${myRev.lectureReviewNum}">
						</c:if>
						<input type="hidden" name="lectureNum" value="${dto.lectureNum}">
						<input type="hidden" name="lectureApplyNum" value="${dto.lectureApplyNum}">
						<p class="buttonP"><button type="button" class="addBtn" onclick="addReview();">후기 ${mode == "add" ? "등록" : "수정"}하기</button><button type="button" onclick="location.href='${pageContext.request.contextPath}/review/detail?lectureNum=${dto.lectureNum}'">취소</button></p>
					</form>
				</div>
				
				
			</div>
		</div>

	</div>
</div>

