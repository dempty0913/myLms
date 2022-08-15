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

$(function() {
	let daysStr = "${dto.day}";
	let days = daysStr.split(',');
	
	for(let d in days){
		$("input:checkbox[name='days'][value="+days[d]+"]").prop("checked", true);
	}
	
	let timesStr = "${dto.time}";
	let times = timesStr.split(',');
	
	for(let t in times){
		$("input:checkbox[name='times'][value="+times[t]+"]").prop("checked", true);
	}
	
	let major = "${dto.major}";
	$("#major").val(major).prop("selected", true);
	
});

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
	
	f.action = "${pageContext.request.contextPath}/teacher/lecture/${mode}";
    f.submit();
};
</script>


		<div class="back">
			<div class="contents">
				<div class="title">
					<p>수업${mode == "add" ? "추가" : "수정"}</p>
				</div>
				
				<div class="formPart">
					<form name="addForm" method="post">
						<table>
							<tr>
								<td>수업명</td>
								<td colspan="3"><input type="text" id="lectureName" name="lectureName" value="${dto.lectureName}" class="form-control"></td>
							</tr>
							<tr>
								<td>수업목표</td>
								<td colspan="3"><textarea class="form-control" id="lectureInfo" name="lectureInfo">${dto.lectureInfo}</textarea></td>
							</tr>
							<tr>
								<td>전공</td>
								<td>
									<select class="form-select" id="major" name="major">
										<option value="글로벌비즈니스">글로벌비즈니스</option>
										<option value="광고홍보콘텐츠">광고홍보콘텐츠</option>
										<option value="공공인재">공공인재</option>
										<option value="경영">경영</option>
										<option value="아동">아동</option>
										<option value="군사">군사</option>
										<option value="금융정보공학">금융정보공학</option>
										<option value="전자공학">전자공학</option>
										<option value="컴퓨터공학">컴퓨터공학</option>
										<option value="소프트웨어">소프트웨어</option>
										<option value="나노화학생명">나노화학생명</option>
										<option value="물류시스템공학">물류시스템공학</option>
										<option value="도시공학">도시공학</option>
										<option value="토목건축공학">토목건축공학</option>
										<option value="공연예술">공연예술</option>
										<option value="음악">음악</option>
										<option value="실용음악">실용음악</option>
										<option value="무용예술">무용예술</option>
										<option value="디자인">디자인</option>
										<option value="영화영상">영화영상</option>
										<option value="미용예술">미용예술</option>
									</select>
								</td>
								<td>년도 / 학기</td>
								<td><input type="text" name="year" id="year" value="${dto.year}" readonly="readonly">&nbsp;년&nbsp;&nbsp;<input type="text" id="semester" name="semester" value="${dto.semester}" readonly="readonly">&nbsp;학기</td>
							</tr>
							<tr>
								<td>요일</td>
								<td>
									<input class="form-check-input day" type="checkbox" name="days" value="월" ><label class="form-check-label">&nbsp;월</label>
									<input class="form-check-input day" type="checkbox" name="days" value="화"><label class="form-check-label">&nbsp;화</label>
									<input class="form-check-input day" type="checkbox" name="days" value="수"><label class="form-check-label">&nbsp;수</label>
									<input class="form-check-input day" type="checkbox" name="days" value="목"><label class="form-check-label">&nbsp;목</label>
									<input class="form-check-input day" type="checkbox" name="days" value="금"><label class="form-check-label">&nbsp;금</label>
								</td>
								<td>교시</td>
								<td>
									<input class="form-check-input time" type="checkbox" name="times" value="21"><label class="form-check-label">&nbsp;21</label>
									<input class="form-check-input time" type="checkbox" name="times" value="22"><label class="form-check-label">&nbsp;22</label>
									<input class="form-check-input time" type="checkbox" name="times" value="23"><label class="form-check-label">&nbsp;23</label>
									<input class="form-check-input time" type="checkbox" name="times" value="24"><label class="form-check-label">&nbsp;24</label>
									<input class="form-check-input time" type="checkbox" name="times" value="25"><label class="form-check-label">&nbsp;25</label>
									<input class="form-check-input time" type="checkbox" name="times" value="26"><label class="form-check-label">&nbsp;26</label>
								</td>
							</tr>
							<tr>
								<td>중간고사 날짜</td>
								<td><input type="text" value="${dto.midSDate}" class="form-control" id="midSDate" name="midSDate" placeholder="ex) YYYY/MM/DD"></td>
								<td>기말고사 날짜</td>
								<td><input type="text" value="${dto.finSDate}" class="form-control" id="finSDate" name="finSDate" placeholder="ex) YYYY/MM/DD"></td>
							</tr>
							<tr>
								<td>수업계획서</td>
								<td colspan="3"><input class="form-control" name="selectFile" type="file" id="formFile"></td>
							</tr>
						</table>
						<c:if test="${mode == 'update'}">
							<input type="hidden" name="lectureNum" value="${dto.lectureNum}">
						</c:if>
						<p class="buttonP"><button type="button" class="addBtn" onclick="addLecture();">수업 ${mode == "add" ? "추가" : "수정"}하기</button><button type="button" onclick="location.href='${pageContext.request.contextPath}/teacher/lecture/home'">취소</button></p>
					</form>
				</div>
				
				
			</div>
		</div>

	</div>
</div>

