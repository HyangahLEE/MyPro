package ceo.model;


import java.sql.Connection;
import java.sql.SQLException;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.CommandHandler;
import com.util.ConnectionProvider;



public class ViewHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// http://localhost/view.do?num=1&page=&searchCondition=&searchWord=
        int ceoid = Integer.parseInt(request.getParameter("ceoid"));
		
		Connection conn = null;
		try {
			 conn = 
					ConnectionProvider.getConnection();
			 ceo.dao.CeoDAO dao = ceo.dao.CeoDAO.getInstance();
			
			conn.setAutoCommit(false);
			dao.updateReadcount(conn, ceoid);               
			CeoDTO dto = dao.selectOne(conn, ceoid); 
			
			
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
		
		return "/WEB-INF/view/CEOboard/view.jsp";
		
		
	}
	
}

	
	