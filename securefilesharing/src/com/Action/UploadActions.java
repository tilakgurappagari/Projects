/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Action;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import DbPack.TrippleDes;

import com.util.AES;
import com.util.Constant;
import com.util.DbConnector;
import com.util.SimpleFTPClient;
import com.util.Utilities;

/**
 *
 * @author Sabari
 */
public class UploadActions extends HttpServlet {

    private static final String TMP_DIR_PATH = "c:\\tmp";
    private File tmpDir;
    private static final String DESTINATION_DIR_PATH = "file";
    private File destinationDir;

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Random r=new Random();
		String s="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz123456789";
	
		char c5=s.charAt(r.nextInt(60));
		char c1=s.charAt(r.nextInt(60));
		char c2=s.charAt(r.nextInt(60));
		char c3=s.charAt(r.nextInt(60));
		char c4=s.charAt(r.nextInt(60));
	
		String co=""+c5+c1+c2+c3+c4;
        DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
        /*
         *Set the size threshold, above which content will be stored on disk.
         */
        fileItemFactory.setSizeThreshold(1 * 1024 * 1024); //1 MB
		/*
         * Set the temporary directory to store the uploaded files of size above threshold.
         */
        
        fileItemFactory.setRepository(tmpDir);

        ServletFileUpload uploadHandler = new ServletFileUpload(fileItemFactory);
        Connection con = null;
        PreparedStatement pstm = null;
        PreparedStatement pstm1 = null;
        PreparedStatement pstm2 = null;
        PreparedStatement pstm3 = null;

        try {
            /*
             * Parse the request
             */
            con = DbConnector.getConnection();
            List items = uploadHandler.parseRequest(request);
            Iterator itr = items.iterator();            
            String fileName = "";
            String hv =""; 
        	String cap = " ";        	
        	        	
        	FileItem item = null;
            /////////////////////////////
             while(itr.hasNext())
             {
            	 FileItem item1 =( FileItem) itr.next();
            	 if (item1.isFormField()) {
            	        // Process regular form field (input type="text|radio|checkbox|etc", select, etc).
            	        String fieldname = item1.getFieldName();
            	        if(fieldname.equalsIgnoreCase("hv"))
            	           hv = item1.getString();
            	        if(fieldname.equalsIgnoreCase("cap"))
            	        	cap =item1.getString();
            	        
            	        System.out.println(fieldname +" : "+fieldname+" cap "+cap+"  hv :"+hv);
            	        // ... (do your job here)
            	   }            	 
            	 else
            	   item = item1;
             }
             if(!hv.equals(cap))    
            	 {
            	  System.out.println("------->if capt is not equal");
            	 out.write(" <font color='red'> Please Enter Correct Capteha</font>" );
            	  response.sendRedirect("fileUpload.jsp");
            	 }
             
             
             //////////////////
             if(hv.equals(cap)){    
        
            String sql1 = "select * from transaction where filename='" + item.getName() + "'";
            System.out.println(">>>>>>>>>>" + sql1);
            pstm = con.prepareStatement(sql1);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>.loop");
                response.sendRedirect("fileUpload.jsp?msg=File Name Already Exist");
            } else {
                fileName =item.getName();
                // File file = new File(Constant.file, item.getName());
                // item.write(file);
                // System.out.println("" + file.getAbsolutePath());
                int x = fileName.lastIndexOf('\\');
                String fN = fileName.substring(x + 1, fileName.length());
                System.out.println("your path FN:"+fN);
 String get = "" + item.getInputStream();
                String str = getStringFromInputStream(item.getInputStream());
                System.out.println("your data:"+str);
                String cipher = new TrippleDes().encrypt(str);
                SimpleFTPClient client = null;

                String sq1 = "select * from cloud where status='Active'";

                pstm3 = con.prepareStatement(sq1);
                ResultSet rs1 = pstm3.executeQuery();
                String user="";
                String cld="";
                String loc="";
                while (rs1.next()) {
                    client=new SimpleFTPClient();
                    cld=rs1.getString("ip");
                    user=rs1.getString("user");
                    loc=rs1.getString("location");
                    client.setHost(rs1.getString("ip"));
                    client.setUser(rs1.getString("user"));
                    client.setPassword(rs1.getString("password"));
                    client.setRemoteFile(fN);
                    
                    
                   boolean log= client.connect(); 
                   if(log){
                	      
                	    try {
                	    	 FileOutputStream fos = new FileOutputStream(new  File(item.getName()));
                	    	byte b[] = new byte[1024];
                	    	int c=0;
                	    	InputStream is = item.getInputStream();
                	    	while((c=is.read(b)) != 0)
                	    	{
                	    		fos.write(b, 0, c);
                	    	}
                	    	fos.close();                	    	
                	    }
                	    catch(Exception e){}
                	    
                	    if (client.uploadFile(new File(item.getName()))){ 
                     //  if (client.uploadFile(item.getInputStream())){ // existing
                        user = (String) request.getSession().getAttribute("userid");
                        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + user);
                        String sq2 = "insert into transaction values('" + user + "','" + fN + "','Success','"+cld+"',now(),'Upload','"+loc+"','"+cipher+"','"+co+"')";
                        pstm1 = (PreparedStatement) con.prepareStatement(sq2);
                        pstm1.executeUpdate();
                    } else {
                           System.out.println(">>>>>>else");
                       // response.sendRedirect("fileUpload.jsp?msg=Cloud Not Connected");
                         out.println("Not Uploaded.................") ;  }
                   }else{
                       System.out.println("not connected");
                   }
                     
                } 
                response.sendRedirect("fileUpload.jsp?msg=Check Report");
            }
             }
        } catch (Exception ex) {
            ex.printStackTrace();
            response.sendRedirect("fileUpload.jsp?msg=Cloud Not Connected");
            // log("Error encountered while uploading file", ex);
        }
      //  response.sendRedirect("fileUpload.jsp?msg=Check Report for status");
    }

    private static String getStringFromInputStream(InputStream is) {
    	 
		BufferedReader br = null;
		StringBuilder sb = new StringBuilder();
 
		String line;
		try {
 
			br = new BufferedReader(new InputStreamReader(is));
			while ((line = br.readLine()) != null) {
				sb.append(line+"\n");
			}
 
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (br != null) {
				try {
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return sb.toString();
	}

	// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	processRequest(request, response);
    	/*
    	String hv =request.getParameter("hv");
    	String cap = request.getParameter("cap");
    	System.out.println(" hv :"+hv+"    cap :"+cap);
    	if(hv==null || cap==null)
    	{
    		PrintWriter pw = response.getWriter();
    		response.setContentType("text/html");
    		pw.write("Plkease Enter Correct Captecha");
    		 response.sendRedirect("/fileUpload.jsp");
    		}
    	if(hv.equals("cap"))    	
    		processRequest(request, response);
    	else
    		{
    		PrintWriter pw = response.getWriter();
    		response.setContentType("text/html");
    		pw.write("Plkease Enter Correct Captecha");
    		 response.sendRedirect("/fileUpload.jsp");
    		}
    		*/
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
