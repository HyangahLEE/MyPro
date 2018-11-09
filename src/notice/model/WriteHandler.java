package notice.model;




import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.CommandHandler;


public class WriteHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		/*String adid = request.getParameter("adid");
		request.setAttribute("adid", adid);*/
		
		/*?adid=${param.adid}*/
		/*전 단계에서 받아온 파라미터 가지고 감*/
		
		return "/WEB-INF/view/notice/write.jsp";
		
		
	}
	
}

	
	