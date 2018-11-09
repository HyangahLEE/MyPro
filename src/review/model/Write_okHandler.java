package review.model;


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

import review.dao.ReviewDAO;


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
				ReviewDAO dao = ReviewDAO.getInstance();
				
				int result = dao.insert(conn, dto);
							
				if( result == 1 ) {
					return "review_list.do";     			
				}
				
	    }catch(Exception e){
	        e.printStackTrace();
	    }
		
		
		return "review_list.do";
		
	}
	
}

	
	