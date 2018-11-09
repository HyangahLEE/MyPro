package lms.student.model;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.CommandHandler;
import com.util.ConnectionProvider;

import lms.student.dao.QuestionDAO;
import lms.student.dto.QuestionDTO;

public class QnaEdit_okHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");

		/*추가*/
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("loginUser");
		
		
		QuestionDTO dto = new QuestionDTO();
		dto.setContent(request.getParameter("content"));
		dto.setQid(Integer.parseInt(request.getParameter("num")));
		dto.setQtitle(request.getParameter("title"));

		Connection conn = null;

		try {
			conn = ConnectionProvider.getConnection();
			QuestionDAO dao = QuestionDAO.getInstance();

			int result = dao.edit(conn, dto);

			if (result == 0) {
				/* response.sendRedirect("list.do"); */
				// return "notice_list.do";

				// int error= 0;
				// request.setAttribute("error", error);

			} else if (result == -1) {

				/* return "list.do"; */

				// int error=-1;
				// request.setAttribute("error", error);
				request.setAttribute("fs", "n");
				return "question_list.do?error=-1";

			}
		} catch (Exception e) {
			System.out.println("> Edit.doPost()...");
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		// 에러 잡고 list.do로 떠야 하므로, redirect 시켜야 한다.
		request.setAttribute("fs", "n");
		return "question_list.do";

	}

}
