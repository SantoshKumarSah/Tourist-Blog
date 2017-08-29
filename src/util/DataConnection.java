package util;
import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DataConnection {
	public static Connection getConnection() throws SQLException{
		// load driver
		DriverManager.registerDriver(new com.mysql.jdbc.Driver());
		// establish connection(protocol:suprotocol:option)
		String url = "jdbc:mysql://localhost:3306/tourb";
		String user = "root";
		String password = "";
		Connection con = DriverManager.getConnection(url, user, password);
		return con;
	}
}


