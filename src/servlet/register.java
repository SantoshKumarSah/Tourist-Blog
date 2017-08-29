package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.User;
import bean.UserBean;

@WebServlet(urlPatterns = { "/register", "/login", "/logout" })
public class register extends HttpServlet {
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
		UserBean ubean = new UserBean();

		String msg = "";
		String page = "login.jsp";
		HttpSession hs = req.getSession();
		try {

			switch (url) {
			case "register":
				page = "register.jsp";
				User use = new User();

				use.setEmailid(req.getParameter("emailid"));
				use.setName(req.getParameter("name"));
				use.setAddress(req.getParameter("address"));
				use.setPassword(req.getParameter("password"));

				boolean register = ubean.register(use);

				if (register) {
					page = "login.jsp";
					msg = "Success...";
					hs.setAttribute("logid", use.getEmailid());
				} else {
					msg = "Failed...";
				}

				break;
			case "login":
				page = "login.jsp";
				String emailid = req.getParameter("emailid");
				String password = req.getParameter("password");

				boolean authSuccess = ubean.login(emailid, password);

				if (authSuccess) {
					page = "service.jsp";
					msg = "Success...";
					hs.setAttribute("logid", emailid);

				} else {
					msg = "Failed...";
				}

				break;

			case "logout":
				page = "login.jsp";
				hs.invalidate();

			}
		} catch (Exception e) {
			e.printStackTrace();
			msg = e.getMessage();
		}

		out.println(msg);
		req.setAttribute("msg", msg);
		RequestDispatcher rd = req.getRequestDispatcher(page);
		rd.forward(req, resp);
	}
}
