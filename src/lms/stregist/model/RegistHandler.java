package lms.stregist.model;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.util.ConnectionProvider;

import lms.stregist.dao.InterviewLDAO;




public class RegistHandler implements com.util.CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
			 
	 
		
		return "/WEB-INF/view/stregist/write.jsp";
	}

}
