<%@page import="java.text.DecimalFormat"%>
<%@page import="tMallVO.TMalltUserVO"%>
<%@page import="tMallVO.TMallProductVO"%>
<%@page import="tMallDAO.TMallDAO"%>
<%@page import="com.TMall.www.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
.image img { width: 100%; }
</style>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Small Business - Start Bootstrap Template</title>

<!-- Bootstrap core CSS -->
<!-- <link href="../desig/nvendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> -->
<!-- Custom styles for this template -->
<!-- <link href="../design/css/small-business.css" rel="stylesheet"> -->

</head>

<!-- 테이블 수정 안하면 오류 날수도 있음 -->
<%
	TMallProductVO tvo = new TMallProductVO();
	tvo = (TMallProductVO)request.getAttribute("tvo");
	int sSeq = tvo.getsSeq();
	DecimalFormat df = new DecimalFormat("#,###");
	
	String introduce = (String)request.getAttribute("introduce"); //12.8 손혜지 추가
 %>

<body>

	<jsp:include page="../include/header.jsp" />
	
	<!-- Page Content -->
	<div class="container">
		<div class="row align-items-center my-5">
			<p></p>
		</div>
		<!-- Heading Row -->
		<div class="row align-items-center my-5">
			<div class="col-lg-7">
				<c:choose>
					<c:when test="${ tvo.language == 'english' }">
						<img class="img-fluid rounded mb-4 mb-lg-0"	src="<%= request.getContextPath() %>/product_detail/usa.png" alt="">
					</c:when>
					<c:when test="${ tvo.language == 'japanese' }">
						<img class="img-fluid rounded mb-4 mb-lg-0"	src="<%= request.getContextPath() %>/product_detail/japan.png" alt="">
					</c:when>
					<c:otherwise>
						<img class="img-fluid rounded mb-4 mb-lg-0"	src="<%= request.getContextPath() %>/product_detail/china.png" alt="">
					</c:otherwise>
				</c:choose>
			</div>
			<!-- /.col-lg-8 -->
			<div class="col-lg-5">
				<h1 class="font-weight-light"><%=tvo.getClassName() %></h1>
				<p></p>
				<p></p>
				<table style="width: -webkit-fill-available; font-size: 20px;">
					<tr>
						<td>
							상품 가격
						</td>
						<td>
							<%= df.format(tvo.getClassPrice()) %>원
						</td>
					</tr>
					<tr>
						<td>
							1회당 레슨시간
						</td>
						<td>
							<%=tvo.getClassTime()%>분
						</td>
					</tr>
					<tr>
						<td>
							레슨 횟수
						</td>
						<td>
							<%=tvo.getClassNum() %>회
						</td>
					</tr>
					<tr>
						<td>
							장소
						</td>
						<td>
							<%=tvo.getClassPlace() %>
						</td>
					</tr>
				</table>
			</div>
			<!-- /.col-md-4 -->
		</div>
		<!-- /.row -->

		<!-- Call to Action Well -->
		<div class="card text-white bg-secondary my-2 py-4 text-center">
			<div class="card-body">
				<p class="text-white m-0"></p>
			</div>
		</div>

		<!-- Content Row -->
		<div class="row">
			<div class="col-md-4 mb-5">
				<div class="card h-100">
					<div class="card-body">
						<h2 class="card-title">취소 환불 규정</h2>
						<p class="card-text">레슨 환불기준 원칙</p>
						<p class="card-text">학원의 설립/운영 및 과외교습에 관한 법률 제 18조(교습비 등의 반환등)</p>
						<p class="card-text">- 학원설립, 운영자, 교습자 및 개인과외교습자는 학습자가 수강을 계속할수
							없는 경우 또는 학원의 등록말소...</p>
					</div>
					<div class="card-footer">
						<a href="product_detail/refund_Policy.jsp?sSeqNum=<%=sSeq%>"
							class="btn btn-primary btn-sm">자세히보기</a>
					</div>
				</div>
			</div>
			<!-- /.col-md-4 -->
			<div class="col-md-4 mb-5">
				<div class="card h-100">
					<div class="card-body">
						<h2 class="card-title">강사 소개</h2>
						<h5 class="font-weight-light"><%=introduce%></h5>
					</div>
					<div class="card-footer"></div>
				</div>
			</div>
			<!-- /.col-md-4 -->
			<div class="col-md-4 mb-5">
				<div class="card h-80">
					<div class="card-body">
						<a href="/Group1_WebProject/board/usersay.jsp"
							class="btn btn-primary btn-lg btn-block">1대1 문의남기기</a>
						<p></p>
						<a class="btn btn-danger btn-lg btn-block "
							href="SeqSearch.main?sSeqNum=<%=sSeq%>">결제하기</a>
					</div>
				</div>
			</div>
			<!-- /.col-md-4 -->

		</div>
		<!-- /.row -->
		
		<div id="testData" class="card h-100">
			<div align="center"><h2 class="card-header">과외 소개</h2></div>
			<div align="center">
				<%= tvo.getClassData() %>
			</div>
		</div>

	</div>
	<!-- /.container -->
	<script src="../Group1_WebProject/ckeditor/build/ckeditor.js"></script>


	<!-- Footer -->
	<jsp:include page="../include/footer.jsp" />

	<!-- Bootstrap core JavaScript -->
	<!-- <script src="vendor/jquery/jquery.min.js"></script> -->
	<!-- <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->

</body>
</html>