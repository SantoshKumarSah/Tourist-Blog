package servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import bean.TourBean;
import entity.Comment;
import entity.Place;
import entity.TourImage;
import entity.TourPost;

@WebServlet(urlPatterns = { "/addplace", "/addtourpost","/delplace","/updatetourpost","/addcomment","/uploadtourimage" })
@MultipartConfig
public class TourPlace extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String url = req.getRequestURL().toString();
		url = url.substring(url.lastIndexOf("/") + 1);

		PrintWriter out = resp.getWriter();
		TourBean tbean = new TourBean();

		String msg = "";
		String page = "tour.jsp";
		HttpSession hs = req.getSession();
		try {

			switch (url) {
			case "addplace":
				page = "place.jsp";
				Place p = new Place();

				p.setPlacename(req.getParameter("placename"));

				boolean addplace = tbean.addPlace(p);

				if (addplace) {
					page="service.jsp";
					msg = "Success...";

				} else {
					msg = "Failed...";
				}

				break;
				
			case "delplace":
				page="place.jsp";
				int placeid=Integer.parseInt(req.getParameter("placeid"));
				boolean deleted=tbean.removePlace(placeid);
				
				if(deleted){
					msg="Success...";
				}else{
					msg="Failed...";
				}
				
				break;

			case "addtourpost":
				page = "tour.jsp";

				TourPost t = new TourPost();

				t.setTitle(req.getParameter("title"));
				t.getPlace().setPlaceid(
						Integer.parseInt(req.getParameter("placeid")));
				t.setTourdetails(req.getParameter("tourdetails"));
				t.setMap(req.getParameter("map"));
				t.getUser().setEmailid((String) req.getSession().getAttribute("logid"));

				boolean addtourpost = tbean.addTourPost(t);

				if (addtourpost) {
					page = "mytour.jsp";
					msg = "Success...";

				} else {
					msg = "Failed...";
				}

				break;
				
			case "updatetourpost":
				page = "updatetour.jsp";
				TourPost t1 = new TourPost();

				t1.setTitle(req.getParameter("title"));
				t1.getPlace().setPlaceid(
		        Integer.parseInt(req.getParameter("placeid")));
				t1.setTourdetails(req.getParameter("tourdetails"));
				t1.setMap(req.getParameter("map"));
				t1.getUser().setEmailid((String) req.getSession().getAttribute("logid"));

				boolean updatetour = tbean.updatetourpost(t1);

				if (updatetour) {
					//page = "mytour.jsp";
					msg = "Success...";

				} else {
					msg = "Failed...";
				}

				break;
				
			case "addcomment":
				page = "details.jsp?tourpostid="+req.getParameter("tourpostid");

				Comment c = new Comment();

				c.getTourpost().setTourpostid(Integer.parseInt(req.getParameter("tourpostid")));
				c.getUser().setEmailid((String) req.getSession().getAttribute("logid"));
				c.setComment(req.getParameter("comment"));
				
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			
				
				c.setCommentdate(sdf.format(new Date()));

				boolean addcomment = tbean.addComment(c);

				if (addcomment) {
					
					msg = "Success...";

				} else {
					msg = "Failed...";
				}

				break;
			case "uploadtourimage":
				int tourpostid=Integer.parseInt(req.getParameter("tourpostid"));
				page = "updatetour.jsp?tourpostid="+tourpostid;
				
				TourImage img=new TourImage();
				img.getTourpost().setTourpostid(tourpostid);
				
				Part part=req.getPart("tourimage");
				InputStream is=part.getInputStream();
				byte buff[]=new byte[is.available()];
				is.read(buff);
				
				String imgAsString=Base64.getEncoder().encodeToString(buff);
				img.setImage(imgAsString);
				
				buff=null;
				
				
				boolean imageUploaded=tbean.addImage(img);
				
				if (imageUploaded) {
					
					msg = "Success...";

				} else {
					msg = "Failed...";
				}
				break;

				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			msg = e.getMessage();
		}

		req.setAttribute("msg", msg);
		RequestDispatcher rd = req.getRequestDispatcher(page);
		rd.forward(req, resp);
	}

}
