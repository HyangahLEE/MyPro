package lms.manager.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.CommandHandler;

import lms.manager.dao.ManagerDAO;


public class LoginHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		
		
		
		
		request.setCharacterEncoding("UTF-8");
		
		String url = "/WEB-INF/view/logon/lmsManagerLogin.jsp";
		
		String mgId = request.getParameter("mgId");
		String mPwd = request.getParameter("mPwd");
		
		ManagerDAO dao = ManagerDAO.getInstance();		
			
		int result = dao.userCheck(mgId, mPwd);
		
		if ( result == 1) {

			HttpSession session = request.getSession();
			session.setAttribute("loginUser", mgId);			
			url = "/regist_list.do";
			
		}else if ( result == 0) {
			request.setAttribute("message", "비번이 다릅니다.");			
			
		}else if ( result == -1) {
			request.setAttribute("message", "아이디나 비번이 다릅니다..");						
		}		
		return url;
	}
}
