package entity;

public class TourPost {
	private int tourpostid;
	private String title;
	private Place place;
	private User user;
	private String tourdetails;
	private String map;
	
	public TourPost(){
		this.setPlace(new Place());
		this.setUser(new User());
	}

	public int getTourpostid() {
		return tourpostid;
	}
	
	public String getShortDescription(){
		String subDesc=tourdetails.substring(0,tourdetails.indexOf(".")+1);
		return subDesc;
	}

	public void setTourpostid(int tourpostid) {
		this.tourpostid = tourpostid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTourdetails() {
		return tourdetails;
	}

	public void setTourdetails(String tourdetails) {
		this.tourdetails = tourdetails;
	}

	public String getMap() {
		return map;
	}

	public void setMap(String map) {
		this.map = map;
	}

	public Place getPlace() {
		return place;
	}

	public void setPlace(Place place) {
		this.place = place;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;

	}

	
		
	}


		
	

	

