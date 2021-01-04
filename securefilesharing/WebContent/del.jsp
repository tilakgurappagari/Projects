
                                <%@page import="java.sql.*"%>
<%
                                String msg=request.getParameter("msg");
String name=request.getParameter("msg2");
                                Connection conn = null;
                                String url = "jdbc:mysql://localhost:3306/";
                                String dbName = "ftp";
                                String driver = "com.mysql.jdbc.Driver";
                                String userName = "root";
                                String password = "";
                          
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    conn = DriverManager.getConnection(url + dbName, userName, password);
                                Statement st= conn.createStatement();
                                
                             int x= st.executeUpdate("delete from transaction where filename='"+msg+"' and location='"+name+"'");
                              
                              if(x>0)
                              {
                            	  response.sendRedirect("files.jsp");
                              }
                                
                                
                                %>
                               
                               
