package lms.logonMove.model;


import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.CommandHandler;
import com.util.ConnectionProvider;

import lms.admin.dao.InterviewVIDAO;
import net.sf.json.JSONObject;



public class adminMoveHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
    request.setCharacterEncoding("UTF-8");

    
    
    
    
		return "/WEB-INF/view/logon/lmsManagerLogin.jsp";
		
	}
	
}

	
	