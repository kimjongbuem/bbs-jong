<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width", initial-scale="1">
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<meta charset="EUC-KR">
<title>JSP �� �Խ��� ����Ʈ</title>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/custom.css">
<meta charset="EUC-KR">
<title>JSP �Խ��� �� ����Ʈ</title>
</head>
<body>
	<div class="container" >
                  <div class="col-lg-4">
                      <div class="jumbotron" style="ppadding-top:20px">
                   		<h3 style="text-align:center;">ȸ������ ȭ��</h3>
                          <form id="loginForm" method="POST" action="LoginAction.jsp">
                              <div class="form-group">
                                  <input type="text" class="form-control" maxlength="20" name="userID" value="" placeholder="���̵�">
                              </div>
                              <div class="form-group">
                                  <input type="password" class="form-control" name="userPassword" value="" placeholder="��й�ȣ">
                              </div>
                              <div class="form-group">
                              	  <input type="text" class="form-control" name="userName"  value="" placeholder="�̸�">
                              </div>
                              <div class="form-group" style="text-align:center">
                              	<div class="btn-group-toggle" data-toggle="buttons">
                              	`<label class="btn btn-primary active">
                              		 <input type="radio" class="btn btn-primary" name="userGender" value="����" autocomplete="off">����
				  				</label>
				  				<label class="btn btn-primary">
				  					<input type="radio" class="btn btn-primary" name="userGender" value="����" autocomplete="off">����
                              	</label>	
                              	</div>
                              </div>
                              <div class="form-group">
                              	 <input type="email" class="form-control" name="userEmail" placeholder="�̸���">
                              </div>
                              <button type="submit" class="btn btn-success btn-block">ȸ������</button>
                          </form>
                      </div>
                  </div>
			</div>
</body>
</body>
</html>