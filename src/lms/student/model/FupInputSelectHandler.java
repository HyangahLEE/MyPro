package lms.student.model;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.CommandHandler;
import com.util.ConnectionProvider;

import lms.student.dao.MemberDAO;
import lms.student.dto.FollowUpdateDTO;

public class FupInputSelectHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("loginUser");
		FollowUpdateDTO fudto = null;
		
		Connection conn = null;
		
		try{
			conn = ConnectionProvider.getConnection();
			MemberDAO dao = MemberDAO.getInstance();
			
			fudto = dao.select(conn, memberId);
			
				
		} catch (Exception e) {
			System.out.println("> FupInputSelectHandler error ");
			e.printStackTrace();
		}finally {
			try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
		}
		
		request.setAttribute("fudto", fudto);


		return "/WEB-INF/view/followup/lmsFollowUpServicePage.jsp";
	}
	
	

}
