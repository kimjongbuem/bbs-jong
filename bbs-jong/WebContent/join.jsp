<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width", initial-scale="1">
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<meta charset="EUC-KR">
<title>JSP 웹 게시판 사이트</title>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/custom.css">
<meta charset="EUC-KR">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<div class="container" >
                  <div class="col-lg-4">
                      <div class="jumbotron" style="ppadding-top:20px">
                   		<h3 style="text-align:center;">회원가입 화면</h3>
                          <form id="loginForm" method="POST" action="LoginAction.jsp">
                              <div class="form-group">
                                  <input type="text" class="form-control" maxlength="20" name="userID" value="" placeholder="아이디">
                              </div>
                              <div class="form-group">
                                  <input type="password" class="form-control" name="userPassword" value="" placeholder="비밀번호">
                              </div>
                              <div class="form-group">
                              	  <input type="text" class="form-control" name="userName"  value="" placeholder="이름">
                              </div>
                              <div class="form-group" style="text-align:center">
                              	<div class="btn-group-toggle" data-toggle="buttons">
                              	`<label class="btn btn-primary active">
                              		 <input type="radio" class="btn btn-primary" name="userGender" value="남자" autocomplete="off">남자
				  				</label>
				  				<label class="btn btn-primary">
				  					<input type="radio" class="btn btn-primary" name="userGender" value="여자" autocomplete="off">여자
                              	</label>	
                              	</div>
                              </div>
                              <div class="form-group">
                              	 <input type="email" class="form-control" name="userEmail" placeholder="이메일">
                              </div>
                              <button type="submit" class="btn btn-success btn-block">회원가입</button>
                          </form>
                      </div>
                  </div>
			</div>
</body>
</body>
</html>