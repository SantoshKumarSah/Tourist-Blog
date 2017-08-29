package bean;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.DataConnection;

import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

import entity.User;

public class UserBean {
	public boolean register(User user) throws SQLException {
		Connection con = DataConnection.getConnection();
		// create statement
		String sql = "insert into user(emailid,name,address,password) values(?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, user.getEmailid());
		ps.setString(2, user.getName());
		ps.setString(3, user.getAddress());
		ps.setString(4, user.getPassword());
		// execute sql and collect result
		int xx = ps.executeUpdate();
		// return result...
		return xx > 0;
	}

	public boolean login(String emailid, String password) throws SQLException {
		String sql = "select * from user where emailid=? and password=?";
		Connection con = DataConnection.getConnection();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, emailid);
		ps.setString(2, password);

		ResultSet rs = ps.executeQuery();

		return rs.next();
	}

	public User getUserByEmail(String emailid) throws SQLException {
		String sql = "select * from user where emailid=?";
		Connection con = DataConnection.getConnection();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, emailid);
		ResultSet rs = ps.executeQuery();
		
		User user=null;
		if(rs.next())
		{
			user=new User();
			user.setEmailid(rs.getString("emailid"));
			user.setAddress(rs.getString("address"));
			user.setName(rs.getString("name"));
			user.setPassword(rs.getString("password"));
			
			
		}
		return user;
	}

	public boolean updateUser(User user) throws SQLException {
		Connection con = DataConnection.getConnection();
		// create statement
		String sql = "UPDATE `user` SET `name`=?,`address`=? WHERE  `emailid`=?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, user.getName());
		ps.setString(2, user.getAddress());
		ps.setString(3, user.getEmailid());
		
		// execute sql and collect result
		int xx = ps.executeUpdate();
		// return result...
		return xx>0;
	}

	public String changepassword(String emailid, String oldpass, String newpass)
			throws SQLException {
		
		boolean authSuccess=login(emailid, oldpass);
		
		if(!authSuccess){
			return "wrong old password...";
		}
		
		String sql = "Update user set password=? where emailid=?";
		Connection con = DataConnection.getConnection();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, newpass);
		ps.setString(2, emailid);
		
		int xx=ps.executeUpdate();
		
		if(xx>0){
			return "Password changed successfully...";
		}else{
			return "Change password failed...";
		}
		
	}
}
