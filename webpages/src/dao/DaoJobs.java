package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Jobs;

public class DaoJobs {

	public static int saveJob(Jobs job) throws SQLException {
		// TODO Auto-generated method stub
		int i =0;
		Connection con = connect();
		System.out.println("Reached DAOJobs"+job.getemployerid());
		String sql = "insert into jobs(jobid,title,description,jobtype,status,expiration_date,employer_id) values(JOBID_SEQ.nextval,?,?,?,?,?,?)";
		
		PreparedStatement stmt = con.prepareStatement(sql);		
		stmt.setString(1,job.gettitle());
		stmt.setString(2,job.getdescription());
		stmt.setInt(3,job.getjobtype());
		stmt.setInt(4,job.getstatus());
		stmt.setString(5,job.getexpiration_date());		
		stmt.setInt(6, job.getemployerid());
		i=stmt.executeUpdate();
		
		return i;
	}
	private static Connection connect() throws SQLException {
		// TODO Auto-generated method stub
		Connection con = null;
		try {
			 
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
			return con;
		
			 
		 }
	       catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
return con;
}

	public static int updateJob(Jobs job) throws SQLException {
		// TODO Auto-generated method stub
		int i =0;
		Connection con = connect();		
		//String sqlQuery ="update jobs set title='"+job.gettitle()+"',description='"+job.getdescription()+"',expiration_date='"+job.getexpiration_date()+"' where jobid="+job.getjobid();
		String sqlQuery ="update jobs set title=?,description=?,expiration_date=? where jobid=?";
		System.out.println("---------test----------------------   sqlQuery"+sqlQuery);
		System.out.println(job.gettitle()+job.getdescription()+job.getexpiration_date()+job.getjobid());
		PreparedStatement stmt = con.prepareStatement(sqlQuery);		
		stmt.setString(1,job.gettitle());
		stmt.setString(2,job.getdescription());		
		stmt.setString(3,job.getexpiration_date());	
		stmt.setInt(4, job.getjobid());		
		i=stmt.executeUpdate();
			
		return i;
	}
	public static void appliedJob(int jobid, int userid) throws SQLException {
		// TODO Auto-generated method stub
		Connection con = connect();
		System.out.println("Reached Applied Jobs "+jobid+" by "+userid);
		String sql = "insert into job_applications(jobid,userid) values(?,?)";		
		PreparedStatement stmt = con.prepareStatement(sql);		
		stmt.setInt(1,jobid);
		stmt.setInt(2,userid);		
		stmt.executeUpdate();
	}
	public static String searchJob(String search) throws SQLException {		
		ResultSet resultSet = null;
		String finalSearch = "";
				Connection con = connect();
				System.out.println("Searcd Jobs "+search);
				String sql = "select * from jobs where title like '%"+search+"%'";		
				PreparedStatement stmt = con.prepareStatement(sql);												
				resultSet =stmt.executeQuery();	
				while (resultSet.next())
				{
				String un = resultSet.getString(1);
				finalSearch = un+"\n";
				}
				return finalSearch;
	}
}
