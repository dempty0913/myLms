<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
.studyDetail {
	background: #EAEFF7;
	overflow-y:scroll; height:100vh;
	font-family: 'GmarketSansMedium';
}

.contents {
	padding: 30px 100px;
	margin-bottom: 50px;
}

.studyContent {
	background: white; 
	padding: 30px 45px;
}

.title {
	margin-bottom: 25px;
	padding: 0 15px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.title .regDate {
	color: gray;
}


.title_top {
	display: flex;
	margin-bottom: 5px;
	align-items: center;
}

.title_top p {
	font-size: 22px;
}

.mark_ing {
	width: 47px;
	height: 25px;
	background: #0d6efd;
	color: white;
	font-size: 13px;
	font-weight: bold;
	text-align: center;
	margin-right: 8px;
	line-height: 25px;
}

.mark_finsh {
	width: 57px;
	height: 25px;
	background: lightgray;
	color: white;
	font-size: 13px;
	font-weight: bold;
	text-align: center;
	margin-right: 8px;
	line-height: 25px;
}

.content {
	margin-top: 25px;
	font-size: 17px;
	padding: 0 15px;
}

.title_right {
	display: flex;
}

.applyBtn {
	width: 11%;
	background: #2F4352;
	color: white;
	border-radius: 4px;
	padding: 5px 10px;
	width: 150px;
}

.listBtn {
	width: 7%;
	background: white;
	color: #2F4352;
	border-radius: 4px;
	padding: 5px 10px;
	width: 150px;
	margin-right: 5px;
}

.updDel {
	width: 150px;
	display: flex;
}

.updateBtn {
	background: blue;
	color: white;
	border-radius: 4px;
	padding: 5px 10px;
	width: 48%;
	margin-right: 5px;
	border: 1px solid blue;
}

.deleteBtn {
	background: red;
	color: white;
	border-radius: 4px;
	padding: 5px 10px;
	width: 48%;
	border: 1px solid red;
}


.replyPart {
	background: white; 
	padding: 30px 45px;
	margin-top: 25px;
}

.replyPart .addReply {
	display: flex;
	align-items: center;
	margin-bottom: 30px;
}

.replyPart .addReply p {
	margin-right: 15px;
}

.replyPart .addReply textarea {
	width: 80%;
	margin-right: 15px;
	resize: none;
	border: 2px solid lightgray;
	border-radius: 8px;
}

.replyPart .addReply .addReplyBtn {
	background: #2F4352;
	color: white;
	border-radius: 4px;
	padding: 5px 10px;
	width: 130px;
}

.replyItems {
	background: white;
	margin-top: 20px;
	padding: 10px 20px;
}

.replyItems .smallTitle {
	font-size: 20px;
	margin-bottom: 20px;
}

.rContent {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 15px 20px;
}

.replyLeft p:first-child {
	font-size: 17px;
	margin-bottom: 6px;
}

.replyLeft p:nth-child(2) {
	font-size: 14px;
	color: gray;
	text-decoration: underline;
}

.replyRight {
	font-size: 15px;
	color: gray;
}

.replyList {
	padding: 20px 10px;
}


/* 댓글 */
.reply { clear: both; padding: 20px 0 10px; }
.reply .bold { font-weight: 600; }

.reply .form-header { padding-bottom: 7px; }
.reply-form  tr>td { padding: 2px 0 2px; }
.reply-form textarea { width: 100%; height: 75px; resize: none; }
.reply-form button { padding: 8px 25px; }

.reply .reply-info { padding-top: 25px; padding-bottom: 7px; margin-bottom: 10px; }
.reply-info .reply-count { color: #0d6efd; font-weight: 600; }

.reply-writer .icon { font-size: 1.6rem; color: #999; }
.reply-writer .name { font-size: 12px; font-weight: 600; }
.reply-writer .date { font-size: 8px; }

.reply .reply-dropdown { cursor: pointer; }
.reply .reply-dropdown:hover { color: #0d6efd; font-weight: 500; }
.reply .reply-menu { display: none; position: absolute; width: 80px; min-height: 65px; background:#fff; border: 1px solid #d5d5d5; border-radius: 3px; z-index: 9999; }
.reply .reply-menu-item { text-align: center; cursor: pointer; padding: 7px; }
.reply .reply-menu-item:nth-child(2n+1) { border-bottom: 1px solid #d5d5d5; }
.reply .reply-menu-item:hover { color: #0d6efd; font-weight: 500; }


.reply-answer { display: none; }
.reply-answer textarea { width:98%; height: 75px; resize: none; }

.deleteReply, .deleteReplyAnswer { cursor: pointer; }

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
			if(jqXHR.status === 403) {
				login();
				return false;
			} else if(jqXHR.status === 400) {
				alert("요청 처리가 실패 했습니다.");
				return false;
			}
	    	
			console.log(jqXHR.responseText);
		}
	});
}


$(function(){
	listPage(1);
});

function listPage(page) {
	let url = "${pageContext.request.contextPath}/study/listReply";
	let query = "studyNum=${dto.studyNum}&pageNo="+page;
	let selector = "#listReply";
	
	const fn = function(data){
		$(selector).html(data);
		console.log(data);
	};
	ajaxFun(url, "get", query, "html", fn);
}

//댓글 등록
$(function(){
	$(".addReplyBtn").click(function(){
		let num = "${dto.studyNum}";
		const $tb = $(this).closest(".addReply");

		let content = $tb.find("textarea").val().trim();
		if(! content) {
			$tb.find("textarea").focus();
			return false;
		}
		content = encodeURIComponent(content);
		
		let url = "${pageContext.request.contextPath}/study/insertReply";
		let query = "studyNum=" + num + "&content=" + content + "&parent=0";
		
		const fn = function(data){
			$tb.find("textarea").val("");
			
			let state = data.state;
			if(state === "true") {
				listPage(1);
			} else if(state === "false") {
				alert("댓글을 추가 하지 못했습니다.");
			}
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});
});

//댓글 삭제
$(function(){
	$("body").on("click", ".deleteReply", function(){
		if(! confirm("댓글을 삭제하시겠습니까 ? ")) {
		    return false;
		}
		
		let replyNum = $(this).attr("data-replyNum");
		let page = $(this).attr("data-pageNo");
		
		let url = "${pageContext.request.contextPath}/study/deleteReply";
		let query = "studyReplyNum="+replyNum;
		
		const fn = function(data){
			// let state = data.state;
			listPage(page);
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});
});

//댓글별 답글 리스트
function listReplyAnswer(parent) {
	let studyNum = "${dto.studyNum}";
	let url = "${pageContext.request.contextPath}/study/listReplyAnswer";
	let query = "studyNum=" + studyNum + "&parent=" + parent;
	let selector = "#listReplyAnswer" + parent;
	
	const fn = function(data){
		$(selector).html(data);
	};
	ajaxFun(url, "get", query, "html", fn);
}

// 댓글별 답글 개수
function countReplyAnswer(parent) {
	let url = "${pageContext.request.contextPath}/study/countReplyAnswer";
	let query = "parent=" + parent;
	
	const fn = function(data){
		let count = data.count;
		let selector = "#answerCount"+parent;
		$(selector).html(count);
	};
	
	ajaxFun(url, "post", query, "json", fn);
}

//답글 버튼(댓글별 답글 등록폼 및 답글리스트)
$(function(){
	$("body").on("click", ".btnReplyAnswerLayout", function(){
		const $trReplyAnswer = $(this).closest("tr").next();
		
		let isVisible = $trReplyAnswer.is(':visible');
		let replyNum = $(this).attr("data-replyNum");
			
		if(isVisible) {
			$trReplyAnswer.hide();
		} else {
			$trReplyAnswer.show();
            
			// 답글 리스트
			listReplyAnswer(replyNum);
			
			// 답글 개수
			countReplyAnswer(replyNum);
		}
	});
});


//댓글별 답글 등록
$(function(){
	$("body").on("click", ".btnSendReplyAnswer", function(){
		let studyNum = "${dto.studyNum}";
		let studyReplyNum = $(this).attr("data-replyNum");
		const $td = $(this).closest("td");
		
		let content = $td.find("textarea").val().trim();
		if(! content) {
			$td.find("textarea").focus();
			return false;
		}
		content = encodeURIComponent(content);
		
		let url = "${pageContext.request.contextPath}/study/insertReply";
		let query = "studyNum=" + studyNum + "&content=" + content + "&parent=" + studyReplyNum;
		
		const fn = function(data){
			$td.find("textarea").val("");
			
			var state = data.state;
			if(state === "true") {
				listReplyAnswer(studyReplyNum);
				countReplyAnswer(studyReplyNum);
			}
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});
});


//댓글별 답글 삭제
$(function(){
	$("body").on("click", ".deleteReplyAnswer", function(){
		if(! confirm("게시물을 삭제하시겠습니까 ? ")) {
		    return false;
		}
		
		let studyReplyNum = $(this).attr("data-replyNum");
		let answer = $(this).attr("data-answer");
		
		let url = "${pageContext.request.contextPath}/study/deleteReply";
		let query = "studyReplyNum=" + studyReplyNum;
		
		const fn = function(data){
			listReplyAnswer(answer);
			countReplyAnswer(answer);
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});
});



function deleteCheck() {
	if(confirm("글을 삭제하시겠습니까 ? ")) {
		location.href = '${pageContext.request.contextPath}/study/delete?studyNum='+${dto.studyNum};
	}
}

</script>

		<div class="studyDetail">
			<div class="contents">
				<div class="studyContent">
					<div class="title">
						<div class="title_left">
							<div class="title_top">
								<c:if test="${dto.status == 0}">
									<div class="mark_ing">
										모집중
									</div>
								</c:if>
								<c:if test="${dto.status == 1}">
									<div class="mark_finsh">
										모집완료
									</div>
								</c:if>
								<p>${dto.subject}</p>
							</div>
							<p class="regDate">${dto.regDate}</p>
						</div>
						
						<div class="title_right">
							<button type="button" class="listBtn" onclick="location.href='${pageContext.request.contextPath}/study/home'">목록</button>
							<c:if test="${dto.userId ne sessionScope.member.userId}">
								<!-- 
									<button type="button" class="applyBtn">신청하기</button>
								 -->
							</c:if>
							<c:if test="${dto.userId eq sessionScope.member.userId}">
								<p class="updDel">
									<button type="button" class="updateBtn" onclick="location.href='${pageContext.request.contextPath}/study/update?studyNum=${dto.studyNum}'">수정</button>
									<button type="button" class="deleteBtn" onclick="deleteCheck();">삭제</button>
								</p>
							</c:if>
						</div>
					</div>
					
					<hr>
					
					<div class="content">
						<p>
							${dto.content}
						</p>
					</div>
				
				</div>
			
				<div class="replyPart">
					<form name="replyForm" method="post">
						<div class="addReply">
							<p>댓글</p>
							<textarea></textarea>
							<button type="button" class="addReplyBtn">등록</button>
						</div>
					</form>
					
					<hr>
					
					<div class="replyList">
					
						<div id="listReply"></div>
					
						<!-- 
						<div class="replyItems">
							<p>댓글 5개</p>
							<c:forEach var="i" begin="1" end="5">
								<div class="rContent">
									<div class="replyLeft">
										<p>스터디가 대략 어떻게 진행되나요?</p>
										<p>답글달기</p>
									</div>
									<div class="replyRight">
										<p>2022-07-07 12:12:00</p>
									</div>
								</div>
								<hr>
							</c:forEach>
						</div>
						 -->
						 
					</div>
				</div>
			</div>
		</div>

	</div>
</div>

