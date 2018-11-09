package faq.model;


import java.sql.Connection;
import java.sql.SQLException;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.CommandHandler;
import com.util.ConnectionProvider;

import faq.dao.FaqDAO;



public class EditHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int faqnum = Integer.parseInt(request.getParameter("faqnum"));
		FaqDTO dto = null;
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			FaqDAO dao = FaqDAO.getInstance();
			
			dto = dao.selectOne(conn, faqnum);			
						
			//if( dto != null ) {}
		} catch (Exception e) {
			System.out.println("> Edit.doGet()...");
			e.printStackTrace();
		}finally {
			try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
		}
		request.setAttribute("dto", dto);		  
		
		return "/WEB-INF/view/FAQboard/edit.jsp";
		
		
	}
	
}

	
	