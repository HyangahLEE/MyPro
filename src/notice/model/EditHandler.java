package notice.model;


import java.sql.Connection;
import java.sql.SQLException;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.CommandHandler;
import com.util.ConnectionProvider;



public class EditHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int num = Integer.parseInt(request.getParameter("num"));
		NoticeDTO dto = null;
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			notice.dao.NoticeDAO dao = notice.dao.NoticeDAO.getInstance();
			
			dto = dao.selectOne(conn, num);			
						
			//if( dto != null ) {}
		} catch (Exception e) {
			System.out.println("> Edit.doGet()...");
			e.printStackTrace();
		}finally {
			try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
		}
		request.setAttribute("dto", dto);		  
		
		return "/WEB-INF/view/notice/edit.jsp";
		
		
	}
	
}

	
	