<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="tMallVO.USERSAY"%>
<%@page import="java.util.ArrayList"%>
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
<style type="text/css">

a, a :hover {
	color:#000000;
	text-decoration: none;
}
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp" />

	<%	String USERID = "임시";
		int pageNumber = 1;// 기본 페이지넘버
		if(request.getParameter("pageNumber")!= null){
			pageNumber =Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
	
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
							<!-- 홀수와 짝수 글색깔 다르게,보기 쉽게 -->
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
				<%
				TMallDAO dao = new TMallDAO();
				ArrayList<USERSAY> list = dao.getList(pageNumber);
				for(int i =0 ;i<list.size(); i++){
				%>
					<tr>
						<td><%=list.get(i).getNO() %></td>
						<td><a href = "view.jsp?NO=<%=list.get(i).getNO() %>"><%=list.get(i).getTITLE() %></a></td>
						<td><%=list.get(i).getUSERID() %></td>
						<td><%=list.get(i).getWRITED().substring(0,11) +list.get(i).getWRITED().substring(11,13)+"시"
						+list.get(i).getWRITED().substring(14,16)+"분"%></td>
					</tr>
					<%} %>
				</tbody>
			</table>
			<%
			if(pageNumber !=1){
			%>
			<a href ="usersay.jsp?pageNumber=<%=pageNumber-1 %>" class ="btn btn-success btn-arraw-left" style="margin-right: 10px">이전</a>
			<%
			} if(dao.nextPage(pageNumber+1)){							
			%>
			<a href ="usersay.jsp?pageNumber=<%=pageNumber+1 %>" class ="btn btn-success btn-arraw-left" style="margin-right: 10px">다음</a>			
			<%} %>
			<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
		</div>
	</div>
	
	<jsp:include page="../include/footer.jsp" />
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="/Group1_WebProject/design/js/bootstrap.js"></script>
</body>
</html>