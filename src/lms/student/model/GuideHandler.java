package lms.student.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.CommandHandler;
import com.util.ConnectionProvider;

import lms.student.dto.TrainingDTO;

public class GuideHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("loginUser");

//		String memberId = request.getParameter("memberId");

		System.out.println(" GuideBookPage 넘어오는 값: " + memberId);

		String sql = "SELECT * FROM V_MTPINFO WHERE memberId = ? ";

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<TrainingDTO> list = null;

		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
			TrainingDTO tdto = null;

			if (rs.next()) {
				list = new ArrayList<>();
				do {
					tdto = new TrainingDTO();
					/* dto.setMemberId(rs.getString("memberId")); */
					tdto.setTpName(rs.getString("tpName"));
					tdto.setTpGuideBook(rs.getString("tpGuideBook"));
					tdto.setpGuide(rs.getString("pGuide"));
					list.add(tdto);
				} while (rs.next());
			}
			request.setAttribute("list", list);
			request.setAttribute("size", list == null ? 0 : list.size());

		} catch (Exception e) {
			System.out.println(" GuideHandler 에러 " + e.toString());
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (Exception e2) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception e2) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (Exception e2) {
				}
		}

		return "/WEB-INF/view/guidebook/lmsStudentGuidePage.jsp";

	}

}
