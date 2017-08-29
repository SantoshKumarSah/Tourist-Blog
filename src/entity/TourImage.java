package entity;

public class TourImage {
	private int tourimageid;
	private TourPost tourpost;
	private String image;
	
	public TourImage(){
		this.setTourpost(new TourPost());
	}

	public int getTourimageid() {
		return tourimageid;
	}

	public void setTourimageid(int tourimageid) {
		this.tourimageid = tourimageid;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public TourPost getTourpost() {
		return tourpost;
	}

	public void setTourpost(TourPost tourpost) {
		this.tourpost = tourpost;
	}
		
	
}
