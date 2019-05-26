<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.io.PrintWriter" %>
<%@page import="bbs.BbsDAO" %>
<%@page import="bbs.Bbs" %>
<%@page import="java.util.*" %>
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
<style type = "text/css">
	a, a:hover{
		color : black;
		text-decoration : none;
	}
</style>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") !=null){
			userID = (String)session.getAttribute("userID") ;
		}
		int pageNumber = 1; //�⺻ 1������
		if(request.getParameter("pageNumber")!=null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
		<%
			if(userID==null){
		%>
			<ul class="nav navbar-nav navbar-right">
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">�����ϱ�<span class="caret"></span></a>
		
			<ul class="dropdown-menu">
				<li><a href="Login.jsp">�α���</a></li>
				<li><a class="dropdown-item" href="join.jsp">ȸ������</a></li>
			</ul>
			</li>
		</ul>
		<%
			}else{
		%>
				<ul class="nav navbar-nav navbar-right">
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">ȸ������<span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a class="dropdown-item" href="logoutAction.jsp">�α׾ƿ�</a></li>
			</ul>
			</li>
		</ul>
		<%
			}
		%>
	</div>
	</nav>
	<table class="table">
  <caption style="color :pink;"><h3>�Խ��� �׸�</h3></caption>
  <thead>
    <tr>
      <th scope="col">��ȣ</th>
      <th scope="col">����</th>
      <th scope="col">�ۼ���</th>
      <th scope="col">�ۼ���</th>
    </tr>
  </thead>
  <tbody>
  	<%
  		BbsDAO bbsDAO = new BbsDAO();
  		ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
  		for(int i = 0; i<list.size();i++){
  	%>
    <tr>
      <th scope="row"><%=list.get(i).getBbsID() %></th>
       <td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle()%></a></td>
      <td><%=list.get(i).getUserID() %></td>
      <td><%=list.get(i).getBbsDate().substring(0,11)+list.get(i).getBbsDate().substring(11,13)+"��" + list.get(i).getBbsDate().substring(14,16) +"��" %></td>
    </tr>
    <%
  		}
    %>
  </tbody>
</table>
	<%
		if(pageNumber !=1){
	%>
		<a href="bbs.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-success btn-arrow-left">����������</a>
	<% 		
		}
	%>
		<%
		if(bbsDAO.nextPage(pageNumber + 1)){
	%>
		<a href="bbs.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn-success btn-arrow-right">����������</a>
	<% 		
		}
	%>
	<div class="text-right">
		<a href="write.jsp" class="btn btn-primary">�۾���</a>
	</div>
	</body>
	</html>