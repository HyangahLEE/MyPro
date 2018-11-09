package logon.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.CommandHandler;

import logon.dao.MemberDAO;
import net.sf.json.JSONObject;
import sist.mainHandler.MemberDTO;

public class FindIdHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
	
		
		
		return "/WEB-INF/view/logon/findId.jsp";
	}

}
