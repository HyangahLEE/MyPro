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

import lms.student.dto.SurveyDTO;


public class SurveyHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("loginUser");
		
		System.out.println(" SurveyHandler 넘어오는 값: " + memberId);
		
		String sql = "SELECT * FROM V_SURVEYDIR WHERE memberId = ? ";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<SurveyDTO> list = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
			SurveyDTO sdto = null;
			
			if (rs.next() ) {
				list = new ArrayList<>();
				
				do {
					sdto = new SurveyDTO();
					sdto.setMemberId(rs.getString("memberId"));
					sdto.setSurQuestion(rs.getString("surQuestion"));
					sdto.setSsmTime(rs.getDate("ssmTime"));
					sdto.setSsmDiv(rs.getString("ssmDiv"));
					sdto.setpName(rs.getString("pName"));
					list.add(sdto);
				} while (rs.next());
			}
			request.setAttribute("list", list);
			request.setAttribute("size", list == null ? 0 : list.size());
		} catch (Exception e) {
			System.out.println(" SurveyHandler 에러 " + e.toString());
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
		
		return "/WEB-INF/view/survey/lmsTestSurvey.jsp";
		
	}

}
