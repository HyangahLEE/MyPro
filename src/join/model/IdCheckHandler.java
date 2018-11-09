package join.model;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.util.CommandHandler;


import join.dao.JoinDAO;
import net.sf.json.JSONObject;
import sist.mainHandler.MemberDTO;


public class IdCheckHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		  response.setContentType("text/html;charset=utf-8");
		
		
		String id = request.getParameter("idinput");
        
        
       /* boolean result = dao.duplicateIdCheck(id);
        String idcheck = "";
      
        
        
 
        if(result==true)    idcheck="0"; // �븘�씠�뵒 以묐났
        else        idcheck="1";
        System.out.println(">> res = " + result);
        request.setAttribute("idcheck", idcheck);	
        request.setAttribute("result", result);*/
        
        MemberDTO dto = new MemberDTO();
        dto.setMemberid(id);
        
        JoinDAO dao = JoinDAO.getInstance();
        JSONObject data = dao.duplicateIdCheck(id);
        request.setAttribute("data", data);	
        		
		return "/WEB-INF/view/join/idCheck_ok.jsp";
	}

}
