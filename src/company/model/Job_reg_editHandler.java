package company.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.CommandHandler;

public class Job_reg_editHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		
		return "/WEB-INF/view/company/job_reg_edit.jsp";
	}
	
}
