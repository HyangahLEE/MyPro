package join.model;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.CommandHandler;

import join.dao.JoinDAO;
import logon.dao.MemberDAO;
import net.sf.json.JSONObject;
import sist.mainHandler.MemberDTO;

public class JoinComfirmHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		JoinDAO dao = JoinDAO.getInstance();
		String memberid = request.getParameter("memberid");
		String mname = request.getParameter("mname");
		String mpwd = request.getParameter("mpwd");
		String from = request.getParameter("from");
		String memail = request.getParameter("memail");
		String mbirth = request.getParameter("mbirth");
		int mgender = Integer.parseInt(request.getParameter("mgender"));
		int zipNo = Integer.parseInt(request.getParameter("zipNo"));
		String roadFullAddr = request.getParameter("roadFullAddr");
		String addrdetail = request.getParameter("addrDetail");
		String mphone = request.getParameter("mphone");
		String mtel = request.getParameter("mtel");
		
/*		int fail = dao.FailIdCheck(memberid);
		request.setAttribute("fail", fail);*/
		
		MemberDTO member = new MemberDTO();
		member.setMemberid(memberid);
		member.setMname(mname);
		member.setMpwd(mpwd);
		member.setMemail(memail);
		member.setMbirth(mbirth);		
		member.setMgender(mgender);
		member.setMzipcode(zipNo);
		member.setMaddr1(roadFullAddr+" "+addrdetail);
		member.setMtel(mtel);
		member.setMphone(mphone);
		
		
		int cnt = dao.insertMember(member);
		
				
		///�씠硫붿씪 �씤利� !!!!!!!!!
		//from -> dlgiddk30@naver.com
		//to -> memail
		String subject = " 쌍용교육센터 가입을 축하드립니다.";
		String content = "인증이 완료 되었습니다. 홈페이지에서 로그인 해주세요.";
		Properties p = new Properties(); // �젙蹂대�� �떞�쓣 媛앹껜
		
		/*Hashtables를 상속 받았기 때문에 Map의 속성 즉, Key와 Value를 갖는다.
		HashMap과 큰 차이가 없지만, Properties 클래스는 파일 입출력을 지원한다.
*/

		 
			p.put("mail.smtp.host","smtp.naver.com"); // �꽕�씠踰� SMTP			 
			p.put("mail.smtp.port", "465");
			p.put("mail.smtp.starttls.enable", "true");
			p.put("mail.smtp.auth", "true");
			p.put("mail.smtp.debug", "true");
			p.put("mail.smtp.socketFactory.port", "465");
			p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			p.put("mail.smtp.socketFactory.fallback", "false");
		// SMTP �꽌踰꾩뿉 �젒�냽�븯湲� �쐞�븳 �젙蹂대뱾
		 
		try{
		    Authenticator auth = new Myemail();
		    Session ses = Session.getInstance(p, auth);
		     
		    ses.setDebug(true);
		     
		    MimeMessage msg = new MimeMessage(ses); // 硫붿씪�쓽 �궡�슜�쓣 �떞�쓣 媛앹껜
		    msg.setSubject(subject); // �젣紐�
		     
		    Address fromAddr = new InternetAddress(from);
		    msg.setFrom(fromAddr); // 蹂대궡�뒗 �궗�엺
		     
		    Address toAddr = new InternetAddress(memail);
		    msg.addRecipient(Message.RecipientType.TO, toAddr); // 諛쏅뒗 �궗�엺
		     
		    msg.setContent(content, "text/html;charset=UTF-8"); // �궡�슜怨� �씤肄붾뵫
		     
		    Transport.send(msg); // �쟾�넚
		} catch(Exception e){
		    e.printStackTrace();
		    System.out.println("<script>alert('Send Mail Failed..');history.back();</script>");
		    // �삤瑜� 諛쒖깮�떆 �뮘濡� �룎�븘媛��룄濡�
		   
		}
		 
		//�씠硫붿씪 �씤利� end
		
		
				return "/WEB-INF/view/join/join_ok.jsp";  

		
	}

}
