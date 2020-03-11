package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Register;

public class DaoMVC {

	public static int registerUser(Register reg) throws SQLException {
		// TODO Auto-generated method stub
		int i =0;
		Connection con = connect();
		System.out.println("Reached DAOMvc"+reg.getLastname());
		String sql = "insert into registeruser"+
		"(userid,firstname,lastname,age,address,username,password,role,emailid)"+
		" values(userid_seq.nextval,?,?,?,?,?,?,?,?)";
		
		PreparedStatement stmt = con.prepareStatement(sql);		
		stmt.setString(1,reg.getFirstname());
		stmt.setString(2,reg.getLastname());
		stmt.setInt(3,reg.getAge());
		stmt.setString(4,reg.getAddress());
		stmt.setString(5,reg.getUsername());
		stmt.setString(6,reg.getPassword());
		stmt.setInt(7,reg.getRole());
		stmt.setString(8,reg.getEmail());		
		i=stmt.executeUpdate();
		
		return i;
	}
	@SuppressWarnings("finally")
	public static int validateLogin(String username ,String password) throws Exception
	{
		System.out.println("----------------------------------validateLogin-----------------------------------------");
		PreparedStatement stmt = null;
		ResultSet resultSet = null;
		int role =0;
		Connection con = connect();
		try{
			stmt = con.prepareStatement("select username,password,role from REGISTERUSER where username =? and password =?");
			stmt.setString(1,username );
			stmt.setString(2,password );
			resultSet =stmt.executeQuery();
			
			
			while(resultSet.next())
			{
				System.out.println("Database login true"+resultSet.getString("username"));
				System.out.println("Database password true"+resultSet.getString("password"));
				System.out.println("Database role true"+resultSet.getInt("role"));
				role = resultSet.getInt("role");
				System.out.println("Role is "+role);
				return role;
			}
			System.out.println("Retrieved Sucessfully  "+role);
			}
		catch(Exception e)
			{
				throw e;
			}
			return role;	
	}
	public int getLatestId()
	{
		
		return 0;
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
	public static int getuserid(String username, String password) throws SQLException {
		Connection con = connect();
		PreparedStatement stmt = null;
		ResultSet resultSet = null;
		int returnid = 0;
		try {
			stmt = con.prepareStatement("SELECT * FROM registeruser WHERE username=? AND password=?");
			stmt.setString(1,username );
			stmt.setString(2,password );
			resultSet = stmt.executeQuery();
			if(!resultSet.isBeforeFirst()) {
				returnid = 0;
			}
			else {
				resultSet.next();
				returnid = resultSet.getInt("userid");
			}
		} catch (Exception e) {
			throw e;
		} finally {
			try {
				if(stmt != null) {
					stmt.close();
				}
				if(con != null) {
					con.close();
				}
			} catch (SQLException e){
				e.printStackTrace();
			}
		}
		return returnid;
	}
	public static String getuseremailid(String username, String password) throws SQLException {
		Connection con = connect();
		PreparedStatement stmt = null;
		ResultSet resultSet = null;
		String returnemailid = "";
		try {
			stmt = con.prepareStatement("SELECT * FROM registeruser WHERE username=? AND password=?");
			stmt.setString(1,username );
			stmt.setString(2,password );
			resultSet = stmt.executeQuery();
			if(!resultSet.isBeforeFirst()) {
				returnemailid = "";
			}
			else {
				resultSet.next();
				returnemailid = resultSet.getString("emailid");
			}
		} catch (Exception e) {
			throw e;
		} finally {
			try {
				if(stmt != null) {
					stmt.close();
				}
				if(con != null) {
					con.close();
				}
			} catch (SQLException e){
				e.printStackTrace();
			}
		}
		return returnemailid;
	}
	
		
		
		
		

}
