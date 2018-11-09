package review2.model;


import java.io.File;
import java.sql.Connection;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;
import com.util.CommandHandler;
import com.util.ConnectionProvider;

import review.model.ReviewDTO;
import review2.dao.Review2DAO;



public class Write_okHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {		

		
		request.setCharacterEncoding("UTF-8");
		;
	    ReviewDTO dto = new ReviewDTO();         
	     
	    
	    
	        
	        
		    dto.setRtitle(request.getParameter("rtitle"));
	        dto.setWriter(request.getParameter("writer"));
			dto.setRcontent(request.getParameter("rcontent"));
			dto.setRdid(request.getParameter("rdid"));
		    
	        try {
	            Connection conn = 
						ConnectionProvider.getConnection();
				Review2DAO dao = Review2DAO.getInstance();
				
				int result = dao.insert(conn, dto);
							
				if( result == 1 ) {
					return "review2_list.do";     			
				}
				
	    }catch(Exception e){
	        e.printStackTrace();
	    }
		
		
		return "review2_list.do";
		
	}
	
}

	
	