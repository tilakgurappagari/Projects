<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="java.sql.*"%>
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
                    <li ><a href="#">Admin Home</a></li>
                    <li><a href="cloudDetails.jsp">Cloud Details</a></li>                    
                    
                    <li><a href="viewUser.jsp">Member Details</a></li>
                                                            <li><a href="userrequest.jsp">UserRequest</a></li>                    
                    
                    <li class="current_page_item"><a href="deleteFile.jsp">Delete File</a></li>
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
                                <h3>Welcome Admin</h3>
                                
                                <h2>Select Cloud</h2>
                                <%
                                Connection conn = null;
                                String url = "jdbc:mysql://localhost:3306/";
                                String dbName = "ftp";
                                String driver = "com.mysql.jdbc.Driver";
                                String userName = "root";
                                String password = "";
                          
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    conn = DriverManager.getConnection(url + dbName, userName, password);
                                Statement st= conn.createStatement();
                                
                                ResultSet rs=st.executeQuery("select location from cloud");
                                String ss1=null;
                                
                                
                                %>
                                <form action="files.jsp">
                                   <select name="ss">
                                <%
                                while(rs.next())
                                {
                                	ss1=rs.getString(1);
                             
                                
                                %>
                             
                                <option value=<%=ss1%>  ><%=ss1 %></option>
                               
                                <%} %>
                                 </select>
                                <input type="submit" value="Select"></input>
                                </form>
                                <div style="clear: both;">&nbsp;</div>
                                <div class="entry">
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
