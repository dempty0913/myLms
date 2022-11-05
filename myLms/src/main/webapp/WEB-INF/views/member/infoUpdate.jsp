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

#year {
	width: 100px;
	text-align: center;
	border: 1px solid lightgray;
	border-radius: 8px;
}

#semester {
	width: 100px;
	text-align: center;
	border: 1px solid lightgray;
	border-radius: 8px;
}

.profileImg {
	text-align: left;
	border-radius: 50%;
	width: 100px;
	height: 100px;
	background-image: url("https://d2u3dcdbebyaiu.cloudfront.net/uploads/atch_img/309/59932b0eb046f9fa3e063b8875032edd_crop.jpeg");
	cursor: pointer;
	z-index: 9999;
	margin: 12px 0;
	background-repeat : no-repeat;
	background-size: 140%;
	background-position: center;
}


</style>
<script type="text/javascript">

$(function() {
	var img = "${dto.profileImage}";
	if( img ) { // 수정인 경우
		img = "${pageContext.request.contextPath}/uploads/profile/" + img;
		$(".profileImg").empty();
		$(".profileImg").css("background-image", "url("+img+")");
	}
	
	$(".profileImg").click(function(){
		$("form[name=updateForm] input[name=selectFile]").trigger("click"); 
	});
	
	$("form[name=updateForm] input[name=selectFile]").change(function(){
		var file=this.files[0];
		if(! file) {
			$(".profileImage").empty();
			if( img ) {
				img = "${pageContext.request.contextPath}/uploads/profile/" + img;
				$(".profileImg").css("background-image", "url("+img+")");
			} else {
				img = "https://d2u3dcdbebyaiu.cloudfront.net/uploads/atch_img/309/59932b0eb046f9fa3e063b8875032edd_crop.jpeg";
				$(".profileImg").css("background-image", "url("+img+")");
			}
			return false;
		}
		
		if(! file.type.match("image.*")) {
			this.focus();
			return false;
		}
		
		var reader = new FileReader();
		reader.onload = function(e) {
			$(".profileImg").empty();
			$(".profileImg").css("background-image", "url("+e.target.result+")");
		}
		reader.readAsDataURL(file);
	});
});



function updateInfo() {
	const f = document.updateForm;
	let str;
	
	
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


 	f.action = "${pageContext.request.contextPath}/member/updateSubmit";
    f.submit();
	
}

</script>


		<div class="back">
			<div class="contents">
				<div class="title">
					<p>회원정보 수정</p>
				</div>
				
				<div class="formPart">
					<form name="updateForm" method="post" enctype="multipart/form-data">
						<table>
							<tr>
								<td>프로필 사진</td>
								<td colspan="3">
									<div class="profileImg">
									</div>
									<input type="file" class="img" name="selectFile" accept="image/*" style="display: none;">
								</td>
							</tr>
							<tr>
								<td>아이디</td>
								<td colspan="3">${dto.userId}</td>
							</tr>
							<tr>
								<td>이름</td>
								<td colspan="3"><input type="text" id="userName" name="userName" value="${dto.userName}" class="form-control"></td>
							</tr>
							<tr>
								<td>전화번호</td>
								<td colspan="3"><input type="text" id="userPhone" name="userPhone" value="${dto.userPhone}" class="form-control"></td>
							</tr>
							<tr>
								<td>이메일</td>
								<td colspan="3"><input type="text" id="userEmail" name="userEmail" value="${dto.userEmail}" class="form-control"></td>
							</tr>
						</table>
						<input type="hidden" name="profileImage" value="${dto.profileImage}">
						<p class="buttonP"><button type="button" class="addBtn" onclick="updateInfo();">수정하기</button></p>
					</form>
				</div>
				
				
			</div>
		</div>

	</div>
</div>

