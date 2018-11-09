package logon.model;



import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.SecureRandom;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.CommandHandler;


import logon.dao.MemberDAO;

import sist.mainHandler.MemberDTO;

public class LogonOkHandler implements CommandHandler{



	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		
		//네이버 아디이
		 String clientId = "K_HtKTCrVTsza2njHWC3 ";//애플리케이션 클라이언트 아이디값";
		    String clientSecret = "U6ejOBXWpN";//애플리케이션 클라이언트 시크릿값";
		    String code = request.getParameter("code");
		    String state = request.getParameter("state");
		    String redirectURI = URLEncoder.encode("http://localhost/index.do", "UTF-8");
		    String apiURL;
		    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
		    apiURL += "client_id=" + clientId;
		    apiURL += "&client_secret=" + clientSecret;
		    apiURL += "&redirect_uri=" + redirectURI;
		    apiURL += "&code=" + code;
		    apiURL += "&state=" + state;
		    String access_token = "";
		    String refresh_token = "";
		    System.out.println("apiURL="+apiURL);
		    try {
		      URL url = new URL(apiURL);
		      HttpURLConnection con = (HttpURLConnection)url.openConnection();
		      con.setRequestMethod("GET");
		      int responseCode = con.getResponseCode();
		      BufferedReader br;
		      System.out.print("responseCode="+responseCode);
		      if(responseCode==200) { // 정상 호출
		        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		      } else {  // 에러 발생
		        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		      }
		      String inputLine;
		      StringBuffer res = new StringBuffer();
		      while ((inputLine = br.readLine()) != null) {
		        res.append(inputLine);
		      }
		      br.close();
		      if(responseCode==200) {
		        System.out.println(res.toString());
		      }
		    } catch (Exception e) {
		      System.out.println(e.toString());
		    }
		
		//네이버 아이디 end

		String url = "/WEB-INF/view/logon/logon_ok.jsp";
		
		MemberDTO dto = new MemberDTO();
		String memberId = request.getParameter("memberid");
		String mPwd = request.getParameter("mpwd");
		String mname = request.getParameter("mname");
		
		MemberDAO dao = MemberDAO.getInstance();
		
		dto.setMemberid(memberId);
		dto.setMpwd(mPwd);
		dto.setMname(mname);
		/*추가*/
		/*MemberDTO dto = new MemberDTO();*/
		
		int cnt = dao.loginCheck(dto);
		int result = dao.managerChk(memberId, mPwd);
		
		
		request.setAttribute("cnt", cnt);	
		request.setAttribute("result", result);
		
		if ( cnt == 1 && (result == 8 || result == 9)) {
			
/*			MemberDTO dto = dao.getMember(memberId);*/
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", memberId);
			
			
			url = "/WEB-INF/view/logon/logon_ok.jsp";
			
		}else if ( (cnt==0 && (result ==8 || result == 9)) || (result==8 && (cnt ==0 || cnt == -1))          ) {
			request.setAttribute("message", "비밀번호가 맞지 않습니다.");
						
			url="/WEB-INF/view/logon/loginMain.jsp";
	
		}else if ( cnt!=1 && result==8 || cnt!=1 && result==9 || result!=7 && cnt==0 || result!=7 && cnt==-1  )  {
			request.setAttribute("message", "아이디나 비밀번호가 정확하지 않습니다.");
			
			
			url="/WEB-INF/view/logon/loginMain.jsp";
		}else if(result==7 && (cnt == 0 || cnt == -1 )) {
			HttpSession session = request.getSession();
			session.setAttribute("admin", memberId);
			
			System.out.println("result = 7 ");
			
			url = "/WEB-INF/view/logon/logon_ok.jsp";
		}
		return url;
	}
		
///////
		


}


