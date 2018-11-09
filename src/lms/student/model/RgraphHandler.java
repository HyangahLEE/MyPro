package lms.student.model;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.CommandHandler;
import com.util.ConnectionProvider;

import lms.student.dao.RgraphDAO;

public class RgraphHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("loginUser");
		
		Connection conn = ConnectionProvider.getConnection();
		/*System.out.println(" RgraphHandler 넘어오는 값 : " + memberId);*/
		if(memberId.equals("memberId0002")) {
			request.setAttribute("list", RgraphDAO.select(conn, memberId) );
		} else if(memberId.equals("memberId1004")) {
			request.setAttribute("list", RgraphDAO.select(conn, memberId) );
		}
		
		return "/WEB-INF/view/graph/rgraph.jsp";
		
	}
	
	
}
