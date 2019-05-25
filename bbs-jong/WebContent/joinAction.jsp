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
<jsp:setProperty property="userName" name="user"/>
<jsp:setProperty property="userGender" name="user"/>
<jsp:setProperty property="userEmail" name="user"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<meta charset="EUC-KR">
<title>JSP 웹 게시판 사이트</title>
</head>
<body>
	<%
		PrintWriter script = response.getWriter();
		System.out.println("check1");
		if(user.getUserID() == null || user.getUserEmail()== null || user.getUserGender() == null ||
		user.getUserName() == null || user.getUserPassword() == null){
			System.out.println("check2");
			script.println("<script>");
			script.println("alert('입력이 안된 사항이 있습니다 다시확인해주세요')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			System.out.println("check3");
			UserDAO userDAO = new UserDAO();
			int result = userDAO.join(user);
	
			if(result == -1){
				System.out.println("check4");
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디 입니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else{
				System.out.println("check5");
				script.println("<script>");
				script.println("location.href='main.jsp'");
				script.println("</script>");
			}
		}
	%>
</body>
</html>