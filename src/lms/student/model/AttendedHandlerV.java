package lms.student.model;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.CommandHandler;
import com.util.ConnectionProvider;

import lms.student.dao.SattendmDAO;

public class AttendedHandlerV implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		Connection conn = ConnectionProvider.getConnection();

		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("loginUser");

		request.setAttribute("list", SattendmDAO.getMember(conn, memberId));
		request.setAttribute("month", SattendmDAO.getMonth(conn, memberId));
		return "/WEB-INF/view/attendance/lmsAttendancePage.jsp";

	}

}
