<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Page Title - SB Admin</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js"></script>
</head>
<body class="bg-primary">

<c:choose>
	<c:when test="${ sessionScope.user != null }">
		<script type="text/javascript">
			history.back();
		</script>
	</c:when>
	<c:when test="${ param.error == 1 }">
		<script type="text/javascript">
			alert("존재하지 않는 ID 혹은 맞지 않는 비밀번호입니다.");
		</script>		
	</c:when>
</c:choose>

<jsp:include page="../include/header.jsp" />
<!-- ------------------------------------헤더 및 알림--------------------------------------- -->
	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content">
			<main>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-5">
							<div class="card shadow-lg border-0 rounded-lg mt-5">
								<div class="card-header">
									<h3 class="text-center font-weight-light my-4">로그인</h3>
								</div>

								<div class="card-body">
									<form action="login.login" method="post" id="loginForm">
										<!-- 로그인 엑션 폼---------------------------------------------------------- -->
										<div class="form-group">
											<label class="small mb-1" for="inputEmailAddress">아이디</label>
											<input class="form-control py-4" type="text" name="userId"
												id="userId" class="form-control" required placeholder="아이디">
										</div>
										<div class="form-group">
											<label class="small mb-1" for="inputPassword">비밀번호</label> <input
												class="form-control py-4" type="password" name="userPw"
												id="userPw" required placeholder="비밀번호" required>
										</div>

										<div class="form-group mt-4 mb-0">
											<input type="submit" value="로그인" id="submit"
												class="btn btn-primary btn-block">
										</div>
									</form>
								</div>
								<div class="card-footer text-center">
									<div class="small">
										<a href="register.login">ID가 없으시다면? 지금 바로 회원가입!</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>
	<script>
$(document).ready(function() {
	
	$('#loginForm').bind('submit', function() {
		
		var id = $('#userId').val();
		var pw = $('#userPw').val();
		
		$.ajax({
			url: "login.login",
			type: "post",
			data: {
				userId : id,
				userPw : pw
				},
			dataType: "text",
			success: function(value) {
				if (value == '0') {
					location.href="main.login";
				} else {
					alert('아이디가 존재하지 않거나 비밀번호가 틀렸습니다.');
				}
			},
			error: function(request, status, error) {
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
		return false;
	});
});


$( function(){
	$( '#userId' ).on("blur keyup", function() {
		$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) ); //한글 입력 안되게 해주는 장치
	});
});
</script>
</body>
</html>
