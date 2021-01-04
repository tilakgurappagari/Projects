<%@page import="com.util.DbConnector"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

String s=session.getAttribute("userid").toString();
String e=session.getAttribute("em").toString();
String ow=request.getParameter("ow");
String fk=request.getParameter("fk");
String filename=request.getParameter("filename");
String st="pending";

Connection con = DbConnector.getConnection();
PreparedStatement pstm = null;

pstm = con.prepareStatement("insert into req values('"+s+"','"+e+"','"+ow+"','"+filename+"','"+fk+"','"+st+"')");
int i=pstm.executeUpdate();
if(i>0){
	response.sendRedirect("userHome.jsp?msg=req send successfully");
}

%>
</body>
</html>