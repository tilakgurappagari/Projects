<%@page import="java.sql.*"%>
<%@page import="DbPack.TrippleDes"%>
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
                                <div class="entry">
                                 <%
                                String key1=request.getParameter("keys");
                                 System.out.println(key1);
                                 Connection con = DbConnector.getConnection();
                                    Statement st = con.createStatement();
                                    Statement st2 = con.createStatement();
                                    
                                    ResultSet rs = st.executeQuery("select *from transaction where key_= '" + key1 + "' ");
                                    
                                    if (rs.next()) {
                                    	String fi=rs.getString("filename");
                                    session.setAttribute("fname", fi);
                                    	 ResultSet rs1 = st2.executeQuery("select * from transaction where filename = '" + fi + "' ");
                                    	if(rs1.next()) {
                                        if (request.getParameter("keys").equals(rs1.getString("key_"))) {
                                            String getCipher = rs1.getString("data");
                                            System.out.println(getCipher);
                                            String plainText = new TrippleDes().decrypt(getCipher);
                                %>
                                <form action="./updatefile" method="post">
                                    <textarea name="gets" style="width: 400px;height: 200px;"> <%=plainText%></textarea><br>
                                    <input type="submit" value="Update And Save"/>
                                </form>
                                   

                                <%
                                            // out.println(plainText);

                                        }else{
                                            out.println("File Key Error");
                                        }
                                    }}
                                                                       else{
                                        out.println("File Error...!");
                                                                       }
                                %>

</body>
</html>