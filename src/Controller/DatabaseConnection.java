package Controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
	public static Connection getDbConnection(String db) throws SQLException
	{
		Connection conn = null;
		try{
		if (db.equalsIgnoreCase("oracle"))
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","System","1234");
			return conn;
		}
		else
		{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:oracle://127.0.0.1/DatabaseName","Username","password");
			return conn;
		}
	}
	
	catch(ClassNotFoundException e){
		e.printStackTrace();
	}
return conn;
}
}
