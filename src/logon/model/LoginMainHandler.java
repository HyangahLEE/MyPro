package logon.model;

import java.math.BigInteger;
import java.net.URLEncoder;
import java.security.SecureRandom;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.CommandHandler;


public class LoginMainHandler implements CommandHandler{

	@java.lang.Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
				//네이버
				String clientId = "K_HtKTCrVTsza2njHWC3";//애플리케이션 클라이언트 아이디값";
				String redirectURI = URLEncoder.encode("http://localhost/index.do", "UTF-8");
				SecureRandom random = new SecureRandom();
				String state = new BigInteger(130, random).toString();
				String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
				apiURL += "&client_id=" + clientId;
				apiURL += "&redirect_uri=" + redirectURI;
				apiURL += "&state=" + state;
				HttpSession session = request.getSession();
				session.setAttribute("state", state);
				request.setAttribute("apiURL",apiURL);
				//네이버 end
		
		// 인코딩 처리
		request.setCharacterEncoding("utf-8"); 
		
		//세션
		/* HttpSession session =  request.getSession();*/
			
		if(session.getAttribute("loginUser") == null ||session.getAttribute("state") == null) {
		//로그인	안되어있음
			
		return "/WEB-INF/view/logon/loginMain.jsp";
		}else {
			/*request.setAttribute("message", "이미 로그인 상태입니다.");*/
			return "/WEB-INF/view/main/index.jsp";
		
		
		}
	}

	
	
}
