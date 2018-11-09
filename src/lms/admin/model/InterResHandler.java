package lms.admin.model;


import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.CommandHandler;
import com.util.ConnectionProvider;

import lms.admin.dao.InterviewVIDAO;
import net.sf.json.JSONObject;



public class InterResHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
    request.setCharacterEncoding("UTF-8");

    
    
    int result = 0;
    JSONObject data = null;
	InterviewVDTO dto = new InterviewVDTO();

		dto.setIresult(request.getParameter("passFail"));
        dto.setMemberid(request.getParameter("memberid"));
		dto.setTpid(request.getParameter("tpid"));			
		
		try {
			Connection conn = 
					ConnectionProvider.getConnection();
			InterviewVIDAO dao = InterviewVIDAO.getInstance();
			
			
			data = new JSONObject(); 
	        result = dao.update(conn, dto);	           
	        data.put("count", result);  
	        request.setAttribute("data", data);			
			

		} catch (Exception e) {
			System.out.println("> Write.doPost()...");
			e.printStackTrace();
		}finally {
			
		}
		return "/WEB-INF/view/interview/save_ok.jsp";
		
	}
	
}

	
	