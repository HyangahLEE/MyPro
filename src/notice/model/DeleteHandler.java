package notice.model;


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
		

		String pass = request.getParameter("pass");
		int num = Integer.parseInt(request.getParameter("num"));
		
		// 		
		try {
			Connection conn = 
					ConnectionProvider.getConnection();
			notice.dao.NoticeDAO dao = notice.dao.NoticeDAO.getInstance();
			
			int result = dao.delete(conn, num, pass);
			
						
			if( result == 0 ) {
				
				
				return "notice_list.do";
			
					
			}else if( result == -1 ) {
								
				
				request.setAttribute("fs", "n");
				 return "notice_list.do?error=-1"; 
			
		}
		}catch (Exception e) {
			System.out.println("> Delete.doPost()...");
			e.printStackTrace();
		}finally {
			
		}
		
			  
		
		//return "/WEB-INF/view/list.jsp";
		request.setAttribute("fs", "n");
		return "notice_list.do";
		
	}
	
}

	
	