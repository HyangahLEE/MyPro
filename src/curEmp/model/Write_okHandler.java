package curEmp.model;



import java.sql.Connection;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.CommandHandler;
import com.util.ConnectionProvider;

import curEmp.dao.curEmpDAO;
import hire.dao.HireDAO;


public class Write_okHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {		

		
		request.setCharacterEncoding("UTF-8");
		
		
	
	    curEmpDTO dto = new curEmpDTO();       
	     
			
	       dto.setMname(request.getParameter("mname"));
	       dto.setCecname(request.getParameter("cecname"));
	       dto.setCecurrfield(request.getParameter("cecurrfield"));
	    	
		   
	        try {
	            Connection conn = 
						ConnectionProvider.getConnection();
				curEmpDAO dao = curEmpDAO.getInstance();
				
				int result = dao.insert(conn, dto);
							
				if( result == 1 ) {
					return "curEmp_list.do";     			
				}
				
	    }catch(Exception e){
	        e.printStackTrace();
	    }
		
		
		return "curEmp_list.do";
		
	}
	
}

	
	