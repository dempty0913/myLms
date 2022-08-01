<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">

.dashContents {

}

.topText {
	font-size: 26px;
	margin-bottom: 20px;
	font-weight: bold;
	color: #2F4352;
}


.dashBoard .card {
	background: #EDF5FA;
	border-radius: 15px;
	border: none;
	box-shadow: 0px 0px 10px #8198A8;
}

.dashBoard .card .card-header {
	background: #DAE1E6;
	border-radius: 15px 15px 0 0;
	font-weight: bold;
	color: #72808C;
}

.dashBoard .card .card-body p:nth-child(1) {
	font-weight: bold;
	font-size: 25px;
	color: #2F4352;
}

.dashBoard .card .card-body p:nth-child(2) {
	font-size: 17px;
}

</style>

		<div class="dashContents">
			<div class="dashBoard my-4 mx-4">
				<div class="topText mx-4 my-4">
					<p class="mx-4 my-3">2022 - 2학기 수업</p>
				</div>
				
				<div class="row row-cols-1 row-cols-md-3 g-5 mx-4">
					<c:forEach var="i" begin="1" end="5">
						<div class="col">
							<div class="card h-100">
								<div class="card-header">컴퓨터공학</div>
								<div class="card-body py-4">
									<p>자바 프로그래밍</p>
									<p>김자바 교수</p>
									<p>21, 22교시</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>

	</div>
</div>
