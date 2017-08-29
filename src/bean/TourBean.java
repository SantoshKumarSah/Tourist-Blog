package bean;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.DataConnection;
import entity.Comment;
import entity.Place;
import entity.TourImage;
import entity.TourPost;
import entity.User;

public class TourBean {
	public boolean addPlace(Place place) throws SQLException {
		Connection con = DataConnection.getConnection();
		String sql = "insert into place(placename) values(?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, place.getPlacename());
		// execute sql and collect result
		int xx = ps.executeUpdate();
		// return result...
		return xx > 0;
	}

	public boolean addTourPost(TourPost tour) throws SQLException {
		Connection con = DataConnection.getConnection();

		String sql = "insert into tourpost(title,placeid,tourdetails,map,emailid) values(?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);

		ps.setString(1, tour.getTitle());
		ps.setInt(2, tour.getPlace().getPlaceid());
		ps.setString(3, tour.getTourdetails());
		ps.setString(4, tour.getMap());
		ps.setString(5, tour.getUser().getEmailid());
		// execute sql and collect result
		int xx = ps.executeUpdate();
		// return result...
		return xx > 0;
	}

	public boolean updatetourpost(TourPost tourpost) throws SQLException {

		String sql = "UPDATE tourpost SET title=?,placename=?,tourdetails=?,map=? WHERE tourpostid=?";
		Connection con1 = DataConnection.getConnection();
		PreparedStatement ps1 = con1.prepareStatement(sql);
		ps1.setString(1, tourpost.getTitle());
		ps1.setString(2, tourpost.getPlace().getPlacename());
		ps1.setString(3, tourpost.getTourdetails());
		ps1.setString(4, tourpost.getMap());

		int xx = ps1.executeUpdate();

		return xx > 0;

	}

	public boolean addComment(Comment comm) throws SQLException {

		Connection con = DataConnection.getConnection();

		String sql = "insert into comment(tourpostid,emailid,comment,commentdate) values(?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, comm.getTourpost().getTourpostid());
		ps.setString(2, comm.getUser().getEmailid());
		ps.setString(3, comm.getComment());
		ps.setString(4, comm.getCommentdate());

		// execute sql and collect result
		int xx = ps.executeUpdate();
		// return result...
		return xx > 0;

	}

	public boolean removeComment(int commentid) throws SQLException {
		String sql = "delete from comment where commentid=?";
		Connection con = DataConnection.getConnection();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, commentid);
		int xx = ps.executeUpdate();

		return xx > 0;
	}

	public boolean addImage(TourImage image) throws SQLException {
		String sql = "insert into tourimage(tourpostid,image) values(?,?)";
		Connection con = DataConnection.getConnection();
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, image.getTourpost().getTourpostid());
		ps.setString(2, image.getImage());
		int xx = ps.executeUpdate();
		return xx > 0;
	}

	public boolean removeImage(int tourimageid) throws SQLException {
		String sql = "delete from tourimages where tourimageid=?";
		Connection con = DataConnection.getConnection();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, tourimageid);
		int xx = ps.executeUpdate();
		return xx > 0;
	}

	public boolean removeTourPost(int tourpostid) throws SQLException {
		String sql = "delete from tourpost where tourpostid=?";
		Connection con = DataConnection.getConnection();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, tourpostid);
		int xx = ps.executeUpdate();
		return xx > 0;
	}

	public ArrayList<Place> getAllPlaces() throws SQLException {
		ArrayList<Place> places = new ArrayList<Place>();

		String sql = "select * from place";
		Connection con = DataConnection.getConnection();
		PreparedStatement ps = con.prepareStatement(sql);

		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
			int placeid = rs.getInt("placeid");
			String placename = rs.getString("placename");

			Place p = new Place();
			p.setPlaceid(placeid);
			p.setPlacename(placename);

			places.add(p);
		}
		return places;

	}

	public ArrayList<TourPost> getAllTourPost() throws SQLException {
		ArrayList<TourPost> tourpost = new ArrayList<TourPost>();

		String sql = "select * from tourpost";
		Connection con = DataConnection.getConnection();
		PreparedStatement ps = con.prepareStatement(sql);

		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			int tourpostid = rs.getInt("tourpostid");
			String title = rs.getString("title");
			int placeid = rs.getInt("placeid");
			String tourdetails = rs.getString("tourdetails");
			String map = rs.getString("map");
			String emailid = rs.getString("emailid");

			TourPost t = new TourPost();
			t.setTitle(title);
			t.setTourpostid(tourpostid);
			t.getPlace().setPlaceid(placeid);
			t.setTourdetails(tourdetails);
			t.setMap(map);
			t.getUser().setEmailid(emailid);

			tourpost.add(t);

		}
		return tourpost;

	}
	
	public ArrayList<TourPost> getAllTourPostByUser(String emailid) throws SQLException {
		ArrayList<TourPost> tourpost = new ArrayList<TourPost>();

		String sql = "select * from tourpost where emailid=?";
		Connection con = DataConnection.getConnection();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, emailid);

		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			int tourpostid = rs.getInt("tourpostid");
			String title = rs.getString("title");
			int placeid = rs.getInt("placeid");
			String tourdetails = rs.getString("tourdetails");
			String map = rs.getString("map");
		
			
			TourPost t = new TourPost();
			t.setTitle(title);
			t.setTourpostid(tourpostid);
			t.getPlace().setPlaceid(placeid);
			t.setTourdetails(tourdetails);
			t.setMap(map);
			t.getUser().setEmailid(emailid);

			tourpost.add(t);

		}
		return tourpost;

	}

	public TourPost getTourPostById(int tourpostid) throws SQLException {

		String sql = "select * from tourpost where tourpostid=?";
		Connection con = DataConnection.getConnection();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, tourpostid);

		ResultSet rs = ps.executeQuery();
		TourPost t = new TourPost();
		while (rs.next()) {

			int placeid = rs.getInt("placeid");
			String tourdetails = rs.getString("tourdetails");
			String map = rs.getString("map");
			String emailid = rs.getString("emailid");

			t.setTourpostid(rs.getInt("tourpostid"));
			t.setTitle(rs.getString("title"));
			t.setTourpostid(tourpostid);
			t.getPlace().setPlaceid(placeid);
			t.setTourdetails(tourdetails);
			t.setMap(map);
			t.getUser().setEmailid(emailid);

		}
		return t;

	}

	public ArrayList<TourImage> getAllTourImages(String imageid) throws SQLException {
		ArrayList<TourImage> tourimage = new ArrayList<TourImage>();
		
		if(!imageid.equals("")){
			imageid="where tourpostid="+imageid;
		}

		String sql = "select * from tourimage "+imageid;
		
		System.out.println(sql);
		
		Connection con = DataConnection.getConnection();
		PreparedStatement ps = con.prepareStatement(sql);

		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
			int tourimageid = rs.getInt("tourimageid");
			int tourpostid = rs.getInt("tourpostid");
			String image = rs.getString("image");

			TourImage t = new TourImage();
			t.setTourimageid(tourimageid);
			t.getTourpost().setTourpostid(tourpostid);
			t.setImage(image);

			tourimage.add(t);

		}
		return tourimage;

	}

	public ArrayList<Comment> getAllComment() throws SQLException {
		ArrayList<Comment> comments = new ArrayList<Comment>();

		String sql = "select * from comment c,user u where u.emailid=c.emailid";
		Connection con = DataConnection.getConnection();
		PreparedStatement ps = con.prepareStatement(sql);

		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
			
			Comment c = new Comment();
			c.setCommentid(rs.getInt("commentid"));
			c.getTourpost().setTourpostid( rs.getInt("tourpostid"));
			
			c.setComment(rs.getString("comment"));
			c.setCommentdate(rs.getString("commentdate"));
			
			User user=new User();
			user.setEmailid(rs.getString("emailid"));
			user.setAddress(rs.getString("address"));
			user.setName(rs.getString("name"));
			
			c.setUser(user);

			comments.add(c);

		}
		return comments;

	}

	public boolean removePlace(int placeid) throws SQLException {
		String sql = "delete from place where placeid=?";
		Connection con = DataConnection.getConnection();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, placeid);
		int xx = ps.executeUpdate();

		return xx > 0;
	}

}
