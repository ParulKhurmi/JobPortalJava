package Controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Search extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet( HttpServletRequest request,HttpServletResponse response ) throws	ServletException, IOException{
			String search = request.getParameter("search");
			response.setContentType("text/html");
			
			if(!((search.trim()).equals(""))){
				
											String searchString;
											try {
												searchString = dao.DaoJobs.searchJob(search);
												response.getWriter().write(searchString);
											} catch (SQLException e) {
												// TODO Auto-generated catch block
												e.printStackTrace();
											}			
										}
			else{
			response.getWriter().write("");
			}
	
			
			 
/*	public void doMethod(HttpServletRequest request, HttpServletResponse response) throws Exception
	{	
		String search = request.getParameter("search");
		dao.DaoJobs.searchJob(search);
		response.setContentType("application/json");
	}
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException
	{
		try {
			doMethod(req,res);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException
	{
		try {
			doMethod(req,res);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}*/
	}
}
