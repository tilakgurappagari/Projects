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
String msg=request.getParameter("msg");
System.out.println(s);

Connection con = DbConnector.getConnection();
PreparedStatement pstm = null;
String sql = "insert into usermsgfileloc values('"+s+"','"+msg+"')";
pstm = con.prepareStatement(sql);
int i=pstm.executeUpdate();
if(i>0){
	response.sendRedirect("sendmsg.jsp?msg=Successfully Sent");
}
else{
	out.println("sendingfail");
}

%>
</body>
</html>