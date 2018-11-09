package logon.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.CommandHandler;

import logon.dao.MemberDAO;
import net.sf.json.JSONObject;
import sist.mainHandler.MemberDTO;

public class FindIdOkHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		
		// ?
		String mname = request.getParameter("mname");
		String memail =request.getParameter("memail");
		String mphone =request.getParameter("mphone");
		
		
		MemberDTO dto = new MemberDTO();
		/*dto.setMname(mname);
		dto.setMemail(memail);
		dto.setMphone(mphone);*/
		
		MemberDAO dao = MemberDAO.getInstance();
		 
		JSONObject data = dao.findId(mname,memail,mphone);
		
		 
		
		request.setAttribute("data", data);
		
		
		
		return "/WEB-INF/view/logon/findId_ok.jsp";
	}

}
