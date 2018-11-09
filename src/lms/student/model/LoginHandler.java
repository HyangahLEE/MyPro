package lms.student.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.CommandHandler;

import lms.student.dao.MemberDAO;

public class LoginHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		String url = "/WEB-INF/view/logon/lmsStudendLogin.jsp";

		String memberId = request.getParameter("memberId");
		String mPwd = request.getParameter("mPwd");
		
		MemberDAO dao = MemberDAO.getInstance();
		
		/*異붽�*/
		/*MemberDTO dto = new MemberDTO();*/
		
		int result = dao.userCheck(memberId, mPwd);
		
		if ( result == 1) {
/*			MemberDTO dto = dao.getMember(memberId);*/
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", memberId);
			
			url = "/WEB-INF/view/logon/lmsStudentMainPage.jsp";
			
		}else if ( result == 0) {
			request.setAttribute("message", "비번이 다릅니다.");
			
			/*url ="/WEB-INF/view/logon/lmsStudendLogin.jsp";*/
			
		}else if ( result == -1) {
			request.setAttribute("message", "아이디나 비번이 다릅니다..");
			
		/*	url ="/WEB-INF/view/logon/mainTest.jsp";*/
		}
		
		return url;
	}

}
