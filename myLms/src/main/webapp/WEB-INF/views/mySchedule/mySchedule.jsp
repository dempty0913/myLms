<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
.myCalendar {
	background: #EAEFF7;
	overflow-y:scroll; height:100vh;
	font-family: 'GmarketSansMedium';
}

.contents {
	padding: 30px 100px;
	margin-bottom: 50px;
}

.calendarTitle {
	font-size: 35px;
	font-weight: bold;
	margin-bottom: 20px;
	font-family: 'Cafe24Ssurround';
	color: #2F4352;
}

#calendar {
	background: white;
	padding: 30px 20px;
	border-radius: 12px;
}
</style>




		<div class="myCalendar">
			<div class="contents">
				<div id="calendar"></div>
			</div>
		</div>

	</div>
</div>

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

var calendar = null;
document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
	calendar = new FullCalendar.Calendar(calendarEl, {
		initialView: 'dayGridMonth',
		locale: 'ko',
		selectable: false,
		events : function(info, successCallback, failureCallback) {
				
			let url = "${pageContext.request.contextPath}/mySchedule/list";
			let startDay = info.startStr.substr(0, 10);
			let endDay = info.endStr.substr(0, 10);
			let query = "sDate="+startDay+"&eDate="+endDay;
			
			var fn = function(data){
				let arrayEvents = [];
				for(let i=0; i<data.list.length; i++){
					let item = data.list[i];
					let obj = {};
					if(item.type == 1){
						obj.title = item.subject + " 시험";
					} else {
						obj.title = item.subject + "(" + item.lectureName + ")  과제 제출";
					}
					obj.start = item.sDate;
					if(item.eDate != null){
						obj.end = item.eDate;
					} else {
						obj.end = item.sDate;
					}
					obj.color = item.color;
					obj.allDay = true;
										
					arrayEvents.push(obj);
				}
				successCallback(arrayEvents);
			};
			
			ajaxFun(url, "get", query, "json", fn);
		}
	});
	calendar.render();
});



</script>

