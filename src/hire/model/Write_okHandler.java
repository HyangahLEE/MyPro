package hire.model;



import java.sql.Connection;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.CommandHandler;
import com.util.ConnectionProvider;

import hire.dao.HireDAO;


public class Write_okHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {		

		
		request.setCharacterEncoding("UTF-8");
		
		
	
	    HireDTO dto = new HireDTO();       
	     
			
			dto.setHiworkplace(request.getParameter("hiworkplace"));	
			dto.setHiemail(request.getParameter("hiemail"));
			dto.setHicontent(request.getParameter("hicontent"));
			dto.setJrid(request.getParameter("jrid"));
			dto.setHnumber(Integer.parseInt(request.getParameter("hnumber")));
			dto.setCompanyname(request.getParameter("companyname"));
			dto.setHomepage(request.getParameter("homepage"));
			dto.setHtye(request.getParameter("htype"));
			dto.setHpay(Integer.parseInt(request.getParameter("hpay")));
			dto.setHtel(request.getParameter("htel"));
			dto.setHpossi(request.getParameter("hpossi"));
			dto.setDeadline(request.getParameter("deadline"));
			
		
		   
	        try {
	            Connection conn = 
						ConnectionProvider.getConnection();
				HireDAO dao = HireDAO.getInstance();
				
				int result = dao.insert(conn, dto);
							
				if( result == 1 ) {
					return "hire_list.do";     			
				}
				
	    }catch(Exception e){
	        e.printStackTrace();
	    }
		
		
		return "hire_list.do";
		
	}
	
}

	
	