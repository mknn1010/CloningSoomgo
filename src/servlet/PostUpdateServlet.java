package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommunityDao;
import dto.CommuPostDto;

/**
 * Servlet implementation class PostUpdateServlet
 */
@WebServlet("/PostUpdateServlet")
public class PostUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		int commuIdx = Integer.parseInt(request.getParameter("commu_idx"));
		Integer serviceIdx = null;
		Integer townIdx = null;
		int postIdx = 0;
		try {
			serviceIdx = Integer.parseInt(request.getParameter("service_idx"));
		} catch(Exception e) { }
		try {
			townIdx = Integer.parseInt(request.getParameter("town_idx"));
		} catch(Exception e) { }
		try {
			postIdx = Integer.parseInt(request.getParameter("post_idx"));
		} catch (Exception e) {}
		
		String postTitle = request.getParameter("post_title");
		String postContents = request.getParameter("content");
		String townName = request.getParameter("town_name");
		
		
		
		System.out.println("postTitle : " + postTitle);
		System.out.println("postContents: " + postContents);
		System.out.println("townName : " + townName);
		System.out.println("serviceIdx : " + serviceIdx);
		System.out.println("townIdx : " + townIdx);
		System.out.println("commuIdx : " + commuIdx);

		CommunityDao pDao = new CommunityDao();
		try {
			pDao.postUpdate(postTitle, postContents, serviceIdx, townIdx, commuIdx, postIdx);;
		} catch(Exception e) { e.printStackTrace(); }

		RequestDispatcher rd = request.getRequestDispatcher("soomgoQnA_Post.jsp");
		rd.forward(request, response);
	}
}

