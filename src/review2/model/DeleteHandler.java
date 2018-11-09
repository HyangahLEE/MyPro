package review2.model;



import java.sql.Connection;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.CommandHandler;
import com.util.ConnectionProvider;

import review2.dao.Review2DAO;






public class DeleteHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		

		int num = Integer.parseInt(request.getParameter("num"));
		
		// 		
		try {
			Connection conn = 
					ConnectionProvider.getConnection();
			Review2DAO dao = Review2DAO.getInstance();
			
			int result = dao.delete(conn, num);
			
						
			if( result == 0 ) {
				
				return "review2_list.do";
			
				
			
					
			}else if( result == -1 ) {

				request.setAttribute("fs", "n");
				 return "review2_list.do?error=-1"; 
			
		}
		}catch (Exception e) {
			System.out.println("> Delete.doPost()...");
			e.printStackTrace();
		}finally {
			
		}
		
			  
		
		request.setAttribute("fs", "n");
		return "review2_list.do";
		
	}
	
}

	
	