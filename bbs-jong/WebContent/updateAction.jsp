<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>

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
}else{
	BbsDAO bbsDAO =new BbsDAO();
	int result = bbsDAO.update(bbsID, request.getParameter("bbsTitle"),request.getParameter("bbsContent"));
		if(result==-1){
		script.println("<script>");
		script.println("alert('�� ������ ������.')");
		script.println("history.back()");
		script.println("</script>");
	}else{
		script.println("<script>");
		script.println("location.href='bbs.jsp'");
		script.println("</script>");
	}
}
%>


