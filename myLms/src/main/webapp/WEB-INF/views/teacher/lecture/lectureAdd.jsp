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
</style>


		<div class="back">
			<div class="contents">
				<div class="title">
					<p>수업추가</p>
				</div>
				
				<div class="formPart">
					<form name="addForm" method="post">
						<table>
							<tr>
								<td>수업명</td>
								<td colspan="3"><input type="text" class="form-control"></td>
							</tr>
							<tr>
								<td>수업목표</td>
								<td colspan="3"><textarea class="form-control"></textarea></td>
							</tr>
							<tr>
								<td>전공</td>
								<td>
									<select class="form-select">
										<option>::선택::</option>
										<option>글로벌비즈니스</option>
										<option>광고홍보콘텐츠</option>
										<option>공공인재</option>
										<option>경영</option>
										<option>아동</option>
										<option>군사</option>
										<option>금융정보공학</option>
										<option>전자공학</option>
										<option>컴퓨터공학</option>
										<option>소프트웨어</option>
										<option>나노화학생명</option>
										<option>물류시스템공학</option>
										<option>도시공학</option>
										<option>토목건축공학</option>
										<option>공연예술</option>
										<option>음악</option>
										<option>실용음악</option>
										<option>무용예술</option>
										<option>디자인</option>
										<option>영화영상</option>
										<option>미용예술</option>
									</select>
								</td>
								<td>년도 / 학기</td>
								<td>2022년 2학기</td>
							</tr>
							<tr>
								<td>요일</td>
								<td>
									<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"><label class="form-check-label" for="flexCheckDefault">월</label>
									<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"><label class="form-check-label" for="flexCheckDefault">화</label>
									<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"><label class="form-check-label" for="flexCheckDefault">수</label>
									<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"><label class="form-check-label" for="flexCheckDefault">목</label>
									<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"><label class="form-check-label" for="flexCheckDefault">금</label>
								</td>
								<td>교시</td>
								<td>
									<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"><label class="form-check-label" for="flexCheckDefault">21</label>
									<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"><label class="form-check-label" for="flexCheckDefault">22</label>
									<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"><label class="form-check-label" for="flexCheckDefault">23</label>
									<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"><label class="form-check-label" for="flexCheckDefault">24</label>
									<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"><label class="form-check-label" for="flexCheckDefault">25</label>
									<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"><label class="form-check-label" for="flexCheckDefault">26</label>
								</td>
							</tr>
							<tr>
								<td>중간고사 날짜</td>
								<td><input type="text" class="form-control" placeholder="ex) YYYY/MM/DD"></td>
								<td>기말고사 날짜</td>
								<td><input type="text" class="form-control" placeholder="ex) YYYY/MM/DD"></td>
							</tr>
							<tr>
								<td>수업계획서</td>
								<td colspan="3"><input class="form-control" type="file" id="formFile"></td>
							</tr>
						</table>
						
						<p class="buttonP"><button type="button" class="addBtn">수업 추가하기</button><button type="button" onclick="location.href='${pageContext.request.contextPath}/teacher/lecture/home'">취소</button></p>
					</form>
				</div>
				
				
			</div>
		</div>

	</div>
</div>

