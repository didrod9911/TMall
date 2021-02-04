<%@page import="java.text.DecimalFormat"%>
<%@page import="tMallVO.TMallProductVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="tMallDAO.TMallDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>TMall_메인화면</title>

<!-- Bootstrap core CSS -->
<link href="design/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="design/css/shop-homepage.css" rel="stylesheet">

<%
	TMallDAO tmdao = new TMallDAO();
	ArrayList<TMallProductVO> allProduct = new ArrayList<TMallProductVO>();
	
	allProduct = (ArrayList<TMallProductVO>)request.getAttribute("allProduct");
	String language = request.getParameter("language1");
	String gender = request.getParameter("gender1");
	String age = request.getParameter("age1");
	String classTime = request.getParameter("classTime1");
	String url = "productSearch.main?";
	
	if(allProduct == null)
		allProduct = tmdao.getAllProductInfo();
	
	if(language != null)
		url += "&language1=" + language;
	if(gender != null)
		url += "&gender1=" + gender;
	if(age != null)
		url += "&age1=" + age;
	if(classTime != null)
		url += "&classTime1=" + classTime;
	
	int pageNum;			//페이지번호
	if(request.getParameter("pagenum") == null)
		pageNum=1;
	else
		pageNum = Integer.parseInt(request.getParameter("pagenum"));
	
	int productCnt = 16;	//한페이지에 보여줄 최대 물품수
	int pageCnt = 10;		//한페이지에 보여줄 페이지번호 수
	int pageBlock = (int)Math.ceil(pageNum/(double)pageCnt);
	int lastPageNum = (int)Math.ceil(allProduct.size()/(double)productCnt);
%>

</head>
<body>

<!-- ------------------------------------헤더--------------------------------------- -->
<jsp:include page="include/header.jsp" />

<!-- Page Content -->
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<h1 class="my-4">언어 선택</h1>
				<div class="list-group">
					<a href="productSearch.main?&language1=english"class="list-group-item">영어</a>
					<a href="productSearch.main?&language1=japanese" class="list-group-item">일본어</a>
					<a href="productSearch.main?&language1=chinese" class="list-group-item">중국어</a>
				</div>
			</div>
			<div class="col-lg-9">
				<div id="carouselExampleIndicators" class="carousel slide my-4"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner" role="listbox">
						<div class="carousel-item active">
							<img class="d-block img-fluid" src="design/banner/banner1.png" alt="First slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="design/banner/banner2.png" alt="Second slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="design/banner/banner3.png" alt="Third slide">
						</div>
					</div>
					<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a>
					<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span> <!-- 화살표 버튼(이후) -->
						<span class="sr-only">Next</span>
					</a>
				</div>
				
				<div id="section1">
					<!-- 검색구역 -->
					<form action="productSearch.main">
						<table class="table table-bordered">
							<tr>
								<td width="150" height="40" align="left">언어</td>
								<td align="left">
									<input type="radio" name="language1" value="english">영어
									<input type="radio" name="language1" value="japanese">일본어
									<input type="radio" name="language1" value="chinese">중국어
								</td>
							</tr>
							<tr>
								<td width="150" height="40" align="left">성별</td>
								<td align="left">
									<input type="radio" name="gender1" value="male">남
									<input type="radio" name="gender1" value="female">여
									<input type="radio" name="gender1" value="genderNoChoice">무관
								</td>
							</tr>
							<tr>
								<td width="150" height="40" align="left">나이</td>
								<td align="left">
									<input type="radio" name="age1" value="age10">20대이하
									<input type="radio" name="age1" value="age20">20대
									<input type="radio" name="age1" value="age30">30대
									<input type="radio" name="age1" value="age40">40대
									<input type="radio" name="age1" value="age50">50대이상
								</td>
							</tr>
							<tr>
								<td width="150" height="40" align="left">강의시간</td>
								<td align="left">
									<input type="radio" name="classTime1" value="cTime-1">1시간이하
									<input type="radio" name="classTime1" value="cTime1-2">1시간~2시간
									<input type="radio" name="classTime1" value="cTime2-3">2시간~3시간
									<input type="radio" name="classTime1" value="cTime3-">3시간이상
								</td>
							</tr>
						</table>
						<input type="submit" value="검색" id="submit" class="btn btn-secondary btn-block">
					</form>
					<!-- 검색구역 끝 -->
					<br>
					<div class="row">
						<div class="table-responsive">
							<table class="table table-hover">
								<%for(int i=(pageNum-1)*productCnt+1; i<=pageNum*productCnt; i=i+4){%>
								<tr>
									<%for(int j=i; j<i+4; j++){
										if(j<=allProduct.size()){
											DecimalFormat formatter = new DecimalFormat("###,###");
											String imgSrc = "";
											
											if(allProduct.get(j-1).getLanguage().toLowerCase().equals("english"))
												imgSrc = "design/img/english.png";
											if(allProduct.get(j-1).getLanguage().toLowerCase().equals("japanese"))
												imgSrc = "design/img/japan.png";
											if(allProduct.get(j-1).getLanguage().toLowerCase().equals("chinese"))
												imgSrc = "design/img/china.png";
									%>
									<td>
										<div class="card h-100">
											<a href="test.do?sSeqNum=<%=allProduct.get(j-1).getsSeq()%>">
												<img class="card-img-top" src=<%=imgSrc %> width="300" height="170" alt="">
											</a>
											<div class="card-body">
												<h4 class="card-title">
													<a href="test.do?sSeqNum=<%=allProduct.get(j-1).getsSeq()%>">
														<%=allProduct.get(j-1).getClassName() %>
													</a><!-- 제목란 -->
												</h4>
												<h5><%=formatter.format(allProduct.get(j-1).getClassPrice()) %></h5>
											</div><!-- 설명란 -->
											<div class="card-footer">
												<!-- <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small> -->
												<!-- 	★: &#9733 	☆:&#9734  -->
											</div>
										</div>
									</td>
									<%} else {%>
										<td></td>
									<%}
									}%>
								</tr>
								<%}%>
							</table>
						</div>
					</div>
					<br><br>
					<hr width="830">
					<div class="container">
						<h5 class="display-5">
							<p class="font-weight-bold text-center">페이지 이동</p>
						</h5>
					</div>
					<div class="container">
						<p class="text-center">
							<%if(pageNum <= 1) {%>
								<font class="font-weight-bold text-center"><kbd>처음</kbd></font>
								<font class="font-weight-bold text-secondary text-center">이전</font>
							<%} else { %>
								<font class="font-weight-bold">
									<a href="<%=url+"&pagenum=1"%>"><kbd>처음</kbd></a>
								</font>
								<font class="font-weight-bold">
									<a href="<%=url+"&pagenum="+(pageNum-1)%>" style="color: gray;">이전</a>
								</font>
							<%}%>

							&nbsp;
							
							<%for(int i=((pageBlock-1)*pageCnt+1); i<=pageBlock*pageCnt; i++){
								if(i > lastPageNum)
									break;
								if(pageNum == i){%>
									<font class="font-weight-bold text-secondary"><%=i %></font>
							<%  } else {%>
								<font class="text-secondary">
									<a href="<%=url+"&pagenum="+i%>" style="color: gray;"><%=i %></a>
								</font>
							<% 	}
							}%>

							&nbsp;

							<%if((pageNum == lastPageNum) || (allProduct.size() == 0)) {%>
								<font class="font-weight-bold text-secondary">다음 </font>
								<font class="font-weight-bold text-secondary"><kbd>마지막</kbd></font>
							<%} else {%>
								<font class="font-weight-bold text-secondary">
									<a href="<%=url+"&pagenum="+(pageNum+1)%>" style="color: gray;">다음</a>
								</font>
								<font class="font-weight-bold text-secondary">
									<a href="<%=url+"&pagenum="+lastPageNum%>" style="color: gray;"><kbd>마지막</kbd></a>
								</font>
							<%}%>
							
						<hr width="830">
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>

<jsp:include page="include/footer.jsp" />
<!-- Bootstrap core JavaScript -->
<script src="design/vendor/jquery/jquery.min.js"></script>
<script src="design/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>