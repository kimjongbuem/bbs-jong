<%@page import="java.sql.DatabaseMetaData"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<meta charset="EUC-KR">
<title>JSP �� �Խ��� ����Ʈ</title>
</head>
<body>
	<%
		session.invalidate();
	%>
	<script>
		location.href="main.jsp";
	</script>
</body>
</html>