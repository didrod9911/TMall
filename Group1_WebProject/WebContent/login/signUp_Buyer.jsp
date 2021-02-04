<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Page Title - SB Admin</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js"></script>
</head>
<body class="bg-primary">
	<jsp:include page="../include/header.jsp" />
	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content">
			<main>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-7">
							<div class="card shadow-lg border-0 rounded-lg mt-5">
								<div class="card-header">


									<c:choose>
										<c:when test="${ requestScope.flag == 'buyer' }">
											<h3 class="text-center font-weight-light my-4">구매자 회원가입</h3>
											<input type="hidden" value="1" name="flag" id="flag">
										</c:when>
										<c:otherwise>
											<h3 class="text-center font-weight-light my-4">판매자 회원가입</h3>
											<input type="hidden" value="2" name="flag" id="flag">
										</c:otherwise>
									</c:choose>
								</div>

								<div class="card-body">
									<form action="insert.login" method="post" id="registerForm">
										<c:choose>
											<c:when test="${ requestScope.flag == 'buyer' }">
												<input type="hidden" value="1" name="flag" id="flag">
											</c:when>
											<c:otherwise>
												<input type="hidden" value="2" name="flag" id="flag">
											</c:otherwise>
										</c:choose>
										<div class="form-group">
											<label class="small mb-1" for="inputUserName">이름</label>
											<input class="form-control py-4" name="userName" id="userName" type="text" placeholder="이름을 입력하세요" required>
										</div>
										<div class="form-row">
											<div class="col-md-6">
												<div class="form-group" style="margin-bottom: 0px;">
													<label class="small mb-1" for="inputUserId">ID</label>
													<input class="form-control py-4" name="userId" id="userId" type="text" placeholder="아이디를 입력하세요" required>
												</div>
												<span id="idCheck" style="padding: 0px; font-size: 13px;"></span>
											</div>
										</div>
										<div class="form-group">
											<label class="small mb-1" for="inputUserPw">PW</label>
											<input class="form-control py-4" id="userPw" name="userPw" type="password" placeholder="비밀번호를 입력하세요" required>
											<span id="pwCheckSpan1" style="padding: 0px; font-size: 13px;"></span>
										</div>
										<div>
											<span id="pwCheckSpan1"
												style="padding: 0px; font-size: 13px;"></span>
										</div>
										<div class="form-group" style="margin-bottom: 0px;">
											<label class="small mb-1" for="inputUserPw">비밀번호 확인</label>
											<input class="form-control py-4" id="pwCheck" name="pwCheck" type="password" placeholder="위와 동일한 비밀번호를 입력하세요" required>
										</div>
										<div>
											<span id="pwCheckSpan2"	style="padding: 0px; font-size: 13px;"></span>
										</div>
										<div class="form-row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="small mb-1" for="inputUserNickname">닉네임</label>
													<input class="form-control py-4" name="userNickname" id="userNickname" type="text" placeholder="닉네임을 입력하세요"	required>
													<span id="nickSpan" style="padding: 0px; font-size: 13px;"></span>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="small mb-1" for="inputGender">성별</label>
													<select	class="custom-select" name="gender"	id="gender" style="height: 50px;">
														<option selected value="1">남</option>
														<option value="2">여</option>
													</select>
												</div>
											</div>
										</div>

										<div class="form-group">
											<label class="small mb-1" for="inputUserTel">휴대전화</label> <input
												class="form-control py-4" id="userTel" name="userTel"
												type="text" placeholder="010xxxxxxxx" required>
										</div>

										<div class="form-group">
											<label class="small mb-1" for="inputUserAddress">주소</label> <input
												class="form-control py-4" id="userAddress"
												name="userAddress" type="text" required>
										</div>
										<div class="form-group">
											<label class="small mb-1" for="inputBirth">생년월일</label><br>
											<span style="margin: 0px; display: inline-block; width: 32%;">
												<input type="number" class="form-control"
												placeholder="년(4자)" id="year" required>
											</span> <span
												style="margin: 0px; display: inline-block; width: 32%; vertical-align: bottom;">
												<select class="custom-select" id="month">
													<option value="0" selected>월</option>
													<c:forEach var="i" begin="1" end="12">
														<option value="${ i }">${ i }</option>
													</c:forEach>
											</select>
											</span> <span
												style="margin: 0px; display: inline-block; width: 32%;">
												<input type="number" class="form-control" placeholder="일"
												id="day" required>
											</span> <input type="hidden" name="age" id="age">
										</div>
										<c:choose>
											<c:when test="${ requestScope.flag == 'seller' }">
													<div class="form-group">
														<label class="small mb-1" for="inputBirth">언어</label> <span
															style="margin: 0px; display: inline-block; width: 100%; vertical-align: bottom;">
															<select class="custom-select" name="lang" id="lang">
																<option value="0" selected>교육 언어</option>
																<option value="english">영어</option>
																<option value="chinese">중국어</option>
																<option value="japanese">일본어</option>
														</select>
														</span>
													</div>
												<textarea class="form-control" name="intro"
															id="intro" style="resize: none; overflow-x: hidden; overflow-y: scroll"
															placeholder="간단한 자기소개를 적어주세요. (최대 100글자)"></textarea>
											</c:when>
										</c:choose>
										<span>&nbsp;</span>
										<input type="submit" class="btn btn-primary btn-lg btn-block"
											value="회원가입" id="submit">
										<!-- <div class="form-group mt-4 mb-0"><a class="btn btn-primary btn-lg btn-block" id="submit" onclick="$('#registerForm').submit()">회원가입</a></div> -->
										<div class="card-footer text-center">
											<div class="small">
												<a href="./login.jsp">계정이 있으시다면 로그인으로</a>
											</div>
										</div>


									</form>


								</div>


							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>
	<script>
$('#back').click(function() {
	history.back();
});

//submit 검사
$(document).ready(function() {
	var r_id = false;
	var r_p1 = false;
	var r_p2 = false;
	var r_nick = false;
	var r_bir = false;
	var r_lang = false;
	if ($('#flag').val() == 1) {
		r_lang = true;
	}

	$('#registerForm').bind('submit', function() {
		if (r_id && r_p1 && r_p2 && r_nick && r_bir && r_lang) {
			return true;
		} else {
			alert('fail');
			return false;
		}
	});

	// 아이디 한글 불가
	$( function(){
		$( '#userId' ).on("blur keyup", function() {
			$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
		});
	});
	
	// 아이디 검사
	$("#userId").blur(function() {
		var id = $("#userId").val();
		var re = /^[a-z0-9]{5,12}$/g;
		r_id = false;
		
		function checkResult() {
			$("#idCheck").css("color", '#FF1493');
			$("#idCheck").text("5~12자의 영문 소문자, 숫자만 사용 가능합니다.");
		}
		if (!re.test(id)) {
			checkResult();
			return false;
		} else {
			$.ajax({
				url: "idcheck.login",
				type: "post",
				data: {userId : id},
				dataType: "text",
				success: function(value) {
					if (value == '0') {
						$("#idCheck").css("color", '#4169E1');
						$("#idCheck").text("사용 가능한 아이디입니다.");
						r_id = true;
					} else {
						$("#idCheck").css("color", '#FF1493');
						$("#idCheck").text("중복된 아이디입니다.");
					}
				},
				error: function(request, status, error) {
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		}
	});
	
	// 비밀번호 검사
	$("#userPw").blur(function() {
		var pw = $("#userPw").val();
		var pwCheck = $("#pwCheck").val();
		var num = pw.search(/[0-9]/g);
		var eng = pw.search(/[a-z]/ig);
		var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		r_p1 = false;
		
		function notPass() {
			if (pw.length > 0) {
				$("#pwCheckSpan1").css("color", '#FF1493');
				$("#pwCheckSpan1").text("8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
			}
			if (pwCheck.length > 0 && pwCheck != pw) {
				$("#pwCheckSpan2").css("color", '#FF1493');
				$("#pwCheckSpan2").text("비밀번호가 일치하지 않습니다.");
			}
		}
		
		if (pw.length < 8 || pw.length > 16) {
			notPass();
			return false;
		} else if (pw.search(/\s/) != -1) {
			notPass();
			return false;
		} else if (num < 0 || eng < 0 || spe < 0) {
			notPass();
			return false;
		} else {
			$("#pwCheckSpan1").css("color", '#4169E1');
			$("#pwCheckSpan1").text("사용 가능한 비밀번호입니다.");
			r_p1 = true;
		}
	});
	
	// 비밀번호 확인 검사
	$("#pwCheck").blur(function() {
		var pw = $("#userPw").val();
		var pwCheck = $("#pwCheck").val();
		r_p2 = false;
		
		if (pwCheck.length > 0 && pwCheck != pw) {
			$("#pwCheckSpan2").css("color", '#FF1493');
			$("#pwCheckSpan2").text("비밀번호가 일치하지 않습니다.");
		} else if (pwCheck.length > 0 && pwCheck == pw) {
			$("#pwCheckSpan2").css("color", '#4169E1');
			$("#pwCheckSpan2").text("비밀번호가 일치합니다.");
			r_p2 = true;
		}
	});
	
	// 닉네임 검사
	$("#userNickname").blur(function() {
		var nick = $('#userNickname').val();
		r_nick = false;

		if (nick.length > 0) {
			$.ajax({
				url: "nickcheck.login",
				type: "post",
				data: {usernick : nick},
				dataType: "text",
				success: function(value) {
					if (value == '0') {
						$("#nickSpan").css("color", '#4169E1');
						$("#nickSpan").text("사용 가능한 닉네임입니다.");
						r_nick = true;
					} else {
						$("#nickSpan").css("color", '#FF1493');
						$("#nickSpan").text("중복된 닉네임입니다.");
					}
				},
				error: function(request, status, error) {
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});			
		} else {
			$("#nickSpan").css("color", '#FF1493');
			$("#nickSpan").text("필수 입력 항목입니다.");
		}
	});
	
	// 날짜 검사
	var date = new Date();
	var currentYear = date.getFullYear();
	$("#year").blur(function() {
		var birthYear = $("#year").val();
		if (birthYear < currentYear - 120 || birthYear > currentYear) {
			$("#year").val('');
		}
	});
	$("#day").blur(function() {
		var birthYear = $("#year").val();
		var birthMonth = $("#month").val();
		var tempDate;
		if (birthYear.length == 4) {
			if (birthMonth != '0') {
				tempDate = new Date(birthYear, birthMonth, 0);
				var maxDay = tempDate.getDate();
				var day = $("#day").val();
				if (day <= 0 || day > maxDay) {
					$("#day").val('');
				} else {
					$('#age').val(currentYear - birthYear + 1);
					r_bir = true;
				}
			}
		}
	});
	
	// 언어 선택 확인
	$('#lang').change(function name() {
		if (this.value != '0') {
			r_lang = true;
		} else {
			r_lang = false;
		}
	});
	
	// TextArea 글자 수 제한
	$('#intro').on('keyup', function() {
		if ($(this).val().length > 100) {
			$(this).val($(this).val().substring(0, 100));
		}
	});
});
</script>
</body>
</html>