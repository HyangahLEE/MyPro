package ceo.model;




import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.CommandHandler;


public class WriteHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		/*String adid = request.getParameter("adid");
		request.setAttribute("adid", adid);*/
		
		/*?adid=${param.adid}*/
		/*�� �ܰ迡�� �޾ƿ� �Ķ���� ������ ��*/
		
		return "/WEB-INF/view/CEOboard/write.jsp";
		
		
	}
	
}

	
	