<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width", initial-scale="1">
<!-- 메타데이터, 이게 있어야 어디서든 사이즈가 왔다갔다함 -->
<link rel="stylesheet" href="/Group1_WebProject/design/css/bootstrap.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<jsp:include page="../include/header.jsp" />

	<%
		String userID = "임시";
	
	%>

	<div class="container">
		<div class="row">
		<form action="writeAction.do" method="post">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
							<!-- 홀수와 짝수 글색깔 다르게,보기 쉽게 -->
				<thead>
					<tr>
						<th style="width:1000px; background-color: #eeeeee; text-align: center;">게시판 글쓰기 양식 </th>

				
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control" placeholder="글제목" name ="TITLE" maxlength="49"></td>
						</tr>
					<tr>
						<td><textarea class="form-control" placeholder="글내용" name ="UCON" maxlength="2048" style="height: 350px"></textarea></td>
					</tr>
				
				</tbody>				
			</table>
			<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
			</form>			
		</div>
	</div>
	
	<jsp:include page="../include/footer.jsp" />
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="/Group1_WebProject/design/js/bootstrap.js"></script>
</body>
</html>