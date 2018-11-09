package ceo.model;


import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.CommandHandler;
import com.util.ConnectionProvider;

public class DeleteHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		

		
		int ceoid = Integer.parseInt(request.getParameter("ceoid"));
		
		// 		
		try {
			Connection conn = 
					ConnectionProvider.getConnection();
			ceo.dao.CeoDAO dao = ceo.dao.CeoDAO.getInstance();
			
			int result = dao.delete(conn, ceoid);
			System.out.println("DeleteHandler.result : "+ result);
						
			if( result == -1 ) {
								
				
				request.setAttribute("fs", "n");
				 return "ceo_list.do?error=-1"; 
			
		}
		}catch (Exception e) {
			System.out.println("> Delete.doPost()...");
			e.printStackTrace();
		}finally {
			
		}
		
			  
		
		//return "/WEB-INF/view/list.jsp";
		request.setAttribute("fs", "n");
		return "ceo_list.do";
		
	}
	
}

	
	