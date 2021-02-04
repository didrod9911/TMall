<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="tMallVO.TMallPurchaseListVO"%>
<%@page import="tMallDAO.TMallDAO"%>
<%@page import="tMallVO.TMalltUserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>회원 정보 수정</title>
<link href="css/styles.css" rel="stylesheet" />
<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
<script src="../design/vendor/jquery/jquery.js"></script>
<%
	TMallDAO tmdao = new TMallDAO();
	TMalltUserVO vo = (TMalltUserVO) session.getAttribute("user");
	ArrayList<TMallPurchaseListVO> allPList = tmdao.getAllPList(vo.getId());
%>
</head>
<body>

<jsp:include page="../include/header.jsp" />

	<div>
		<main>
		<div>
			<h1 class="mt-4">개인정보 수정</h1>
			<p></p>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fa-area mr-1"></i>회원 정보
				</div>
				<div class="card-body">
					<form action="ModifyConfirm.modify" method="post">
						<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
							<tr>
								<th width="300px">아이디</th>
								<td align="center">
									<%= vo.getId() %>
									<input type="hidden" name="id" value="<%= vo.getId() %>">
								</td>
							<tr>
							<tr>
								<th width="300px">비밀번호</th>
								<td class="table-active" align="center">
									<input type="password" name="pw" value="<%= vo.getPw() %>">
								</td>
							<tr>
							<tr>
								<th width="300px">이름</th>
								<td class="table-active" align="center"><input type="text" name="name" size="6" value="<%= vo.getName() %>">
								</td>
							<tr>
							<tr>
								<th width="300px">성별</th>
								<td class="table-active" align="center">
									<input type="text" name="gender" value="<%= vo.getGender() %>">
									<!--<select class="custom-select my-1 mr-sm-2" name="gender" id="gender">
										<option selected value="1">남</option>
										<option value="2">여</option>
									</select>-->
								</td>
							<tr>
							<tr>
								<th width="300px">나이</th>
								<td class="table-active" align="center">
									<input type="text" name="age" value="<%= vo.getAge() %>">
								</td>
							<tr>
							<tr>
								<th width="300px">닉네임</th>
								<td class="table-active" align="center">
									<input type="text" name="nickname" value="<%= vo.getNickname() %>" id="nickname">
									<span id="nickCheck"></span>
								</td>
							<tr>
							<tr>
								<th width="300px">전화번호</th>
								<td class="table-active" align="center">
									<input type="text" name="tel" value="<%= vo.getTel() %>">
								</td>
							<tr>
							<tr>
								<th width="300px">주소</th>
								<td class="table-active" align="center">
									<input type="text" name="address" value="<%= vo.getAddress() %>">
								</td>
							<tr>
						</table>
						<div class="d-flex">
							<div>
								<input class="btn btn-danger " type="button" value="취소" onclick="history.back()">
							</div>
							<div class="ml-auto">
								<input class="btn btn-primary" type="submit" value="수정완료">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table mr-1"></i> 구매한 강의 목록
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
						<tr>
							<th>강의명</th>
							<th>구매금액</th>
							<th>구입횟수</th>
						</tr>
						<%
						DecimalFormat formatter = new DecimalFormat("###,###");
						for(int i=0; i<allPList.size(); i++){%>
						<tr>
							<td>
								<font size="4"><%=allPList.get(i).getClassName() %></font>
							</td>
							<td>
								<font size="4"><%=formatter.format(allPList.get(i).getClassPrice()) %></font>
							</td>
							<td>
								<font size="4"><%=formatter.format(allPList.get(i).getPurchaseCnt()) %>회</font>
							</td>
						</tr>
						<%}%>
					</table>
				</div>
			</div>
		</div>
		</main>
	</div>

	<jsp:include page="../include/footer.jsp" />
           
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../design/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/datatables-demo.js"></script>
        
        <script>
   $('#nickname').blur(function() {
      
      var nickname = $('#nickname').val();
      
      $.ajax({
         async:true,
         type:'post', // 요청 보내는 방식 (GET, POST)
         data: {"sendData" : nickname}, // 요청을 보내면서 같이 보낼 데이터
         dataType: "text", // 어떤 형식의 데이터를 받을 건지
         url:"Overlap.modify", // 요청 보낼 주소
         
         success:function(data){
            console.log(data);
            if(data != '0'){
               $('#nickCheck').css("color", '#FF1493');
               $('#nickCheck').text("중복된 닉네임");
               // $("#divInputnickname").addClass("has-error")
               // $("#divInputnickname").removeClass("has-success")
               $("#nickname").focus();   
            }else {
                    $('#nickCheck').css("color", '#4169E1');
                    $('#nickCheck').text("사용가능한 닉네임");
                    //아이디가 존제할 경우 빨깡으로 처리하는 디자인
                    // $("#divInputId").addClass("has-success")
                    // $("#divInputId").removeClass("has-error")
                    $("#nickname").focus();
            }
         },
         error:function(error){
            alert(error);
         }
      });
   });
</script>

</body>
</html>