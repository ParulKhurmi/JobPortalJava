package Controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoMVC;
import model.Register;
public class RegisterServlet extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		// retrive all parameters from JSP
		System.out.println("reached Register servlet.........................................................--------------------------------------------------------------");
				
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		int age = Integer.valueOf(request.getParameter("age"));
		String address = request.getParameter("address");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		int role =  Integer.valueOf(request.getParameter("role"));
		String emiailId = request.getParameter("email");
		
		System.out.println("Servlet" +firstname);
		// set all the values in Model class object
		
		Register reg =new Register();		
		reg.setFirstname(firstname);
		reg.setLastname(lastname);
		reg.setAge(age);
		reg.setAddress(address);
		reg.setUsername(username);
		reg.setPassword(password);		
		reg.setRole(role);
		reg.setEmail(emiailId);
		
		
		
			int i;
			try {
				i = DaoMVC.registerUser(reg);
				
				if(i!=0)
				{
					System.out.println("value inserted");
					response.sendRedirect("Login.jsp");
				}
				else
				{
					System.out.println("value not inserted");
					response.sendRedirect("Register.jsp");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		
		
	}
	
}