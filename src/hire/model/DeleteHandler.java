package hire.model;



import java.sql.Connection;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.CommandHandler;
import com.util.ConnectionProvider;

import hire.dao.HireDAO;



public class DeleteHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		

		/*String pass = request.getParameter("pass");*/
		int num = Integer.parseInt(request.getParameter("num"));
		
		// 		
		try {
			Connection conn = 
					ConnectionProvider.getConnection();
			HireDAO dao = HireDAO.getInstance();
			
			int result = dao.delete(conn, num);
			
						
			if( result == 0 ) {
				
				return "hire_list.do";
			
				
			
					
			}else if( result == -1 ) {

				request.setAttribute("fs", "n");
				 return "hire_list.do?error=-1"; 
			
		}
		}catch (Exception e) {
			System.out.println("> Delete.doPost()...");
			e.printStackTrace();
		}finally {
			
		}
		
			  
		
		request.setAttribute("fs", "n");
		return "hire_list.do";
		
	}
	
}

	
	