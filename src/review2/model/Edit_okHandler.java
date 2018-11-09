package review2.model;


import java.sql.Connection;
import java.sql.SQLException;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.CommandHandler;
import com.util.ConnectionProvider;

import review.model.ReviewDTO;
import review2.dao.Review2DAO;




public class Edit_okHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
request.setCharacterEncoding("UTF-8");		
		
     ReviewDTO dto = new ReviewDTO();     
     dto.setRtitle(request.getParameter("rtitle"));
     dto.setRcontent(request.getParameter("rcontent"));
     dto.setRid(Integer.parseInt(request.getParameter("num")));
     
		
		Connection conn = null;
					
		try {
			conn = 
					ConnectionProvider.getConnection();
			Review2DAO dao = Review2DAO.getInstance();
			
			int result = dao.edit(conn, dto);
			
			
						
			if( result == 0 ) {
				/*response.sendRedirect("list.do");*/
				
			}else if( result == -1 ) {
							
				/*int error=-1;
				request.setAttribute("error", error);*/
				
				
				request.setAttribute("fs", "n");
				return "review2_list.do?error=-1";
			
		}
		} catch (Exception e) {
			System.out.println("> Edit.doPost()...");
			e.printStackTrace();
		}finally {
			try {conn.close();} catch (SQLException e) {e.printStackTrace();}
		}	
		
		request.setAttribute("fs", "n");
		return "review2_list.do";
		
		
	}
	
}

	
	