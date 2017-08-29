package entity;

public class Comment {
	private  int commentid;
	private  TourPost tourpost;
	private  String comment;
	private  String commentdate;
	
	private  User user;
	
	public Comment(){
		setUser(new User());
		setTourpost(new TourPost());
	}

	public int getCommentid() {
		return commentid;
	}

	public void setCommentid(int commentid) {
		this.commentid = commentid;
	}

	public TourPost getTourpost() {
		return tourpost;
	}

	public void setTourpost(TourPost tourpost) {
		this.tourpost = tourpost;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getCommentdate() {
		return commentdate;
	}

	public void setCommentdate(String commentdate) {
		this.commentdate = commentdate;
	}
}

