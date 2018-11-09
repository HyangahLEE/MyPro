package ask2.model;




import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.CommandHandler;


public class WriteHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
				  
		
		return "/WEB-INF/view/ask2/write.jsp";
		
		
	}
	
}

	
	