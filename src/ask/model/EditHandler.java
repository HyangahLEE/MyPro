package ask.model;


import java.sql.Connection;
import java.sql.SQLException;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.CommandHandler;
import com.util.ConnectionProvider;

import ask.dao.AskDAO;



public class EditHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int num = Integer.parseInt(request.getParameter("num"));
		AskDTO dto = null;
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			AskDAO dao = AskDAO.getInstance();
			
			dto = dao.selectOne(conn, num);			
						
			//if( dto != null ) {}
		} catch (Exception e) {
			System.out.println("> Edit.doGet()...");
			e.printStackTrace();
		}finally {
			try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
		}
		request.setAttribute("dto", dto);		  
		
		return "/WEB-INF/view/ask/edit.jsp";
		
		
	}
	
}

	
	