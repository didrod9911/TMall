<%@page import="tMallVO.USERSAY"%>
<%@page import="tMallDAO.TMallDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<!-- 메타데이터, 이게 있어야 어디서든 사이즈가 왔다갔다함 -->
<link rel="stylesheet" href="/Group1_WebProject/design/css/bootstrap.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<jsp:include page="../include/header.jsp" />

	<%
	int NO =0;
	if(request.getParameter("NO")!= null){
		NO = Integer.parseInt(request.getParameter("NO"));		
	}
	USERSAY usersay = new TMallDAO().getWrite(NO);
	%>

	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
							<!-- 홀수와 짝수 글색깔 다르게,보기 쉽게 -->
				<thead>
					<tr>
						<th style="width:1000px; background-color: #eeeeee; text-align: center;">게시판 글보기 </th>

				
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style = "width : 20%;">글제목</td>
						<td colspan = "2"><%= usersay.getTITLE() %></td>
						</tr>
					<tr>
						<td>작성자</td>
						<td colspan = "2"><%= usersay.getUSERID() %></td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td colspan = "2"><%=usersay.getWRITED().substring(0,11) +usersay.getWRITED().substring(11,13)+"시"
						+usersay.getWRITED().substring(14,16)+"분"%></td>
					</tr>
					
					<tr>
						<td>내용</td>
						<td colspan = "2" style="min-height:200px; text-align:left;"><%= usersay.getUCON().replaceAll(" ","&nbsp;") %></td>
					</tr>
				
				</tbody>				
			</table>
			<a href ="usersay.jsp" class = "btn btn-primary">목록</a>	
		</div>
	</div>
	
	<jsp:include page="../include/footer.jsp" />
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="/Group1_WebProject/design/js/bootstrap.js"></script>
</body>
</html>