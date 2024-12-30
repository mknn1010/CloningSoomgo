package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/SoomgoMarketDetailServlet")
public class SoomgoMarketDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mIdx = request.getParameter("market_idx");
		String mTitle = request.getParameter("market_title");
		System.out.println(mIdx+" "+mTitle);
		
		HttpSession session = request.getSession();
		session.setAttribute("market_idx", mIdx);
		session.setAttribute("market_title", mTitle);
		RequestDispatcher rd = request.getRequestDispatcher("soomgo_market_detail.jsp");
		rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
