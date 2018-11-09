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

import lms.student.dto.PreTestDTO;


public class BasicTestHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("loginUser");
		
		System.out.println(" BasicTestPage 넘어오는 값 : " + memberId);
		
		String sql = "SELECT * FROM V_PRETEST WHERE memberId = ?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<PreTestDTO> list = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
			PreTestDTO pdto = null;
			
			if (rs.next()) {
				list = new ArrayList<>();
				do {
					pdto = new PreTestDTO();
					pdto.setSeName(rs.getString("seName"));
					pdto.setSeType(rs.getString("seType"));
					pdto.setSeScore(rs.getInt("seScore"));
					pdto.setpName(rs.getString("pName"));
					pdto.setMemberId(rs.getString("memberId"));
					pdto.setSeCurr(rs.getString("seCurr"));
					pdto.setSeTime(rs.getInt("seTime"));
					pdto.setSeNumber(rs.getInt("seNumber"));
					pdto.setTotalScore(rs.getInt("totalScore"));
					list.add(pdto);
				} while (rs.next());
			}
			request.setAttribute("list", list);
			request.setAttribute("size", list == null ? 0 : list.size());
		} catch (Exception e) {
			System.out.println(" BasicTestHandler 에러 " + e.toString());
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
		
		return "/WEB-INF/view/basictest/lmsBasicTestPage.jsp";
		
	}

}
