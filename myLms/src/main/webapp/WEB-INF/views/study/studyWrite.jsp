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

textarea {
	height: 300px;
}

</style>
<script type="text/javascript">
function addReview () {
	let f = document.addForm;
	
	f.action = "${pageContext.request.contextPath}/study/${mode}";
    f.submit();
};
</script>


		<div class="back">
			<div class="contents">
				<div class="title">
					<p>스터디${mode == "add" ? "모집" : "수정"}</p>
				</div>
				
				<div class="formPart">
					<form name="addForm" method="post">
						<table>
							<tr>
								<td>제목</td>
								<td colspan="3"><input type="text" id="subject" name="subject" value="${dto.subject}" class="form-control"></td>
							</tr>
							<tr>
								<td>내용</td>
								<td colspan="3"><textarea class="form-control" id="content" name="content">${dto.content}</textarea></td>
							</tr>
						</table>
						<c:if test="${mode == 'update'}">
							<input type="hidden" name="studyNum" value="${dto.studyNum}">
						</c:if>
						<input type="hidden" name="userId" value="${sessionScope.member.userId}">
						<p class="buttonP"><button type="button" class="addBtn" onclick="addReview();">글 ${mode == "add" ? "등록" : "수정"}하기</button><button type="button" onclick="location.href='${pageContext.request.contextPath}/study/home'">취소</button></p>
					</form>
				</div>
				
				
			</div>
		</div>

	</div>
</div>

