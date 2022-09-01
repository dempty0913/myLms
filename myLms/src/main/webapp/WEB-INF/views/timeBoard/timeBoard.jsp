<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">

.contents {
	background: #EAEFF7;
	overflow-y:scroll; height:100vh;
	font-family: 'GmarketSansMedium';
	padding: 50px 100px;
}

.tMain {
	background: white;
	border-radius: 8px;
	padding: 30px 20px;
}

.top {
	margin-bottom: 25px;
}

.top .title {
	font-size: 30px;
	font-weight: bold;
	margin-bottom: 20px;
	font-family: 'Cafe24Ssurround';
	color: #2F4352;
}

table {
	border-collapse: collapse;
	border: 1px solid lightgray;
	width: 100%;
	text-align: center;
	font-size: 16px;
	height: 60vh;
	color: #2F4352;
}

table tr {
	border: 1px solid lightgray;
}


table td {
	border: 1px solid lightgray;
}

table td:nth-child(6n+1) {
	padding-top: 5px; 
}

</style>

<script type="text/javascript">

$(function(){
	let timeStr, dayStr;
	let time, day;
	<c:forEach var="tm" items="${list}">
		timeStr = "${tm.time}";
		dayStr = "${tm.day}";
		dayStr = dayStr.replace("월", "mon");
		dayStr = dayStr.replace("화", "tue");
		dayStr = dayStr.replace("수", "wed");
		dayStr = dayStr.replace("목", "thr");
		dayStr = dayStr.replace("금", "fri");
		time = timeStr.split(",");
		day = dayStr.split(",");
		for(let i=0; i<day.length; i++){
			for(let j=0; j<time.length; j++){
				$("."+ time[j] + "." + day[i]).text("${tm.lectureName}");
				console.log("."+ time[j] + "." + day[i]);
			}
		}
	</c:forEach>
});

</script>

		
		<div class="contents">
			<div class="tMain">
				<div class="top">
					<div class="title">
						<p>${year} - ${semester}학기 시간표</p>
					</div>
				</div>
				
				<div class="board">
					<table>
						<tr height="10%">
							<td width="10%"></td>
							<td width="18%">월</td>
							<td width="18%">화</td>
							<td width="18%">수</td>
							<td width="18%">목</td>
							<td width="18%">금</td>
						</tr>
						<tr>
							<td>21교시</td>
							<td class="21 mon"></td>
							<td class="21 tue"></td>
							<td class="21 wed"></td>
							<td class="21 thr"></td>
							<td class="21 fri"></td>
						</tr>
						<tr>
							<td>22교시</td>
							<td class="22 mon"></td>
							<td class="22 tue"></td>
							<td class="22 wed"></td>
							<td class="22 thr"></td>
							<td class="22 fri"></td>
						</tr>
						<tr>
							<td>23교시</td>
							<td class="23 mon"></td>
							<td class="23 tue"></td>
							<td class="23 wed"></td>
							<td class="23 thr"></td>
							<td class="23 fri"></td>
						</tr>
						<tr>
							<td>24교시</td>
							<td class="24 mon"></td>
							<td class="24 tue"></td>
							<td class="24 wed"></td>
							<td class="24 thr"></td>
							<td class="24 fri"></td>
						</tr>
						<tr>
							<td>25교시</td>
							<td class="25 mon"></td>
							<td class="25 tue"></td>
							<td class="25 wed"></td>
							<td class="25 thr"></td>
							<td class="25 fri"></td>
						</tr>
						<tr>
							<td>26교시</td>
							<td class="26 mon"></td>
							<td class="26 tue"></td>
							<td class="26 wed"></td>
							<td class="26 thr"></td>
							<td class="26 fri"></td>
						</tr>
					</table>
				</div>
			</div>
		</div>	

	</div>
</div>
