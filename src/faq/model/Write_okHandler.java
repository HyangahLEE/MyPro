package faq.model;


import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.CommandHandler;
import com.util.ConnectionProvider;

import ceo.dao.CeoDAO;
import faq.dao.FaqDAO;




public class Write_okHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		FaqDTO dto = new FaqDTO();
		dto.setFaqcontent(request.getParameter("faqcontent"));
	
		dto.setFaqdid(request.getParameter("keywords"));
		dto.setMgid(request.getParameter("mgid"));
		dto.setFaqtitle(request.getParameter("faqtitle"));
		
	
		
		try {
			Connection conn = 
					ConnectionProvider.getConnection();
			FaqDAO dao = FaqDAO.getInstance();
			
			int result = dao.insert(conn, dto);
			
						
			if( result == 1 ) {
				return "faq_list.do";
			}
		} catch (Exception e) {
			System.out.println("> Write.doPost()...");
			e.printStackTrace();
		}finally {
			
		}
		return "faq_list.do";
		
	}
	
}

	
	