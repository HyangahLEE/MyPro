package faq.model;


import java.sql.Connection;
import java.sql.SQLException;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.CommandHandler;
import com.util.ConnectionProvider;

import faq.dao.FaqDAO;

public class Edit_okHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
request.setCharacterEncoding("UTF-8");		
		
     FaqDTO dto = new FaqDTO();
     dto.setFaqcontent(request.getParameter("faqcontent"));
    
     dto.setMgid(request.getParameter("mgid"));
     dto.setFaqtitle(request.getParameter("faqtitle"));
     dto.setFaqnum(Integer.parseInt(request.getParameter("faqnum")));
		
		Connection conn = null;
					
		try {
			conn = 
					ConnectionProvider.getConnection();
			FaqDAO dao = FaqDAO.getInstance();
			
			int result = dao.edit(conn, dto);
			
						
			if( result == -1 ) {
								
				
				request.setAttribute("fs", "n");
				 return "faq_list.do?error=-1"; 
				
			}
		} catch (Exception e) {
			System.out.println("> faqEdit.doPost()...");
			e.printStackTrace();
		}finally {
			try {conn.close();} catch (SQLException e) {e.printStackTrace();}
		}	
		//에러 잡고 list.do로 떠야 하므로, redirect 시켜야 한다.
		request.setAttribute("fs", "n");
		return "faq_list.do";
		
		
	}
	
}

	
	