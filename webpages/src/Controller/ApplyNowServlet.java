package Controller;
import java.io.IOException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class ApplyNowServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public void doMethod(HttpServletRequest request , HttpServletResponse response) throws Exception
	{
		int userid = (int)request.getSession().getAttribute("userid");
		String username = request.getParameter("username");
		String useremail = (String) request.getSession().getAttribute("appliedByUserEmailID");
		int jobid = (int)request.getSession().getAttribute("appliedJobID");
		String jobname = (String) request.getSession().getAttribute("appliedJobTitle");
		String usermessage = request.getParameter("coverletter");
		
		System.out.println("--------------------------------------------"+username);
		System.out.println("--------------------------------------------"+useremail);
		
		String [] recepients = new String[1];
		recepients[0] = "parulkhurmi1991@gmail.com";
		String [] bcc = new String[1];
		bcc[0] = "c0722150@lambton.com";
		String emailsubject = "Request On JobPortal";
		String emailmessage = "";
		
		emailmessage += "Details of Applied job on job portal \n";
		emailmessage += "Job ID : "+jobid+"\n";
		emailmessage += "Job Designation : "+jobname+"\n";
		emailmessage += "Message : "+usermessage+"\n";
		emailmessage += "Regards";
		
		new dao.SendMail().sendMail(recepients, bcc, emailsubject, emailmessage);
		
		dao.DaoJobs.appliedJob(jobid,userid);
		
		System.out.println(username);
		System.out.println(useremail);
		System.out.println(usermessage);
		request.getSession().setAttribute("applynowSuccess", "success");
		response.sendRedirect("ApplyNow.jsp");
		
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		try {
			doMethod(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		try {
			doMethod(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

