<%@page import="tMallDAO.TMallDAO"%>
<%@page import="tMallVO.TMalltUserVO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="tMallVO.TMallProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TMall_결제화면</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<style type="text/css">
	a { text-decoration:none } 
</style>
<style>
	table{
		margin-left:auto;
		margin-right:auto;
	}
	#div_root{
		margin:0 auto;
		width:1500px;
		height:100%;
	}
	#header{
		background-color: white;
		height:10px;
	}
	#blank1{
		background-color: white;
		width:100%;
		height:80px;
		float:left;
	}
	#nav0{
		background-color: white;
		width:100%;
		height:20%;
		float:left;
	}
	#nav1{
		background-color: white;
		width:60%;
		height:600px;
		float:left;
	}
	#nav1-1{
		background-color: white;
		width:95%;
		height:598px;
		float:left;
		border: 1px solid black;
	}
	#section1{
		background-color: white;
		width:40%;
		height:600px;
		float:left;
	}
	#section1-1{
		background-color: white;
		width:95%;
		height:598px;
		float:right;
		border: 1px solid black;
	}
	#blank2{
		background-color: white;
		width:100%;
		height:50px;
		float:left;
	}
	#footer{
		background-color: white;
	}
</style>

</head>
<%
	TMallProductVO product = (TMallProductVO)request.getAttribute("product");
	TMalltUserVO user = (TMalltUserVO)session.getAttribute("user");	
	int price = 100;
	int sSeq = product.getsSeq();
	String bID = "";
	String language = "";
	String imgSrc = "";
	DecimalFormat formatter = new DecimalFormat("###,###");	
	
	if(user == null){%>
		<script type="text/javascript">
			alert("로그인이 필요한 페이지입니다");
			location.href="login/login.jsp";
		</script>
	<%} else if(user.getFlag() == 2) {%>
		<script type="text/javascript">
			alert("판매자ID로는 구매할 수 없습니다");
			history.back();
		</script>
	<%} else {
		bID = user.getId();
	}
	
	if(product.getLanguage().toLowerCase().equals("english")){
		imgSrc = "design/img/english.png";
		language = "영어";
	}
	if(product.getLanguage().toLowerCase().equals("japanese")){
		imgSrc = "design/img/japan.png";
		language = "일본어";
	}
	if(product.getLanguage().toLowerCase().equals("chinese")){
		imgSrc = "design/img/china.png";
		language = "중국어";
	}
%>

<body>
	<jsp:include page="../include/header.jsp" />

	<div id="div_root">
		<div id="header">
			<h2>　</h2>
		</div>
		<div id="blank1"><h2>　</h2></div>
		<div id="nav0">
			<h2><font size="6" style="font-weight: bold;">결제하기</font></h2>
		</div>
		<div id="nav1">
			<div id="nav1-1">
				<table border="0" width="800px" style="margin-left: 20px; margin-top: 20px;">
					<tr>
						<td colspan="2" height="50px"><font size="5" style="font-weight: bold;"># 주문내역</font></td>
					</tr>
					<tr>
						<td width="160px" height="160px">
							<img src="<%=imgSrc %>" width="150" height="150">
						</td>
						<td style="vertical-align: top;">
							<font size="4" style="font-weight: bold;">
								&nbsp;<a href="test.do?sSeqNum=<%=product.getsSeq()%>"><%=product.getClassName()%></a>
							</font><br>
							<font size="3" style="font-weight: bold;">&nbsp;판매자&nbsp;:&nbsp;<%=product.getsNickname()%></font>
						</td>
					</tr>
				</table>
				<br>
				<table border="0" width="800px" height="40px" style="margin-left: 20px;">
					<tr>
						<td width="500px"><font size="5" style="font-weight: bold;">기본항목</font></td>
						<td width="150px"><font size="5" style="font-weight: bold;">작업일</font></td>
						<td width="150px" style="text-align: right;">
							<font size="5" style="font-weight: bold;">가격</font>
						</td>
					</tr>
					<tr>
						<td colspan="3"><hr width="100%"></td>
					</tr>
				</table>
				<table border="0" width="800px" height="180px" style="margin-left: 20px;">
					<tr>
						<td width="500px"><font size="4" style="font-weight: bold;">항목</font></td>
						<td width="150px"><font size="4" style="font-weight: bold;">365일</font></td>
						<td width="150px" style="text-align: right;">
							<font size="4" style="font-weight: bold;">
								<%=formatter.format(product.getClassPrice()) %>
							</font>
						</td>
					</tr>
					<tr>
						<td><font size="4" style="font-weight: bold;">1. 언어</font></td>
						<td colspan="2"><font size="4" style="font-weight: bold;"><%=language %></font></td>
					</tr>
					<tr>
						<td><font size="4" style="font-weight: bold;">2. 시간</font></td>
						<td colspan="2"><font size="4" style="font-weight: bold;"><%=product.getClassTime() %>분</font></td>
					</tr>
					<tr>
						<td><font size="4" style="font-weight: bold;">3. 강의횟수</font></td>
						<td colspan="2"><font size="4" style="font-weight: bold;"><%=product.getClassNum() %>회</font></td>
					</tr>
					<tr>
						<td><font size="4" style="font-weight: bold;">4. 강의장소</font></td>
						<td colspan="2"><font size="4" style="font-weight: bold;"><%=product.getClassPlace() %></font></td>
					</tr>
				</table>
			</div>
		</div>
		<div id="section1">
			<div id="section1-1">
				<table border="0" width="530px" style="margin-top: 20px;">
					<tr>
						<td width="200px" height="50px"><font size="4" style="font-weight: bold;">총 서비스 금액</font></td>
						<td style="text-align: right;">
							<font size="4" style="font-weight: bold;"><%=formatter.format(product.getClassPrice())%> 원</font>
						</td>
					</tr>
					<tr>
						<td height="50px"><font size="4" style="font-weight: bold;">쿠폰할인</font></td>
						<td style="text-align: right;"><font size="4" style="font-weight: bold;">0 원</font></td>
					</tr>
					<tr>
						<td height="50px"><font size="4" style="font-weight: bold;">캐시사용</font></td>
						<td style="text-align: right;"><font size="4" style="font-weight: bold;">0 원</font></td>
					</tr>
					<tr>
						<td colspan="2"><hr width="100%"></td>
					</tr>
					<tr>
						<td height="80px"><font size="4" style="font-weight: bold;">총 결제금액</font></td>
						<td style="text-align: right;">
							<font size="5" style="font-weight: bold;"><%=formatter.format(product.getClassPrice())%> 원</font>
						</td>
					</tr>
				</table>
				
				<input type="checkbox" name="payCheck" id="payCheck" style="margin-left: 20px">
				상품,결제,주문정보를 확인하였으며 주문에 동의합니다(필수)<br>
				<input type="button" value="결제하기" id="payButton" onclick="payButton_click();"
						style=	"margin-left: 20px;
								text-align: center;
								font-size: 20px;
								padding: 10px 224px;
								border-radius: 5px;
								background-color: yellow;">
				
				<script type="text/javascript">
					function payButton_click(){
						var chk = false;
						if(document.getElementById('payCheck').checked)
							chk = true;
						
						if(chk){
							alert("결제를 진행합니다");
							
							var IMP = window.IMP;
							IMP.init('');
							
							IMP.request_pay({
							    pg : 'inicis',
							    pay_method : 'card',
							    merchant_uid : 'merchant_' + new Date().getTime(),
							    name : '상품',
							    amount : <%=price%>,
							    buyer_email : 'iamport@siot.do',
							    buyer_name : '구매자이름',
							    buyer_tel : '010-1234-5678',
							    buyer_addr : '서울특별시 강남구 삼성동',
							    buyer_postcode : '123-456',
							    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
							}, function(rsp) {
							    if ( rsp.success ) {
							        var msg = '결제가 완료되었습니다.\n홈 화면으로 돌아갑니다\n';
							        msg += '고유ID : ' + rsp.imp_uid;
							        msg += '상점 거래ID : ' + rsp.merchant_uid;
							        msg += '결제 금액 : ' + rsp.paid_amount;
							        msg += '카드 승인번호 : ' + rsp.apply_num;
							        alert(msg);
							        location.href="paymentConfirmed.main?sSeqNum=<%=sSeq%>"+"&bID=<%=bID%>";
							    } else {
							        var msg = '결제에 실패하였습니다.';
							        msg += '에러내용 : ' + rsp.error_msg;
							        alert(msg);
							    }
							});
							
						} else {
							alert("주문정보 확인에 동의해주세요");
						}
					}
				</script>
				
			</div>
		</div>
		<div id="blank2"><h2>　</h2></div>
		<div id="footer">
			<h2>　</h2>
		</div>
	</div>	

	<jsp:include page="../include/footer.jsp" />
	
</body>
</html>