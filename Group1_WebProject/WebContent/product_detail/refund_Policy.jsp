<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Small Business - Start Bootstrap Template</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/small-business.css" rel="stylesheet">
	
	
</head>
<%
	int sSeq = Integer.parseInt(request.getParameter("sSeqNum"));
%>
<body>

  <jsp:include page="../include/header.jsp" />
<!-- ------------------------------------헤더--------------------------------------- -->

  <!-- Page Content -->
  <div class="container">

    

    <!-- Content Row -->
    <div class="row">
      <div class="col mb-5">
        <div class="card h-100">
          <div class="card-body">
            <h2 class="card-title">취소 환불 규정</h2>
            <p class="card-text">레슨 환불기준 원칙</p>

<p class="card-text">가. 레슨 환불기준 원칙</p>
<p class="card-text">학원의 설립/운영 및 과외교습에 관한 법률 제 18조(교습비 등의 반환 등)</p>
<p class="card-text">- 학원설립, 운영자, 교습자 및 개인과외교습자는 학습자가 수강을 계속할 수 없는 경우 또는 학원의 등록말소, 교습소 폐지 등으로 교습을 계속할 수 없는 경우에는 학습자로부터 받은</p>
<p class="card-text">교습비를 반환하는 등 학습자를 보호하기 위하여 필요한 조치를 하여야 한다.</p>

<p class="card-text">1. 레슨을 제공할 수 없거나, 레슨 장소를 제공할 수 없게 된 날 : 이미 납부한 레슨비 등을 일한 계산한 금액 환불</p>

<p class="card-text">2. 레슨기간이 1개월 이내의 경우</p>
<p class="card-text">- 레슨 시작전 : 이미 납부한 레슨비 전액 환불</p>
<p class="card-text">- 총 레슨 시간의 1/3 경과전 : 이미 납부한 레슨비의 2/3에 해당액 환불</p>
<p class="card-text">- 총 레슨 시간의 1/2 경과전 : 이미 납부한 레슨비용의 1/2에 해당액 환불</p>
<p class="card-text">- 총 레슨시간의 1/2 경과후 : 반환하지 않음</p>

<p class="card-text">3.레슨 기간이 1개월을 초과하는 경우</p>
<p class="card-text">- 레슨 시작전 : 이미 납부한 레슨비 전액 환불</p>
<p class="card-text">- 레슨 시작후 : 반환사유가 발생한 당해 월의 반환 대상 레슨비(레슨비 징수기간이 1개월 이내인 경우에 따라 산출된 수강료를 말한다)와 나머지 월의 레슨비 전액을 합산한 금액 환불</p>

<p class="card-text">* 총 레슨 시간의 레슨비 징수기간 중의 총레슨시간을 말하며, 반환 금액의 산정은 반환 사유가 발생한 날까지 경과 된 레슨시간을 기준으로 함</p>
          </div>
          <div class="card-footer">
            <a href="javascript:history.back();" class="btn btn-primary btn-sm">뒤로가기</a>
          </div>
        </div>
      </div>
      </div></div>
      
  <!-- Footer -->
  <jsp:include page="../include/footer.jsp" />

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>