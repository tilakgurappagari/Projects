<%@page import="java.sql.ResultSet"%>
<%@page import="com.util.DbConnector"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
                    <li><a href="userHome.jsp">User Home</a></li>
                    <li class="current_page_item"><a href="#">Upload</a></li>
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
<%

 long no = new Double(Math.random() *10000).longValue();
String file = request.getParameter("filename");
%>
<form action="./FileDownload">
File : <%=file%>
<input type="hidden" name="ip" value="<%=request.getParameter("ip") %>">
<input type="hidden" name="filename" value="<%=file %>">
<input type="hidden" name="cv" value="<%=no %>">
<table>
<tr><td>Captcha</td> <td><%=no %></td></tr>
<tr><td>Please Enter Captcha</td><td> <input Type="text" name="vcode"></inputType></td></tr>
</table>
<input type ="submit" value="Verify"/>
</form>






</body>
</html>