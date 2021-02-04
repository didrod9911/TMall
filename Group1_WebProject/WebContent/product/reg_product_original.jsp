<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.ck-editor__editable_inline {
		height: 700px;
	    max-height: 700px;
	}
</style>
</head>
<jsp:include page="../include/header.jsp" />
<body data-editor="ClassicEditor" data-collaboration="false">
	<form action="main.product" method="post" id="registerForm">
		언어
		<select id="lang">
			<option value="english" selected>영어</option>
			<option value="chinese">중국어</option>
			<option value="japanese">일본어</option>
		</select>
		<br>
		과외 제목
		<input type="text" id="cName" required>
		<br>
		과외 시간
		<select id="cTime">
			<option value="60" selected>1시간</option>
			<option value="90">1시간 30분</option>
		</select>
		<br>
		과외 번호(?)
		<input type="number" id="cNum" required>
		<br>
		과외 가격
		<input type="number" id="cPrice" required>
		<br>
		과외 장소
		<input type="text" id="cPlace" required="required">
		<input type="hidden" id="id" value = "${ user.id }">
		<input type="hidden" id="nick" value="${ user.nickname }">
		<input type="hidden" id="gen" value="${ user.gender }">
		<input type="hidden" id="age" value="${ user.age }">
		<br>
		과외 소개
		<br>
		<input type="hidden" name="content">
			<div id="editor">
				<div class="ck-blurred ck-editor__editable ck-rounded-corners ck-editor__editable_inline" role="textbox" aria-label="Rich Text Editor, main" contenteditable="true">
					
        		</div>
			</div>
		<input type="submit" value="확인" id="submit">
	</form>
	
<script src="../Group1_WebProject/ckeditor/build/ckeditor.js"></script>
<script src="./product/editorconf.js"></script>
<jsp:include page="../include/footer.jsp" />
</body>
</html>