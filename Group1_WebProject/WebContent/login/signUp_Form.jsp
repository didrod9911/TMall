<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Page Title - SB Admin</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js"></script>
    </head>
    <body class="bg-primary">
    
    <jsp:include page="../include/header.jsp" />
<!-- ------------------------------------헤더--------------------------------------- -->
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5" >
                                    <div class="card-header"><h3 class="text-center font-weight-bold my-4">회원가입</h3></div>
                                    <div class="card-body">
                                        <form>
                                            <div class="form-group">
                                                <div>
             										<img width="120px" height="150px" align="middle" class="rounded mx-auto d-block" src="/Group1_WebProject/design/img/student.png" alt="네트워크 오류">
             									</div>
             								</div>
                                            
                                            <div class="form-group">
                                               
             									<input class="btn btn-primary btn-lg btn-block" type="button" value="구매자 가입" id="buyer">
             									
             								</div>
             								<div class="form-group">
                                               
             									
             									<h3 class="text-center font-weight-bold my-4">_______________________________________________</h3>
             									
             								</div>
             								
             								<div class="form-group">
                                                <div>
             										<img width="150px" height="150px" align="middle" class="rounded mx-auto d-block" src="/Group1_WebProject/design/img/teacher.png" alt="네트워크 오류">
             									</div>
             									
             									
             									
             								</div>
                                                
                                            <div class="form-group">
                                               
             									
             									<input class="btn btn-primary btn-lg btn-block" type="button" value="판매자 가입" id="seller">
             									
             								</div>
                                            
                                            
                                        </form>
                                    </div>
                                    <div class="card-footer text-center">
                                        <div class="small"><a href="login.login">기존 회원이라면 로그인으로</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            
            
            </div></div>
            
            
            <script type="text/javascript">
	$("#buyer").click(function() {
		var form = document.createElement('form');
        var objs;
        objs = document.createElement('input');
        objs.setAttribute('type', 'hidden');
        objs.setAttribute('name', 'flag');
        objs.setAttribute('value', 'buyer');
        form.appendChild(objs);
        form.setAttribute('method', 'post');
        form.setAttribute('action', "register.login");
        document.body.appendChild(form);
        form.submit();
	});
	$("#seller").click(function() {
		var form = document.createElement('form');
        var objs;
        objs = document.createElement('input');
        objs.setAttribute('type', 'hidden');
        objs.setAttribute('name', 'flag');
        objs.setAttribute('value', 'seller');
        form.appendChild(objs);
        form.setAttribute('method', 'post');
        form.setAttribute('action', "register.login");
        document.body.appendChild(form);
        form.submit();
	});
</script>

</body>
</html>