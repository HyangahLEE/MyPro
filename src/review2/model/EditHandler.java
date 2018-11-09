package review2.model;


import java.sql.Connection;
import java.sql.SQLException;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.CommandHandler;
import com.util.ConnectionProvider;

import review.model.ReviewDTO;
import review2.dao.Review2DAO;



public class EditHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int num = Integer.parseInt(request.getParameter("num"));
		ReviewDTO dto = null;
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			Review2DAO dao = Review2DAO.getInstance();
			
			dto = dao.selectOne(conn, num);			
						
			//if( dto != null ) {}
		} catch (Exception e) {
			System.out.println("> Edit.doGet()...");
			e.printStackTrace();
		}finally {
			try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
		}
		request.setAttribute("dto", dto);		  
		
		return "/WEB-INF/view/review2/edit.jsp";
		
		
	}
	
}

	
	