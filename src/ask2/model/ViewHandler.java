package ask2.model;


import java.sql.Connection;
import java.sql.SQLException;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.CommandHandler;
import com.util.ConnectionProvider;

import ask.dao.AskDAO;
import ask.model.AskDTO;
import ask2.dao.Ask2DAO;


public class ViewHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// http://localhost/view.do?num=1&page=&searchCondition=&searchWord=
        int num = Integer.parseInt(request.getParameter("num"));
		
		Connection conn = null;
		try {
			 conn = 
					ConnectionProvider.getConnection();
			 Ask2DAO dao = Ask2DAO.getInstance();
			
			conn.setAutoCommit(false);
			dao.updateReadcount(conn, num);               
			AskDTO dto = dao.selectOne(conn, num); 
			
			
			request.setAttribute("dto", dto);
			conn.commit();
			
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			System.out.println("> view.doGet()...");
			e.printStackTrace();
		}finally {
			try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
		}
		
		return "/WEB-INF/view/ask2/view.jsp";
		
		
	}
	
}

	
	