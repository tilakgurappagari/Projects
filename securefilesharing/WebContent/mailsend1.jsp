<%@page import="java.sql.*"%>
<%@page import="com.util.DbConnector"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="javax.mail.internet.MimeMessage.RecipientType"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.*"%>
<%@page import="java.util.Properties"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

String email=request.getParameter("email");
String name=request.getParameter("un");
String fk=request.getParameter("fk");

Connection con = DbConnector.getConnection();
PreparedStatement pstm = null;
String st="accepted";
String sql = "update req set status='"+st+"' where user='"+name+"' and email='"+email+"' and fkey='"+fk+"'";
pstm = con.prepareStatement(sql);
int rs = pstm.executeUpdate();
if (rs>0) {

System.out.println(email);
final String un="nanig0000@gmail.com";
final String pwd="ramreddyg";
Properties props=new Properties();
props.put("mail.smtp.host", "smtp.gmail.com");
props.put("mail.smtp.port", "587");
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.starttls.enable", "true");
Session sess=Session.getInstance(props,new Authenticator() {
	protected PasswordAuthentication getPasswordAuthentication(){
		return new PasswordAuthentication(un, pwd);
		
	}
			});
try {
MimeMessage message=new MimeMessage(sess);

message.setFrom(new InternetAddress(un));
message.setRecipient(RecipientType.TO, new InternetAddress(email));
message.setSubject("Your File key");
message.setText("Hi.."+name+"\n your request is accepted By  Owner ..Please download file..... \n key="+fk);
Transport.send(message);
System.out.println("message sent...");
out.print("send");
response.sendRedirect("userHome.jsp?msg=successfully sent");
} catch (Exception e) {
// TODO Auto-generated catch block
e.printStackTrace();
}

}
%>
</body>
</html>