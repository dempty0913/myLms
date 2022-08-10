<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
$(function(){
	
	let uri = "${requestScope["javax.servlet.forward.request_uri"]}";
	
	let name = uri.substr(13);
	
	if(name.substr(0,4) == "home") {
		$('#home').removeClass("clicked");
		$('#home').addClass("clicked");
	}
	else {
		name = name.replace("/home","");
		$('#home').removeClass("clicked");
		$('#'+ name).addClass("clicked");
	}
	
});
</script>

<div class="layout">
	<div class="sideBar">
		<div class="memberProfile">
			<div class="circle">
				<img src="https://d2u3dcdbebyaiu.cloudfront.net/uploads/atch_img/309/59932b0eb046f9fa3e063b8875032edd_crop.jpeg">
			</div>
			<div class="memberInfo">
				<p><span>교수</span>&nbsp;&nbsp;${sessionScope.member.userName}</p>
				<p>${sessionScope.member.userEmail}</p>
				<p>회원정보수정</p>
			</div>
		</div>
		<div class="menuList">
			<div class="lmsList">
				<p class="liBtn" id="home"><a class="" href="${pageContext.request.contextPath}/teacher/home/home"><i class="fa-solid fa-house-user"></i>&nbsp;&nbsp;홈</a></p>
				<p class="liBtn" id="lecture"><a class="" href="${pageContext.request.contextPath}/teacher/lecture/home"><i class="fa-solid fa-chalkboard"></i>&nbsp;&nbsp;수업</a></p>
				<p class="liBtn" id="timeBoard"><a class="" href="${pageContext.request.contextPath}/teacher/timeBoard/home"><i class="fa-solid fa-clock"></i>&nbsp;&nbsp;시간표</a></p>
				<p class="liBtn" id="mySchedule"><a class="" href="${pageContext.request.contextPath}/teacher/mySchedule/home"><i class="fa-solid fa-calendar"></i>&nbsp;&nbsp;내 일정</a></p>
			</div>
			<div class="lmsList">
				<p class="liBtn" id="myMessage"><a class="" href="${pageContext.request.contextPath}/teacher/myMessage/home"><i class="fa-solid fa-envelope"></i>&nbsp;&nbsp;쪽지</a></p>
			</div>
		</div>
		
	</div>
	
	<div class="mainPart">
		<div class="topProfile">
			<a href="${pageContext.request.contextPath}/member/logout"><i class="fa-solid fa-arrow-right-from-bracket"></i>&nbsp;&nbsp;로그아웃</a>
			<div class="rightInfo">
				<p><i class="fa-regular fa-bell" data-bs-toggle="modal" data-bs-target="#notiModal"></i></p>
				<p><i class="fa-solid fa-circle-user"></i></p>
			</div>
		</div>
		
		<!-- detail Modal -->
		<div class="modal fade" id="notiModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">알림</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      
		      <div class="modalContent">
			      <div class="modal-body">
			      	<div class="noti">
			      		<p>최근 알림 20개를 보여줍니다.</p>
			      	</div>
			      	<c:forEach var="i" begin="1" end="10">
						<div class="notiList">
							<div class="itemList">
								<p>자바 프로그래밍</p>
								<p>과제가 등록되었습니다.</p>
							</div>
							<p>2022-07-22</p>
						</div>
						<hr>
			      	</c:forEach>
			      </div>
		      </div>
		      
		    </div>
		  </div>
		</div>
