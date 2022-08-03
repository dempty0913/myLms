<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">

<style type="text/css">

body {
	height: 100%;
	background: #EAEFF7;
}

.contents {
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
}

.box {
	width: 500px;
	height: 450px;
	margin-bottom: 20px;
}

.box .title {
	text-align: center;
	font-size: 35px;
	font-weight: bold;
	font-family: 'Do Hyeon', sans-serif;
	color: #2D4170;
}

.inputBox {
	width: 100%;
	height: 380px;
	border-radius: 30px;
	padding: 15px 30px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	box-shadow: 0px 0px 20px #AABED6;
	background: white;
}

.inputBox ul {
	margin-bottom: 20px;
}

.inputBox a {
	text-align: center;
	text-decoration: none;
	color: gray;
	font-weight: bold;
}

.inputBox a:hover {
	color: #486A96;
}

.textBox {
	margin-bottom: 20px;
}

.loginBtn {
	width: 100%;
	border-radius: 20px;
	font-size: 18px;
	margin-bottom: 20px;
	background: #486A96;
	color: white;
}

.loginBtn:hover {
	color: white;
}

.nav-item {
	width: 50%;
}

.nav-link {
	width: 100%;
}

</style>
</head>
<body>



<div class="contents">
	<div class="box">
		<p class="title">LMS | 로그인</p>
		<div class="inputBox">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">학생</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">교직원</button>
				</li>
			</ul>

			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
					<div class="textBox">
						<p>아이디 <input type="text" class="form-control"></p>
						<p>비밀번호 <input type="text" class="form-control"></p>
					</div>
					<button type="button" class="btn loginBtn" onclick="location.href='${pageContext.request.contextPath}/home/home'">학생으로 로그인</button>
					<a href="#">회원가입하기</a>
				</div>
				
				<div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
					<div class="textBox">
						<p>아이디 <input type="text" class="form-control"></p>
						<p>비밀번호 <input type="text" class="form-control"></p>
					</div>
					<button type="button" class="btn loginBtn">교직원으로 로그인</button>
					<a href="#">회원가입하기</a>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>