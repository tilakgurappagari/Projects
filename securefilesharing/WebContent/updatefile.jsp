<%@page import="com.util.DbConnector"%>
<%@page import="java.sql.*"%>
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
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <title>Cloud</title>
        <link href="http://fonts.googleapis.com/css?family=Arvo" rel="stylesheet" type="text/css" />
        <link href="http://fonts.googleapis.com/css?family=Coda:400,800" rel="stylesheet" type="text/css" />
        <link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <body>
        <div id="menu-wrapper">
            <div id="menu">
                <ul>
                    <li class="current_page_item"><a href="#">User Home</a></li>
                    <li><a href="fileUpload.jsp">Upload</a></li>
                    <li><a href="sendmsg.jsp">Send Message</a></li>
                      <li><a href="modify.jsp">Modify</a></li>
                    <li><a href="report.jsp">Report</a></li>
                    <li><a href="index.jsp">Log out</a></li>
                </ul>
            </div>
            <!-- end #menu -->
        </div>
        <div id="header-wrapper">
            <div id="header">
                <div id="logo">
                    <h1><a href="#">secure file sharing</span></a></h1>                    
                </div>
            </div>
        </div>
        <div id="banner"><img src="images/img04.jpg" width="1000" height="350" alt="" /></div>
        <div id="wrapper">
            <!-- end #header -->
            <div id="page">
                <div id="page-bgtop">
                    <div id="page-bgbtm">
                        <div id="content">
                            <div class="post">                               
                                <div style="clear: both;">&nbsp;</div>
                                <div class="entry">
<%

String ran=request.getParameter("ran");
String filename=request.getParameter("filename");
String s=session.getAttribute("userid").toString();
Connection con = DbConnector.getConnection();
PreparedStatement pstm = null;
String sql = "select emailid from user where userid='"+session.getAttribute("userid")+"' ";
pstm = con.prepareStatement(sql);
ResultSet rs = pstm.executeQuery();
if (rs.next()) {
String email=rs.getString("emailid");
System.out.println(email);
final String un="rajkumar.coign@gmail.com";
final String pwd="success*";
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
message.setText("Your File Name="+filename+"\n your File Key="+ran);
Transport.send(message);
System.out.println("message send...");
out.print("send");
} catch (Exception e) {
// TODO Auto-generated catch block
e.printStackTrace();
}

}
%>
<h1>Please Check your email and enter Key to modify</h1>
<form action="updateaction.jsp">

Enter Key:<input type="text" name="keys"><br>
<input type="submit" value="submit">


</form>

</body>
</html>