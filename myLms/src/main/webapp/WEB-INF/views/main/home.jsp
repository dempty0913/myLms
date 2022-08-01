<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css" type="text/css">


		<div class="contents">
			<div class="topLayout">
				<div class="topText">
					<p>2022 - 2학기</p>
					<p>수업을 추가해보세요</p>
				</div>
				
				<form name="searchForm" class="search">
					<input type="text" placeholder="수업명, 교수명, 전공으로 검색">
					<button type="button">검색</button>
				</form>
			</div>
			
		</div>
		
		<hr>
		
		<div class="lectureList">
			<table class="lecture">
				<tr>
					<td>전공</td>
					<td>수업명</td>
					<td>시간</td>
					<td>교수명</td>
					<td>담기</td>
					<td>상세</td>
				</tr>
				<c:forEach var="i" begin="1" end="5">
					<tr>
						<td>컴퓨터공학</td>
						<td>자바 프로그래밍</td>
						<td>21, 22교시</td>
						<td>김자바 교수</td>
						<td><button type="button" class="addBtn">담기</button></td>
						<td><button type="button" class="detailBtn" data-bs-toggle="modal" data-bs-target="#detailModal">상세</button></td>
					</tr>				
				</c:forEach>
			</table>
		</div>
		
		
	</div>
</div>


<!-- detail Modal -->
<div class="modal fade" id="detailModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">수업 상세</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <div class="modalContent py-4 px-4">
	      <div class="modal-body">
			<div class="leftContent">
				<p>2022 - 2학기</p>
				<p>자바 프로그래밍</p>
				<ul>
					<li>컴퓨터공학</li>
					<li>김자바 교수</li>
					<li>21, 22교시</li>
				</ul>
			</div>
			
			<div class="rightContent">
				<button type="button" class="lectureFileBtn">수업 계획서</button>
				<button type="button" class="addBtn">+ 담기</button>
			</div>
	      </div>
	      
	      <div class="goal">
		      <fieldset class="border pb-4 px-4">
		      	<legend class="w-auto">강의 목표</legend>
		      	<p>스프링 부트와 JPA를 활용해서 웹 애플리케이션을 설계하고 개발합니다. 이 과정을 통해 스프링 부트와 JPA를 실무에서 어떻게 활용해야 하는지 이해할 수 있습니다.</p>
		      </fieldset>
	      </div>
      </div>
      
    </div>
  </div>
</div>




