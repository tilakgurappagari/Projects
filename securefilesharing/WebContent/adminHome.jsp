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
                   
                    <li><a href="cloudDetails.jsp">Cloud Details</a></li>                    
                    
                    <li><a href="viewUser.jsp">Member Details</a></li>
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
                                <h3>Welcome Admin</h3>
                                              <li><a href="graph.jsp">View Graph</a></li>
                                <table border="2" align="center" color="green">
                                <center><h1>Storage of files</h1></center>
                                <tr><th>Location</th><th>No of Files</th></tr>
                                <% Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ftp","root","");
PreparedStatement pstm = null;
    String sql = "select location from transaction where location='Banglore'";
    pstm = con.prepareStatement(sql);
    ResultSet rs = pstm.executeQuery();
    int i=0;
    while (rs.next()) {
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

<td> <%=j %>



</td>
<% 
PreparedStatement ps=con1.prepareStatement("update fileloc set Chennai='"+j+"',Bangalore='"+i+"' where fid='1'");
ps.executeUpdate();
%>
</tr>
                                
                                
       </table> 
       <table border="2" align="center" color="green">
     <br></br><br></br> <center> <h1>User Messages</h1> </center>
                                <tr><th>MsgId</th><th>UserID</th><th>Message</th></tr>
                                <% Class.forName("com.mysql.jdbc.Driver");
Connection con3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/ftp","root","");
PreparedStatement pstm3 = null;
    String sql3 = "select * from usermsgfileloc";
    pstm3 = con3.prepareStatement(sql3);
    ResultSet rs3 = pstm3.executeQuery();
    int k=0;
    while (rs3.next()) {
    k++;
    String ui=rs3.getString(1);
    String msg=rs3.getString(2);
    %>


<tr>
<td> <%=k %></td>

<td> <%=ui %></td>
<td> <%=msg %></td>
</tr><%}%></table>                     
                        <center>   <table><br></br><br></br><
                           <h1>Flies in cloud</h1>
                           
                           <tr><th>FileId</th><th>Filename</th></tr>
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
                                
                                ResultSet rs5=st.executeQuery("select distinct filename from transaction ");
                                
                                String ss1=null,ss2=null;
                                int count=1;
                                
                                %>
                             
                                <%
                                while(rs5.next())
                                {
                                	ss1=rs5.getString(1);
                                	
                             
                                
                                %>
                                <tr>
                               
                                <td><%=count %></td>
                                 <td><%=ss1 %></td>
                                </tr>
                                <%
                                
                                count++;
                                } %>
                                </table></center>
                                
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
