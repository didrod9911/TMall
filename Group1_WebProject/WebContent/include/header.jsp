<%@page import="tMallVO.TMalltUserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<!-- Bootstrap core CSS -->
	<link href="/Group1_WebProject/design/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<!-- Custom styles for this template -->
	<link href="/Group1_WebProject/design/css/shop-homepage.css" rel="stylesheet">
	<!-- JQuery -->
	<script src="/Group1_WebProject/design/vendor/jquery/jquery.js"></script>
</head>
<body>
  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="#">과외몰</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="/Group1_WebProject/mainScreen.jsp">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          	<c:choose>
          		<c:when test="${ empty user }">
					<li class="nav-item">
						<!-- 프로젝트명 수정필요 -->
						<a class="nav-link" href="/Group1_WebProject/login.login">로그인</a>
					</li>
					<li class="nav-item">
						<!-- 프로젝트명 수정필요 -->
						<a class="nav-link" href="/Group1_WebProject/register.login">회원가입</a>
					</li>
          		</c:when>
          		<c:when test="${ user.flag == 2 }">
	       			<li class="nav-item">
						<a class="nav-link" href="/Group1_WebProject/logout.login">로그아웃</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/Group1_WebProject/userInfo/A_SellerModify.jsp">회원정보</a>
					</li>
		        	<li class="nav-item">
						<a class="nav-link" href="/Group1_WebProject/register.product">과외등록</a>
					</li>
        		</c:when>
          		<c:otherwise>
          			<li class="nav-item">
						<!-- 프로젝트명 수정필요 -->
						<a class="nav-link" href="/Group1_WebProject/logout.login">로그아웃</a>
					</li>
					<li class="nav-item">
						<!-- 프로젝트명 수정필요 -->
						<a class="nav-link" href="/Group1_WebProject/userInfo/A_ConsumerModify.jsp">회원정보</a>
					</li>
          		</c:otherwise>
          	</c:choose>
        </ul>
      </div>
    </div>
  </nav>
</body>
</html>