<%@ page language="java" contentType="text/html; charset=ISO-8859-1"   pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="org.jfree.chart.ChartFactory" %>
<%@ page import="org.jfree.chart.ChartUtilities"%>
<%@ page import="org.jfree.chart.JFreeChart" %>
<%@ page import="org.jfree.chart.plot.PlotOrientation"%>
<%@ page import="org.jfree.data.*" %>
<%@ page import="org.jfree.data.jdbc.JDBCCategoryDataset"%>
<%@ page import="org.jfree.chart.renderer.category.CategoryItemRenderer"%>
<%@ page import="org.jfree.chart.plot.CategoryPlot"%>
<%@ page import="org.jfree.chart.plot.PlotOrientation"%>
 <%@ page import="java.awt.Color"%>

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
                    <li class="current_page_item"><a href="adminHome.jsp">Admin Home</a></li>
                   
                    <li><a href="cloudDetails.jsp">Cloud Details</a></li>                    
                    
                    <li><a href="viewUser.jsp">Member Details</a></li>
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
                       
          <%
String query="SELECT * from fileloc";
JDBCCategoryDataset dataset=new JDBCCategoryDataset("jdbc:mysql://localhost:3306/ftp",
"com.mysql.jdbc.Driver","root","");
 
dataset.executeQuery( query);
JFreeChart chart = ChartFactory .createBarChart3D(
"",
"",
"",
dataset,
PlotOrientation.VERTICAL,true, true, false);
 
CategoryPlot plot = chart.getCategoryPlot();
CategoryItemRenderer renderer = plot.getRenderer();
 
renderer.setSeriesPaint(0, Color.green);
try
{
ChartUtilities.saveChartAsJPEG(new File("Z:\\secue\\securefilesharing\\WebContent\\chart.jpg"), chart, 500, 450);
}
catch (IOException e)
{
System.out.println("Problem in creating chart.");
}
%>
                     
                        
                        <img src="chart.jpg" />
                        
                        
                        <br />
                        <br />
                        
                        </div>
                      
                      <br />  
                     
                        
                 </div>
				
                    <div class="lisence_content_right" align="right">
                    
                    <br />
                    <br />
                   
                
                
                
     
                            <div style="padding-left: 20px;">
                               
                            </div>
                    </div>  
                    <div style="clear: both"></div>
                </div>
                
            </div>
            <div class="con_bot"></div>
            <div id="foot_col">
                <div class="foot_col1">
                   
                    <div class="foot_pad">
					
					
					</div>
					</div>
                <div class="foot_col2">
				<div class="foot_pad">
				</div>
				</div>

                <div class="foot_col3">
                    
                    
                </div>
                <div class="footer_border_bot"></div>
            </div>
            <div id="footer">
                <div class="red_hr"></div>
               <p><strong><font color="#B82E00" size="3"></font></strong> 
                
            </div>
        </div>
      
    </body>
</html>

