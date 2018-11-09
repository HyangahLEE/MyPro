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

public class QnaViewHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		/*추가*/
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("loginUser");
		
		
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		Connection conn = null;
		try {
			 conn = 
					ConnectionProvider.getConnection();
			 QuestionDAO dao = QuestionDAO.getInstance();
			
			conn.setAutoCommit(false);
			dao.updateReadcount(conn, num);               
			QuestionDTO dto = dao.selectOne(conn, num); 			
			request.setAttribute("dto", dto);
			conn.commit();
			
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			System.out.println("> view.doGet()...");
			e.printStackTrace();
		}finally {
			try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
		}
		
		return "/WEB-INF/view/qna/qnaView.jsp";
		
	}

	
	
}
