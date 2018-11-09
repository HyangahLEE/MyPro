package lms.student.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.CommandHandler;
import com.util.ConnectionProvider;

import lms.student.dao.MemberDAO;
import lms.student.dto.FollowUpdateDTO;
import lms.student.dto.JapplicationDTO;


public class FollowUpHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("loginUser");
		
		System.out.println(" FollowUpPage 넘어오는 값 : " + memberId);
		
		String sql = "SELECT * FROM JAPPLICATION WHERE memberId = ? ";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<JapplicationDTO> list = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
			JapplicationDTO jdto = null;
			
			if (rs.next()) {
				list = new ArrayList<>();

				do {
					jdto = new JapplicationDTO();
					jdto.setMemberId(rs.getString("memberId"));
					jdto.sethSchool(rs.getString("hSchool"));
					jdto.setCollege(rs.getString("college"));
					jdto.setcDepartment(rs.getString("cDepartment"));
					jdto.setUniversity(rs.getString("university"));
					jdto.setuDepartment(rs.getString("uDepartment"));
					jdto.setgSchool(rs.getString("gSchool"));
					jdto.setgDepartment(rs.getString("gDepartment"));
					jdto.setWorkesA(rs.getString("workesA"));
					jdto.setWorkesB(rs.getString("workesB"));
					jdto.setWorkesC(rs.getString("workesC"));
					jdto.setWorketsYa(rs.getInt("worketsYa"));
					jdto.setWorketsMa(rs.getInt("worketsMa"));
					jdto.setWorketsDa(rs.getInt("worketsDa"));
					jdto.setWorketeYa(rs.getInt("worketeYa"));
					jdto.setWorketeMa(rs.getInt("worketeMa"));
					jdto.setWorketeDa(rs.getInt("worketeDa"));
					jdto.setWorketsYb(rs.getInt("worketsYb"));
					jdto.setWorketsMb(rs.getInt("worketsMb"));
					jdto.setWorketsDb(rs.getInt("worketsDb"));
					jdto.setWorketeYb(rs.getInt("worketeYb"));
					jdto.setWorketeMb(rs.getInt("worketeMb"));
					jdto.setWorketeDb(rs.getInt("worketeDb"));
					jdto.setWorketsYc(rs.getInt("worketsYc"));
					jdto.setWorketsMc(rs.getInt("worketsMc"));
					jdto.setWorketsDc(rs.getInt("worketsDc"));
					jdto.setWorketeYc(rs.getInt("worketeYc"));
					jdto.setWorketeMc(rs.getInt("worketeMc"));
					jdto.setWorketeDc(rs.getInt("worketeDc"));
					jdto.setMworkEa(rs.getString("mworkEa"));
					jdto.setMworkEb(rs.getString("mworkEb"));
					jdto.setMworkEc(rs.getString("mworkEc"));
					jdto.setLicensEa(rs.getString("licensEa"));
					jdto.setLicensEb(rs.getString("licensEb"));
					jdto.setLicensEc(rs.getString("licensEc"));
					jdto.setAcQuisitionYa(rs.getInt("acQuisitionYa"));
					jdto.setAcQuisitionMa(rs.getInt("acQuisitionMa"));
					jdto.setAcQuisitionDa(rs.getInt("acQuisitionDa"));
					jdto.setAcQuisitionYb(rs.getInt("acQuisitionYb"));
					jdto.setAcQuisitionMb(rs.getInt("acQuisitionMb"));
					jdto.setAcQuisitionDb(rs.getInt("acQuisitionDb"));
					jdto.setAcQuisitionYc(rs.getInt("acQuisitionYc"));
					jdto.setAcQuisitionMc(rs.getInt("acQuisitionMc"));
					jdto.setAcQuisitionDc(rs.getInt("acQuisitionDc"));
					jdto.setIssuanceA(rs.getString("issuanceA"));
					jdto.setIssuanceB(rs.getString("issuanceB"));
					jdto.setIssuanceC(rs.getString("issuanceC"));
					jdto.setPosition(rs.getString("position"));
					jdto.setSalary(rs.getInt("salary"));
					jdto.setTestA(rs.getString("testA"));
					jdto.setScoreA(rs.getString("scoreA"));
					list.add(jdto);
					
				} while (rs.next());
			}
			request.setAttribute("list", list);
			
		} catch (Exception e) {
			System.out.println(" FollowUpHandler 에러 " + e.toString());
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

		
		//수진
		FollowUpdateDTO fudto = null;
		
		conn = null;
		
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
