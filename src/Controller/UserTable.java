package Controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Models.Register;
public class UserTable {
	public static void insertRecord(Register reg, Connection conn) throws Exception
	{
		PreparedStatement stmt =null;
		
		try{
			stmt=conn.prepareStatement("insert into register(id,firstname,lastname,age,address,username,password,role,emailid) values(?,?,?,?,?,?,?,?,?)");
		stmt.setInt(1,reg.getId());
		stmt.setString(2,reg.getFirstname());
		stmt.setString(3,reg.getLastname());
		stmt.setInt(4,reg.getAge());
		stmt.setString(5,reg.getAddress());
		stmt.setString(6,reg.getUsername());
		stmt.setString(7,reg.getPassword());
		stmt.setString(8,reg.getRole());
		stmt.setString(9,reg.getEmail());
		stmt.executeUpdate();
		System.out.println("inserted");
		}
		catch(Exception e){
			throw e;
		}
		finally{
			try{
				stmt.close();
				
			}
			catch(SQLException e){
				e.printStackTrace();
			}
		}
		}
	
/*	public static void updateRecord(String firstname, String lastname, int age, String address, 
			String username, String password, String role, String emailid, Connection conn) throws Exception
	{
		PreparedStatement stmt =null;
		
		try{			
		String updateTableSQL = "update register set username=? where lastName=?";				
		stmt=conn.prepareStatement(updateTableSQL);			
		stmt.setString(1,firstname);
		stmt.setString(2,lastname);
		stmt.setInt(3,age);
		stmt.setString(4,address);
		stmt.setString(5,username);
		stmt.setString(6,password);
		stmt.setString(7,role);
		stmt.setString(8,emailid);
		stmt.executeUpdate();
		System.out.println("updated");
		}
		catch(Exception e){
			throw e;
		}
		finally{
			try{
				stmt.close();
				
			}
			catch(SQLException e){
				e.printStackTrace();
			}
		}
	}
	
	public static void deleteRecord(String username, Connection conn) throws Exception
	{
		PreparedStatement stmt =null;
		
		try{			
		String deleteTableSQL = "delete from register where username=? ";				
		stmt=conn.prepareStatement(deleteTableSQL);			
		stmt.setString(1,username);		
		
		stmt.executeUpdate();
		System.out.println("deleted");
		}
		catch(Exception e){
			throw e;
		}
		finally{
			try{
				stmt.close();
				
			}
			catch(SQLException e){
				e.printStackTrace();
			}
		}
	}
	
	public static void getUserRecord(String lastname, Connection conn) throws Exception
	{
		PreparedStatement stmt =null;
		ResultSet rs=null;
		
		try{			
					
		stmt=conn.prepareStatement("select * from register where lastname=?");			
		stmt.setString(1,lastname);		
		rs = stmt.executeQuery();
		
		System.out.println("Retrieved Successfully");
		
		while(rs.next())
		{
			System.out.println(rs.getString("username"));
		}
		
		}
		catch(Exception e){
			throw e;
		}
		finally{
			try{
				stmt.close();
				
			}
			catch(SQLException e){
				e.printStackTrace();
			}
		}
	}*/
}
