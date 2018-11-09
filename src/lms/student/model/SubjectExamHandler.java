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

import lms.student.dto.TestDirDTO;

public class SubjectExamHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("loginUser");

		System.out.println(" SubjectExamPage 넘어오는 값: " + memberId);

		String sql = "SELECT * FROM V_TESTDIR WHERE memberId = ? ";

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<TestDirDTO> list = null;

		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
			TestDirDTO tddto = null;

			if (rs.next()) {
				list = new ArrayList<>();
				do {
					tddto = new TestDirDTO();
					tddto.setMemberId(rs.getString("memberId"));
					tddto.setSemDiv(rs.getString("semDiv"));
					tddto.setSemScore(rs.getInt("semScore"));
					tddto.setSemCurr(rs.getString("semCurr"));
					tddto.setSubjectsName(rs.getString("subjectsName"));
					tddto.setSubjectsDiv(rs.getString("subjectsDiv"));
					tddto.setpName(rs.getString("pName"));
					tddto.setSemDate(rs.getDate("semDate"));
					tddto.setSemTime(rs.getInt("semTime"));
					tddto.setSemType(rs.getString("semType"));
					tddto.setUnitName(rs.getString("unitName"));
					list.add(tddto);
				} while (rs.next());
			}
			request.setAttribute("list", list);
			request.setAttribute("size", list == null ? 0 : list.size());
		} catch (Exception e) {
			System.out.println(" SubjectExamHandler 에러 " + e.toString());
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

		return "/WEB-INF/view/subjectexam/lmsTestSubject.jsp";

	}

}
