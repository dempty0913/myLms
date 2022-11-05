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
	width: 580px;
	height: 550px;
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
	height: 70vh;
	border-radius: 30px;
	padding: 15px 30px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	box-shadow: 0px 0px 20px #AABED6;
	background: white;
}

.joinBtn {
	width: 47%;
	border-radius: 20px;
	font-size: 18px;
	background: #486A96;
	color: white;
}

.backBtn {
	width: 47%;
	border-radius: 20px;
	font-size: 18px;
	background: white;
	color: #486A96;
	border: 2px solid #486A96;
}

.topGroup {
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}


.btnGroup {
	display: flex;
	justify-content: space-between;
	margin-top: 15px;
	margin-bottom: 20px;
}

</style>
<script type="text/javascript">
function memberOK() {
	const f = document.memberForm;
	let str;

	str = f.userId.value;
	if( !/^[a-z][a-z0-9_]{4,9}$/i.test(str) ) { 
		alert("아이디는 5~10자이며 첫글자는 영문자이어야 합니다.");
		f.userId.focus();
		return;
	}

	
	str = f.userPwd.value;
	if( !str ) {
		alert("패스워드를 입력하세요. ");
		f.userPwd.focus();
		return;
	}
	if( !/^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{5,10}$/i.test(str) ) { 
		alert("패스워드는 5~10자이며 하나 이상의 숫자나 특수문자가 포함되어야 합니다.");
		f.userPwd.focus();
		return;
	}

	if ( str !== f.userPwd2.value ) {
        alert("패스워드가 일치하지 않습니다. ");
        f.userPwd2.focus();
        return;
	}
	
    str = f.userName.value;
    if( !str ) {
        alert("이름을 입력하세요. ");
        f.userName.focus();
        return;
    }

    
    str = f.userPhone.value;
    if( !str ) {
        alert("전화번호를 입력하세요. ");
        f.userPhone.focus();
        return;
    }

    
    str = f.userEmail.value;
    if( !str ) {
        alert("이메일을 입력하세요. ");
        f.userEmail.focus();
        return;
    }


 	f.action = "${pageContext.request.contextPath}/member/joinSubmit";
    f.submit();
}
</script>
</head>
<body>



<div class="contents">
	<div class="box">
		<p class="title">LMS | 회원가입</p>
		<div class="inputBox">
		
			<form name="memberForm" method="post">
				<div class="topGroup">
					<div class="userId mb-3 row">
						<label for="userId" class="col-sm-3 col-form-label">아이디</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="userId" id="userId" placeholder="5~10자 이내, 첫글자는 영문자">
						</div>
					</div>
					<div class="userPwd mb-3 row">
						<label for="userPwd" class="col-sm-3 col-form-label">비밀번호</label>
						<div class="col-sm-9">
							<input type="password" class="form-control" name="userPwd" id="userPwd" placeholder="5~10자 이내, 하나 이상의 숫자나 특수문자 포함">
						</div>
					</div>
					<div class="userPwd2 mb-3 row">
						<label for="userPwd2" class="col-sm-3 col-form-label">비밀번호 확인</label>
						<div class="col-sm-9">
							<input type="password" class="form-control" name="userPwd2" id="userPwd2">
						</div>
					</div>
					<div class="userName mb-3 row">
						<label for="userName" class="col-sm-3 col-form-label">이름</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="userName" id="userName">
						</div>
					</div>
					<div class="statusGroup mb-3 row">
						<label for="status" class="col-sm-3 col-form-label">직업</label>
						<div class="status col-sm-9">
							<input class="form-check-input" type="radio" name="status" id="status" value="0">
							<label class="form-check-label" for="status">
								학생
							</label>
							
							<input class="form-check-input" type="radio" name="status" id="status" value="1">
							<label class="form-check-label" for="status">
								교수
							</label>
						</div>
					</div>
					<div class="userPhone mb-3 row">
						<label for="userPhone" class="col-sm-3 col-form-label">전화번호</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="userPhone" id="userPhone" placeholder="010-xxxx-xxxx">
						</div>
					</div>
					<div class="userEmail mb-3 row">
						<label for="userEmail" class="col-sm-3 col-form-label">이메일</label>
						<div class="col-sm-9">
							<input type="email" class="form-control" name="userEmail" id="userEmail">
						</div>
					</div>
					
				</div>
				
				<div class="text-center">
					<p style="color: blue;">${message}</p>
				</div>
				
				<p class="btnGroup">
					<button type="button" class="btn joinBtn" onclick="memberOK();">회원가입</button>
					<button type="button" class="btn backBtn" onclick="location.href='${pageContext.request.contextPath}/'">취소</button>
				</p>
			</form>
			
		</div>
	</div>
</div>

</body>
</html>