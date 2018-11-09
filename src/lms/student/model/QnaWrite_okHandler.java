package lms.student.model;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.CommandHandler;
import com.util.ConnectionProvider;

import lms.student.dao.QuestionDAO;
import lms.student.dto.QuestionDTO;

public class QnaWrite_okHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");

		/* 추가 */
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("loginUser");

		QuestionDTO dto = new QuestionDTO();
		dto.setContent(request.getParameter("content"));
		dto.setQtitle(request.getParameter("qtitle"));
		dto.setLogid(request.getParameter("logid"));

		if (request.getParameter("p_num") == "" || request.getParameter("p_num") == null) { // ?占쏙옙占�? ?占쏙옙占�?
			dto.setStep(0);
			dto.setDepth(0);
		} else {

			dto.setQid(Integer.parseInt(request.getParameter("p_num").trim()));
			dto.setRef(Integer.parseInt(request.getParameter("p_ref")));
			dto.setStep(Integer.parseInt(request.getParameter("p_step")));
			dto.setDepth(Integer.parseInt(request.getParameter("p_depth")));
		}
		try {
			Connection conn = ConnectionProvider.getConnection();
			QuestionDAO dao = QuestionDAO.getInstance();

			int result = dao.insert(conn, dto);
			System.out.println(result);

			if (result == 1) {
				return "question_list.do";
			}
		} catch (Exception e) {
			System.out.println("> Write.doPost()...");
			e.printStackTrace();
		} finally {

		}
		return "question_list.do";
	}

}
