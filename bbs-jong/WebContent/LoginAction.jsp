<%@page import="java.sql.DatabaseMetaData"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="User.UserDAO" %>
<%@ page import="User.DatabaseState" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="User.User" scope="page"/>
<jsp:setProperty property="userID" name="user"/>
<jsp:setProperty property="userPassword" name="user"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<meta charset="EUC-KR">
<title>JSP �� �Խ��� ����Ʈ</title>
</head>
<body>
	<%
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(user.getUserID(), user.getUserPassword());
		PrintWriter script = response.getWriter();
		if(result == DatabaseState.SUCCESS){
			script.println("<script>");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}
		else if(result == DatabaseState.INCOSISTENCY_PASSWORD){
			script.println("<script>");
			script.println("alert('��й�ȣ�� Ʋ���ϴ�')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if(result == DatabaseState.NOTFOUND_ID){
			script.println("<script>");
			script.println("alert('���̵� �߰��� �� �����ϴ�.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if(result == DatabaseState.ERR){
			script.println("<script>");
			script.println("alert('������ ���̽� ������ �߻��Ͽ����ϴ�.')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
</body>
</html>