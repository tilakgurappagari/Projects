<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.util.DbConnector"%>
<%@page import="java.sql.PreparedStatement"%>
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
                                <div class="entry"><%if (request.getParameter("ms") != null) {
                                            out.println(request.getParameter("ms"));
                                        }%>
                                    <h1>Please enter Key to modify</h1>
<form action="updateaction.jsp">

Enter Key:<input type="text" name="keys"><br>
<input type="submit" value="submit">


</form>
                                   
                                    <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                           <form>
                                            <th>FileName</th>
                                            
                                            
                                        </tr>
                                        <%

                                            Connection con = DbConnector.getConnection();
                                            PreparedStatement pstm = null;
                                            String sql = "select * from transaction where user='"+session.getAttribute("userid")+"' order by date_";
                                            pstm = con.prepareStatement(sql);
                                            ResultSet rs = pstm.executeQuery();
                                            while (rs.next()) {
                                            String k=rs.getString("key_");
                                            System.out.println(k);
                                            
                                            
                                            %>
                                        <tr>
                                          
                                            <td><%=rs.getString(2)%></td>
                                           
                                           
                                            <td><a href="updatefile.jsp?ran=<%=rs.getString("key_")%>&filename=<%=rs.getString(2)%>&k=<%=rs.getString("key_")%>" >Click Here Modify</a></td>
                                           
                                            <td></td>
                                            <%}%>
                                        </tr>

                                        
                                        </form>
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
