package lms.student.model;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.CommandHandler;
import com.util.ConnectionProvider;

import lms.student.dao.QuestionDAO;

public class QnaDeleteHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		/* 추가 */
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("loginUser");

		int num = Integer.parseInt(request.getParameter("num").trim());

		//
		try {
			Connection conn = ConnectionProvider.getConnection();
			QuestionDAO dao = QuestionDAO.getInstance();

			int result = dao.delete(conn, num);

			if (result == 0) {

				return "question_list.do";

			} else if (result == -1) {
				request.setAttribute("fs", "n");

				return "question_list.do?error=-1";

			}
		} catch (Exception e) {
			System.out.println("> Delete.doPost()...");
			e.printStackTrace();
		} finally {

		}

		request.setAttribute("fs", "n");
		return "question_list.do";

	}

}
