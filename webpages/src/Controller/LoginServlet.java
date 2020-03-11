package Controller;
import java.io.IOException;
import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DaoMVC;

public class LoginServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public void doMethod(HttpServletRequest req, HttpServletResponse res) throws Exception
	{		
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		
		HttpSession session = req.getSession();
		session.setAttribute("userid", DaoMVC.getuserid(username,password));
		session.setAttribute("username", username);
		session.setAttribute("appliedByUserEmailID",DaoMVC.getuseremailid(username,password));
			
		System.out.println("test-----------------------------------"+DaoMVC.getuseremailid(username, password));
		if(DaoMVC.validateLogin(username, password)==1)
		{	
			System.out.println("--------------"+session.getAttribute("direct")+"-----------------click home------");
			
			if(null == session.getAttribute("direct"))
			{res.sendRedirect("ApplyNow.jsp");}
			
			if(session.getAttribute("direct").equals("1"))
			{res.sendRedirect("Home.jsp");}
			
			
		}
		else if(DaoMVC.validateLogin(username, password)==2)
		{			
			res.sendRedirect("ManageAdds.jsp");
		}
		else
		{
			res.sendRedirect("Error.html");
		}	
	}
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException
	{
		try {
			doMethod(req,res);
		} catch (ClassNotFoundException | SQLException | NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException
	{
		try {
			doMethod(req,res);
		} catch (ClassNotFoundException | SQLException | NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}