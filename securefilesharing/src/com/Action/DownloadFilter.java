package com.Action;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DownloadFilter implements Filter 
{

	public void destroy() 
	{
		// TODO Auto-generated method stub
		
	}

	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain arg2) throws IOException, ServletException {
		// TODO Auto-generated method stub
		 String user = (String) ((HttpServletRequest)req).getSession().getAttribute("userid");
		String vcode = req.getParameter("vcode");
		if(vcode == null)
		{
			System.out.println("vcode is null");
			((HttpServletResponse)res).sendRedirect("vcode.jsp?ip="+req.getParameter("ip")+"&filename="+ req.getParameter("filename"));						
		}
		else
		{
			String cv = req.getParameter("cv");
			System.out.println("cv :"+cv+" vcode: "+vcode);			
			if(cv.equals(vcode))
			  {
				System.out.println("doFilter(equals");
				arg2.doFilter(req, res);
			  }
			else
			{
				System.out.println("not equals");
				HttpServletResponse rs = (HttpServletResponse)res;
				System.out.println("dfilefile : vcode.jsp?ip="+req.getParameter("ip")+"&filename="+ req.getParameter("filename"));
				rs.sendRedirect("vcode.jsp?ip="+req.getParameter("ip")+"&filename="+ req.getParameter("filename"));
			}
				
		}
			 
		
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}
  
	
}
