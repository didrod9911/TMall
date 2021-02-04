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

<style>
	#div_root{
		margin:0 auto; 
		width:1500px;
		height:100%;
	}
	#blank0{
		background-color: white;
		width:100%;
		height:50px;
		float:left;
	}
</style>

</head>
<jsp:include page="../include/header.jsp" />
<body data-editor="ClassicEditor" data-collaboration="false">


<div id="div_root">
	<div id="blank0"><h2>　</h2></div>
	<font size="6" style="font-weight: bold;">과외등록</font><br><br><hr style="background-color: black;">
	
	<form action="main.product" method="post" id="registerForm">
		<table border="0" style="margin-left: 10px;"><!--  -->
			<tr height="60px">
				<td width="250px">
					<font size="5" style="font-weight: bold;">언어</font>
				</td>
				<td>
					<select id="lang" style="width: 100%; height: 45px;">
						<option value="english" selected>영어</option>
						<option value="chinese">중국어</option>
						<option value="japanese">일본어</option>
					</select>
				</td>
			</tr>
			<tr height="60px">
				<td>
					<font size="5" style="font-weight: bold;">과외제목</font>
				</td>
				<td>
					<input type="text" id="cName" required style="height: 45px;">
				</td>
			</tr>
			<tr height="60px">
				<td>
					<font size="5" style="font-weight: bold;">과외시간</font>
				</td>
				<td>
					<select id="cTime" style="width: 100%; height: 45px;">
						<option value="60" selected>1시간</option>
						<option value="90">1시간 30분</option>
					</select>
				</td>
			</tr>
			<tr height="60px">
				<td>
					<font size="5" style="font-weight: bold;">과외횟수</font>
				</td>
				<td>
					<input type="number" id="cNum" required style="height: 45px;">
				</td>
			</tr>
			<tr height="60px">
				<td>
					<font size="5" style="font-weight: bold;">과외가격</font>
				</td>
				<td>
					<input type="number" id="cPrice" required style="height: 45px;">
				</td>
			</tr>
			<tr height="60px">
				<td>
					<font size="5" style="font-weight: bold;">과외장소</font>
				</td>
				<td>
					<input type="text" id="cPlace" required="required" style="height: 45px;">
				</td>
			</tr>
		</table>
		
		<hr style="background-color: black;">
		
		<input type="hidden" id="id" value = "${ user.id }">
		<input type="hidden" id="nick" value="${ user.nickname }">
		<input type="hidden" id="gen" value="${ user.gender }">
		<input type="hidden" id="age" value="${ user.age }">
		
		<br>
		<font size="5" style="font-weight: bold; margin-left: 10px;">과외 소개</font>
		<br><br>
		<input type="hidden" name="content" style="margin-left: 10px;">
			<div id="editor">
				<div class="ck-blurred ck-editor__editable ck-rounded-corners ck-editor__editable_inline" role="textbox" aria-label="Rich Text Editor, main" contenteditable="true">
					
        		</div>
			</div>
			<br>
		<input type="submit" value="확인" id="submit">
	</form>

</div>


<script src="../Group1_WebProject/ckeditor/build/ckeditor.js"></script>
<script src="./product/editorconf.js"></script>
<jsp:include page="../include/footer.jsp" />
</body>
</html>