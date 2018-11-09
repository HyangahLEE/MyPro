package review.model;



import java.sql.Connection;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.CommandHandler;
import com.util.ConnectionProvider;

import review.dao.ReviewDAO;




public class DeleteHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		

		int num = Integer.parseInt(request.getParameter("num"));
		
		// 		
		try {
			Connection conn = 
					ConnectionProvider.getConnection();
			ReviewDAO dao = ReviewDAO.getInstance();
			
			int result = dao.delete(conn, num);
			
						
			if( result == 0 ) {
				
				return "review_list.do";
			
				
			
					
			}else if( result == -1 ) {

				request.setAttribute("fs", "n");
				 return "review_list.do?error=-1"; 
			
		}
		}catch (Exception e) {
			System.out.println("> Delete.doPost()...");
			e.printStackTrace();
		}finally {
			
		}
		
			  
		
		request.setAttribute("fs", "n");
		return "review_list.do";
		
	}
	
}

	
	