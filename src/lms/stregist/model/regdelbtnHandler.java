package lms.stregist.model;



import java.sql.Connection;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.CommandHandler;
import com.util.ConnectionProvider;

import lms.stregist.dao.InterviewLDAO;
import net.sf.json.JSONObject;

public class regdelbtnHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		
		int result = 0;
	    JSONObject data = null;		
		String tpid = request.getParameter("tpid");

		
		// 		
		try {
			Connection conn = 
					ConnectionProvider.getConnection();
			InterviewLDAO dao = InterviewLDAO.getInstance();
			
			
				data = new JSONObject();
				result = dao.delete(conn, tpid);	          
		        data.put("count", result);  
		        request.setAttribute("data", data);		
					
		
			
		
		}catch (Exception e) {
			System.out.println("> Delete.doPost()...");
			e.printStackTrace();
		}finally {
			
		}
		
		request.setAttribute("fs", "n");
		return "/WEB-INF/view/stregist/save_ok.jsp";
		
	}
	
}

	
	