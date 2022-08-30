<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">



</style>

<div class="applyList">
	<div>
		<div class="applyTop">
			<p>제출된 과제</p>
			<button type="button" class="allDownBtn" onclick="location.href='${pageContext.request.contextPath}/teacher/lecture/project/zipDownload?projectNum=${projectNum}'">전체 다운로드</button>
		</div>
		
		<table>
			<tr>
				<td>제출파일명</td>
				<td>제출자</td>
				<td>제출일</td>
				<td>다운로드</td>
			</tr>
			<c:forEach var="li" items="${list}">
				<tr>
					<td>${li.originalFileName}</td>
					<td>${li.userName}</td>
					<td>${li.submitDate}</td>
					<td><a href="${pageContext.request.contextPath}/teacher/lecture/project/download?submitNum=${li.submitNum}"><i class="fa-solid fa-download downBtn"></i></a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>
