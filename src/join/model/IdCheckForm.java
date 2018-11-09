package join.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.CommandHandler;

import join.dao.JoinDAO;
import net.sf.json.JSONObject;

public class IdCheckForm implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String id = request.getParameter("idinput");
        JoinDAO dao = JoinDAO.getInstance();
        
       /* boolean result = dao.duplicateIdCheck(id);
        String idcheck = "";
        if(result==true)    idcheck="0"; // 아이디 중복 
        else        idcheck="1";
        System.out.println(">> res = " + result);
        request.setAttribute("idcheck", idcheck);	
        request.setAttribute("result", result);*/
        
        
        JSONObject data = dao.duplicateIdCheck(id);
    
        request.setAttribute("data", data);	
		
		
		return "/WEB-INF/view/join/idCheck.jsp";
	}

}
