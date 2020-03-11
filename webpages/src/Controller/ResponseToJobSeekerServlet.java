package Controller;
import java.io.IOException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class ResponseToJobSeekerServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public void doMethod(HttpServletRequest request , HttpServletResponse response) throws Exception
	{
		
		
		
		String username = request.getParameter("uname");
		String useremail = (String) request.getSession().getAttribute("appliedByUserEmailID");
		String jobid = (String) request.getSession().getAttribute("appliedJobID");
		String jobname = (String) request.getSession().getAttribute("appliedJobTitle");
		String usermessage = request.getParameter("message");
		
		String [] recepients = new String[1];
		recepients[0] = "parulkhurmi1991@gmail.com";
		String [] bcc = new String[1];
		bcc[0] = "c0722150@lambton.com";
		String emailsubject = "Hi "+username+"Response Form JobPortal";
		String emailmessage = "";
		
		emailmessage += "Details of your Applied job on job portal \n";
		emailmessage += "Job ID : "+jobid+"\n";
		emailmessage += "Job Designation : "+jobname+"\n";
		emailmessage += "Message : "+usermessage+"\n";
		emailmessage += "Regards";
		
		new dao.SendMail().sendMail(recepients, bcc, emailsubject, emailmessage);
		
		System.out.println(username);
		System.out.println(useremail);
		System.out.println(usermessage);
		
		response.sendRedirect("ManageAdds.jsp");
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

