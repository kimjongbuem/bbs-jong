<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
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
</head>
<body>
	<%
	PrintWriter script = response.getWriter();
	String userID = null;
	if(session.getAttribute("userID") !=null){
		userID = (String)session.getAttribute("userID") ;
	}
	if(userID == null){
		script.println("<script>");
		script.println("alert('�α����� �ϼ���')");
		script.println("location.href='login.jsp");
		script.println("</script>");
	}
	int bbsID = 0;
	if(request.getParameter("bbsID") != null){
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}
	if(bbsID == 0){
		script.println("<script>");
		script.println("alert('�Է��� �ȵ� ������ �ֽ��ϴ� �ٽ�Ȯ�����ּ���')");
		script.println("location.href='bbs.jsp");
		script.println("</script>");
	}
	Bbs bbs = new BbsDAO().getBbs(bbsID);
	if(!userID.equals(bbs.getUserID())){
		script.println("<script>");
		script.println("alert('������ �����ϴ�.')");
		script.println("location.href='bbs.jsp");
		script.println("</script>");
	}
	%>
	<nav class="navbar navbar-default">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed"
		data-toggle="collapse" data-target="#navbar"
		aria-expanded="false"
		>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="main.jsp">JSP �Խ��� �� ����Ʈ</a>
	</div>
	<div class="collapse navbar-collapse" id="navbar">
		<ul class="nav navbar-nav">
			<li><a href="main.jsp">����</a></li>
			<li class="active"><a href="bbs.jsp">�Խ���</a></li>
		</ul>
		
				<ul class="nav navbar-nav navbar-right">
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">ȸ������<span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a class="dropdown-item" href="logoutAction.jsp">�α׾ƿ�</a></li>
			</ul>
			</li>
		</ul>
	</div>
	</nav>
	<form method="Post" action="updateAction.jsp?bbsID=<%=bbsID %>">
		<div class="container">
		<div class= "row">
			<table class ="table table-striped" style="text-align: center; border : 1px; solid #dddddd">
				<thead>
					<tr>
					 <th colspan="2" style="background-color: #fdd12d; text-align:center">�Խ��� �ۼ��� ���</th>
					</tr>
				</thead>
				<tbody>
				<tr>
					<td><input type="text" placeholder="����" name="bbsTitle" class="form-control" maxlength="50" value="<%=bbs.getBbsTitle()%>"></td>
				</tr>
				<tr>	
					<td><textarea placeholder="�� ����" name="bbsContent" class="form-control" maxlength="4096" style="height:350px"><%=bbs.getBbsContent() %></textarea></td>
				</tr>
				</tbody>
			</table>
			<input type="submit" class="btn btn-primary pull-right" value="�ۼ���">
		</div>
	</div>
	</form>

	</body>
	</html>