<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.util.DbConnector"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DbConnector"%>
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
                    <li><a href="adminHome.jsp">Admin Home</a></li>
                                     <li><a href="cloudDetails.jsp">Cloud Details</a></li>                    
                 
                    <li class="current_page_item"><a href="#">Member Details</a></li>
                                        <li><a href="userrequest.jsp">UserRequest</a></li>                    
                                        <li><a href="deletefile.jsp">Delete File</a></li>
                    
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
                                        }%>
                                    <h3>Users</h3>
                                    <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <th>User</th>
                                            <th>Gender</th>
                                            <th>age</th>
                                            <th>Emailid</th>
                                            <th>Data</th>
                                            <th>Phone</th>
                                        </tr>
                                        <%

                                            Connection con = DbConnector.getConnection();
                                            PreparedStatement pstm = null;
                                            String sql = "select * from user where status='accepted'";
                                            pstm = con.prepareStatement(sql);
                                            ResultSet rs = pstm.executeQuery();
                                            while (rs.next()) {%>
                                        <tr>
                                            <td><%=rs.getString("userid")%></td>
                                            <td><%=rs.getString("gender")%></td>
                                            <td><%=rs.getString("age")%></td>
                                            <td><%=rs.getString("emailid")%></td>
                                            <td><%=rs.getString("date")%></td>
                                            <td><%=rs.getString("phone")%></td>
                                        </tr>

                                        <%}
                                        %>
                                    </table>
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
