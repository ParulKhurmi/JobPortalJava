package Controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.DatabaseConnection;
import Controller.UserTable;
import Models.Register;

public class UserServlet extends HttpServlet{

		/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

		public void doMethod(HttpServletRequest request, HttpServletResponse response) throws Exception {
			int userid=Integer.valueOf(request.getParameter("age"));
			String firstname = request.getParameter("firstname");
			String lastname = request.getParameter("lastname");
			int age = Integer.valueOf(request.getParameter("age"));
			String address = request.getParameter("address");
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String role = request.getParameter("role");
			String emiailId = request.getParameter("emailid");

			Register reg = new Register();
			reg.setId(userid);
			reg.setFirstname(firstname);
			reg.setLastname(lastname);
			reg.setAge(age);
			reg.setAddress(address);
			reg.setUsername(username);
			reg.setPassword(password);
			reg.setPassword(password);
			reg.setRole(role);
			reg.setEmail(emiailId);
			
		 Connection conn= DatabaseConnection.getDbConnection("oracle");
		 UserTable.insertRecord(reg, conn);
		 			
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			doMethod(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			doMethod(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
