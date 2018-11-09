package logon.model;

import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.CommandHandler;

import join.model.Myemail;
import logon.dao.MemberDAO;



public class FindPwdOkHandler  implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		String memberid = request.getParameter("memberid");
		String to = request.getParameter("memail");
		String from = request.getParameter("from");
		
		
		
		MemberDAO dao = MemberDAO.getInstance();
		String sb = dao.randomPwd();
		
		dao.UpdatePwd(memberid,sb);		
		
		///이메일 인증 !!!!!!!!!
				//from -> memail
				//to -> dlgiddk30@naver.com
		
				String subject = "[쌍용교육센터] 임시 비밀번호가 발급되었습니다.";
				String content = "기재된 임시 비밀번호로 로그인 하신 후\r\n" + 
						"비밀번호를 변경해 주시기 바랍니다.\r\n" + 
						"임시 비밀번호 :" + sb;
				
				Properties p = new Properties(); // 정보를 담을 객체
				 
				p.put("mail.smtp.host","smtp.naver.com"); // 네이버 SMTP
				 
				p.put("mail.smtp.port", "465");
				p.put("mail.smtp.starttls.enable", "true");
				p.put("mail.smtp.auth", "true");
				p.put("mail.smtp.debug", "true");
				p.put("mail.smtp.socketFactory.port", "465");
				p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
				p.put("mail.smtp.socketFactory.fallback", "false");
				// SMTP 서버에 접속하기 위한 정보들
				 
				try{
				    Authenticator auth = new Myemail();
				    Session ses = Session.getInstance(p, auth);
				     
				    ses.setDebug(true);
				     
				    MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체
				    msg.setSubject(subject); // 제목
				     
				    Address fromAddr = new InternetAddress(from);
				    msg.setFrom(fromAddr); // 보내는 사람
				     
				    Address toAddr = new InternetAddress(to);
				    msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람
				     
				    msg.setContent(content, "text/html;charset=UTF-8"); // 내용과 인코딩
				     
				    Transport.send(msg); // 전송
				} catch(Exception e){
				    e.printStackTrace();
				    System.out.println("비밀번호 메일 전송시 오류 발생");
				    // 오류 발생시 뒤로 돌아가도록
				   
				}
				 
				//이메일 인증 end
	
		
		
		return "/WEB-INF/view/logon/findPwd_ok.jsp";
	}

}
