package ceo.model;


import java.sql.Connection;
import java.sql.SQLException;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.CommandHandler;
import com.util.ConnectionProvider;



public class EditHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int ceoid = Integer.parseInt(request.getParameter("ceoid"));
		CeoDTO dto = null;
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			ceo.dao.CeoDAO dao = ceo.dao.CeoDAO.getInstance();
			
			dto = dao.selectOne(conn, ceoid);			
						
			//if( dto != null ) {}
		} catch (Exception e) {
			System.out.println("> Edit.doGet()...");
			e.printStackTrace();
		}finally {
			try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
		}
		request.setAttribute("dto", dto);		  
		
		return "/WEB-INF/view/CEOboard/edit.jsp";
		
		
	}
	
}

	
	