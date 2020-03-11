package Controller;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.DaoJobs;
import model.Jobs;

public class JobsServlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		// retrive all parameters from JSP
		System.out.println("reached jobister servlet.........................................................--------------------------------------------------------------");
			
		int jobid = (int)request.getSession().getAttribute("jobid");
		String title = request.getParameter("title");
		String description = request.getParameter("description");		
		String expiration_date = request.getParameter("expiration_date");		
		
		System.out.println("Servlet" +title);
		// set all the values in Model class object
		
		Jobs job =new Jobs();	
		job.setjobid(jobid);
		job.settitle(title);
		job.setdescription(description);		
		job.setexpiration_date(expiration_date);
			int i;
			try {
				i = DaoJobs.updateJob(job);
				
				if(i!=0)
				{
					System.out.println("values updated");
				//	request.getSession().removeAttribute("jobid");
					response.sendRedirect("ManageAdds.jsp");
				}
				else
				{
					System.out.println("value not inserted");
				}
			}
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}

}
