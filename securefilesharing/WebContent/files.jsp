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
                    <li class="current_page_item"><a href="#">Admin Home</a></li>
                    <li><a href="createCloud.jsp">Create Cloud</a></li>
                    <li><a href="cloudDetails.jsp">Cloud Details</a></li>                    
                    
                    <li><a href="viewUser.jsp">Member Details</a></li>
                    
                    <li><a href="deleteFile.jsp">Delete File</a></li>
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
                                
                           <table><tr><th>Filename</th><th>Delete</th></tr>
                                <%
                                String name=request.getParameter("ss");
                                System.out.println(name);
                                Connection conn = null;
                                String url = "jdbc:mysql://localhost:3306/";
                                String dbName = "ftp";
                                String driver = "com.mysql.jdbc.Driver";
                                String userName = "root";
                                String password = "";
                          
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    conn = DriverManager.getConnection(url + dbName, userName, password);
                                Statement st= conn.createStatement();
                                
                                ResultSet rs=st.executeQuery("select filename from transaction where location='"+name+"'");
                                
                                String ss1=null;
                                
                                
                                %>
                             
                                <%
                                while(rs.next())
                                {
                                	ss1=rs.getString(1);
                             
                                
                                %>
                                <tr>
                                <td><%=ss1 %></td>
                                <td><a href="del.jsp?msg=<%=ss1%>&msg2=<%=name%>">Delete</a></td>
                                </tr>
                                
                     
                                <%} %>
                         </table>
                           <table border="2" align="center" color="green">
                                <tr><th>Location</th><th>No of Files</th></tr>
                                <% Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ftp","root","");
PreparedStatement pstm = null;
    String sql = "select location from transaction where location='Banglore'";
    pstm = con.prepareStatement(sql);
    ResultSet rs2 = pstm.executeQuery();
    int i=0;
    while (rs2.next()) {
    i++;%>


<%}%><tr>
<td> Banglore</td>

<td> <%=i %></td>
</tr>

         <% Class.forName("com.mysql.jdbc.Driver");
Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/ftp","root","");
PreparedStatement pstm1 = null;
    String sql1 = "select location from transaction where location='Chennai'";
    pstm1 = con1.prepareStatement(sql1);
    ResultSet rs1 = pstm1.executeQuery();
    int j=0;
    while (rs1.next()) {
    j++;%>


<%}%><tr>
<td> Chennai</td>

<td> <%=j %></td>
</tr>
                                
                                
       </table>  
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
