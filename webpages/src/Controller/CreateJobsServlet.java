package Controller;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.DaoJobs;
import model.Jobs;

public class CreateJobsServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		// retrive all parameters from JSP
		System.out.println("reached jobister servlet.........................................................--------------------------------------------------------------");
		int usrid = (int)request.getSession().getAttribute("userid");	
		String title = request.getParameter("title");
		String description = request.getParameter("description");	
		int jobtype=1;
		int status=1;
		String expiration_date = request.getParameter("expiration_date");		
		
		System.out.println("Servlet" +title + usrid);
		// set all the values in Model class object
		
		Jobs job =new Jobs();		
		job.settitle(title);
		job.setdescription(description);
		job.setjobtype(jobtype);
		job.setstatus(status);
		job.setexpiration_date(expiration_date);
		job.setemployerid(usrid);
			int i;
			try {
				i = DaoJobs.saveJob(job);
				
				if(i!=0)
				{
					System.out.println("job record created");
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

