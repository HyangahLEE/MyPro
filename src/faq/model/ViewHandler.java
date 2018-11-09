package faq.model;


import java.sql.Connection;
import java.sql.SQLException;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.CommandHandler;
import com.util.ConnectionProvider;

import faq.dao.FaqDAO;



public class ViewHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// http://localhost/view.do?num=1&page=&searchCondition=&searchWord=
        int faqnum = Integer.parseInt(request.getParameter("faqnum"));
		String faqdname = request.getParameter("faqdname");
		
		Connection conn = null;
		try {
			 conn = 
					ConnectionProvider.getConnection();
			 FaqDAO dao = FaqDAO.getInstance();
			
			conn.setAutoCommit(false);
			dao.updateReadcount(conn, faqnum);               
			FaqDTO dto = dao.selectOne(conn, faqnum); 
			
			
			request.setAttribute("dto", dto);
			conn.commit();
			
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			System.out.println("> view.doGet()...");
			e.printStackTrace();
		}finally {
			try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
		}
		
		return "/WEB-INF/view/FAQboard/view.jsp";
		
		
	}
	
}

	
	