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
                                    <%if (request.getParameter("msg") != null) {
                                            out.println(request.getParameter("msg"));
                                        }
                                        Connection con = DbConnector.getConnection();
                                        PreparedStatement pstm = null;
                                        String sql = "select count(*) from cloud where status like 'Active'";
                                        pstm = con.prepareStatement(sql);
                                        ResultSet rs = pstm.executeQuery();
                                        String a = "";
                                        long no=0;
                                        if (rs.next()) {
                                            a = rs.getString(1);
                                            no = new Double(Math.random() *10000).longValue();
                                        }%>
                                    <h3>File Upload</h3>
                                    <form name="" action="UploadActions" method="post" enctype="multipart/form-data">
                                        <table width="70%">
                                            <tr style="height: 40px;"><td>Choose File</td><td> <input name="file" type="file" id="file"/>    </td></tr>
                                            <tr style="height: 40px;"><td>No.of Cloud</td><td> <%=a%>    </td></tr>
                                            <tr style="height: 40px;"><td>Captcha No :</td><td> <font color ="red"><%=no%></font><font> </td></tr>
                                             <input type="hidden" name ="hv" value="<%=no %>">
                                             <tr style="height: 40px;"><td>Enter Captecha</td><td> <input name="cap" type="text"/>    </td></tr>
                                            <tr style="height: 40px;"><td></td><td><input type="submit" value="Upload" style="height: 25px;width: 90px;"/></td></tr>
                                        </table>
                                       
                                    </form>
                                </div>
                            </div>
                            <div style="clear: both;">&nbsp;</div>
                        </div>
                        <!-- end #content -->

                        <!-- end #sidebar -->
                        <div style="clear: both;">&nbsp;</div>
                    </div>
                </div>
            </div>
            <!-- end #page -->
        </div>
        <div id="footer">
            <p></p>
        </div>
        <!-- end #footer -->
    </body>
</html>
