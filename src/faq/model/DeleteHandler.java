package faq.model;


import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.CommandHandler;
import com.util.ConnectionProvider;

import faq.dao.FaqDAO;

public class DeleteHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		

		
		int faqnum = Integer.parseInt(request.getParameter("faqnum"));
		
		// 		
		try {
			Connection conn = 
					ConnectionProvider.getConnection();
			FaqDAO dao =  FaqDAO.getInstance();
			
			int result = dao.delete(conn, faqnum);
			System.out.println("DeleteHandler.result : "+ result);
						
			if( result == -1 ) {
								
				
				request.setAttribute("fs", "n");
				 return "faq_list.do?error=-1"; 
			
		}
		}catch (Exception e) {
			System.out.println("> Delete.doPost()...");
			e.printStackTrace();
		}finally {
			
		}
		
			  
		
		//return "/WEB-INF/view/list.jsp";
		request.setAttribute("fs", "n");
		return "faq_list.do";
		
	}
	
}

	
	