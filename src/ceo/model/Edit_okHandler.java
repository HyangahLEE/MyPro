package ceo.model;


import java.sql.Connection;
import java.sql.SQLException;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.CommandHandler;
import com.util.ConnectionProvider;

public class Edit_okHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
request.setCharacterEncoding("UTF-8");		
		
     CeoDTO dto = new CeoDTO();
     dto.setCeocontent(request.getParameter("ceocontent"));
    
     dto.setCeo(request.getParameter("ceo"));
     dto.setCeotitle(request.getParameter("ceotitle"));
     dto.setCeoid(Integer.parseInt(request.getParameter("ceoid")));
		
		Connection conn = null;
					
		try {
			conn = 
					ConnectionProvider.getConnection();
			ceo.dao.CeoDAO dao = ceo.dao.CeoDAO.getInstance();
			
			int result = dao.edit(conn, dto);
			
						
			if( result == -1 ) {
								
				
				request.setAttribute("fs", "n");
				 return "ceo_list.do?error=-1"; 
				
			}
		} catch (Exception e) {
			System.out.println("> Edit.doPost()...");
			e.printStackTrace();
		}finally {
			try {conn.close();} catch (SQLException e) {e.printStackTrace();}
		}	
		//에러 잡고 list.do로 떠야 하므로, redirect 시켜야 한다.
		request.setAttribute("fs", "n");
		return "ceo_list.do";
		
		
	}
	
}

	
	