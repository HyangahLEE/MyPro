package lms.student.model;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.CommandHandler;

import lms.student.dao.MemberDAO;
import lms.student.dto.PreTestScoreDTO;


public class PreTestScoreHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		/*String memberId = (String) session.getAttribute("loginUser");*/
		
		int answer1 = Integer.parseInt(request.getParameter("quiz1"));
		int answer2 = Integer.parseInt(request.getParameter("quiz2"));
		int answer3 = Integer.parseInt(request.getParameter("quiz3"));
		int answer4 = Integer.parseInt(request.getParameter("quiz4"));
		int answer5 = Integer.parseInt(request.getParameter("quiz5"));
		int answer6 = Integer.parseInt(request.getParameter("quiz6"));
		int answer7 = Integer.parseInt(request.getParameter("quiz7"));
		int answer8 = Integer.parseInt(request.getParameter("quiz8"));
		int answer9 = Integer.parseInt(request.getParameter("quiz9"));
		int answer10 = Integer.parseInt(request.getParameter("quiz10"));
		int totalScore = Integer.parseInt(request.getParameter("totalScore"));
		String memberId = request.getParameter("memberId");
		String seCurr = request.getParameter("seCurr");
		
		System.out.println(">> " + seCurr);
		
	/*	String method = request.getMethod();*/
		
		/*if (method.equals("GET")) {
			seCurr = new String(seCurr.getBytes("8859_1"), "UTF-8");
		}*/
		
/*		String seCurr =URLDecoder.decode(request.getParameter("seCurr"), "UTF-8");*/
		
		
		System.out.println(" PreTestScoreHandler 넘어오는 값 input[type='hidden'] : " + memberId);
		
		PreTestScoreDTO ptdto = new PreTestScoreDTO();
		
		ptdto.setAnswer1(answer1);
		ptdto.setAnswer2(answer2);
		ptdto.setAnswer3(answer3);
		ptdto.setAnswer4(answer4);
		ptdto.setAnswer5(answer5);
		ptdto.setAnswer6(answer6);
		ptdto.setAnswer7(answer7);
		ptdto.setAnswer8(answer8);
		ptdto.setAnswer9(answer9);
		ptdto.setAnswer10(answer10);
		ptdto.setTotalScore(totalScore);
		ptdto.setMemberId(memberId);
		ptdto.setSeCurr(seCurr);
		
		
		
		MemberDAO dao = MemberDAO.getInstance();
		
		dao.updateTestScore(ptdto);
		
		//수정
		return "/basictest.do";
		
	}

}
