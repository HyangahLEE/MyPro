package ceo.model;


import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.CommandHandler;
import com.util.ConnectionProvider;

import ceo.dao.CeoDAO;




public class Write_okHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		CeoDTO dto = new CeoDTO();
		dto.setCeocontent(request.getParameter("ceocontent"));
	

		dto.setCeo(request.getParameter("ceo"));
		dto.setCeotitle(request.getParameter("ceotitle"));
		
		// hidden p_num , p_ref, p_step, p_depth ?占쏙옙占�?
	if ( request.getParameter("p_num") == "" || request.getParameter("p_num") == null ) {  
					dto.setStep(0);
					dto.setDepth(0);
			}else { 
				
				// dto    setNum				
				dto.setCeoid(Integer.parseInt(request.getParameter("p_num").trim()));
				dto.setRef(Integer.parseInt(request.getParameter("p_ref"))); 		
				dto.setStep(Integer.parseInt(request.getParameter("p_step")));		
				dto.setDepth(Integer.parseInt(request.getParameter("p_depth")));	
			}
		try {
			Connection conn = 
					ConnectionProvider.getConnection();
			CeoDAO dao = CeoDAO.getInstance();
			
			int result = dao.insert(conn, dto);
			
						
			if( result == 1 ) {
				return "ceo_list.do";
			}
		} catch (Exception e) {
			System.out.println("> Write.doPost()...");
			e.printStackTrace();
		}finally {
			
		}
		return "ceo_list.do";
		
	}
	
}

	
	