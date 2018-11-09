package ask2.model;


import java.sql.Connection;
import java.sql.SQLException;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.CommandHandler;
import com.util.ConnectionProvider;

import ask.dao.AskDAO;
import ask.model.AskDTO;
import ask2.dao.Ask2DAO;



public class Edit_okHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
request.setCharacterEncoding("UTF-8");		
		
     AskDTO dto = new AskDTO();
     dto.setAcontent(request.getParameter("content"));
     dto.setEmail(request.getParameter("email"));
     dto.setPass(request.getParameter("pass"));
     dto.setWriter(request.getParameter("writer"));
     dto.setAtitle(request.getParameter("title"));
     dto.setAnum(Integer.parseInt(request.getParameter("num")));
     dto.setAfile(request.getParameter("file"));
		
		Connection conn = null;
					
		try {
			conn = 
					ConnectionProvider.getConnection();
			Ask2DAO dao = Ask2DAO.getInstance();
			
			int result = dao.edit(conn, dto);
			
						
			if( result == 0 ) {
				/*response.sendRedirect("list.do");*/
				
			}else if( result == -1 ) {
							
				/*int error=-1;
				request.setAttribute("error", error);*/
				
				
				request.setAttribute("fs", "n");
				return "ask2_list.do?error=-1";
			
		}
		} catch (Exception e) {
			System.out.println("> Edit.doPost()...");
			e.printStackTrace();
		}finally {
			try {conn.close();} catch (SQLException e) {e.printStackTrace();}
		}	
		
		request.setAttribute("fs", "n");
		return "ask2_list.do";
		
		
	}
	
}

	
	