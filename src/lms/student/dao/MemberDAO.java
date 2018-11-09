package lms.student.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.util.ConnectionProvider;

import lms.student.dto.FollowUpdateDTO;
import lms.student.dto.JapplicationDTO;
import lms.student.dto.MemberDTO;
import lms.student.dto.PreTestScoreDTO;
import lms.student.dto.TrainingDTO;

public class MemberDAO {

	private MemberDAO() {

	}

	private static MemberDAO instance;

	public static MemberDAO getInstance() {
		if (instance == null) {
			instance = new MemberDAO();
		}
		return instance;
	}

	// 학생 인증
	public int userCheck(String memberId, String mPwd) {
		int result = -1;
		String sql = "SELECT mPwd FROM member WHERE memberId = ? ";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (rs.getString("mPwd") != null && rs.getString("mPwd").equals(mPwd)) {
					result = 1;
				} else {
					result = 0;
				}
			} else {
				result = -1;
			}
		} catch (Exception e) {
			System.out.println(" userCheck() 에러" + e.toString());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}

		} // finally
		return result;
	}// userCheck()

	// 회원 정보
	public MemberDTO getMember(String memberId) {
		MemberDTO dto = null;
		String sql = "SELECT * FROM member WHERE memberId = ? ";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();

			/*
			 * private String memberId; private String mName; private String mPwd; private
			 * String mEmail; private String mBirth; private String mGender; private int
			 * mZipcode; private String mAddr1; private String member_div; private String
			 * mPhone; private String mTel;
			 */
			if (rs.next()) {
				dto = new MemberDTO();
				dto.setMemberId(rs.getString("memberId"));
				dto.setmName(rs.getString("mName"));
				dto.setmPwd(rs.getString("mPwd"));
				dto.setmEmail(rs.getString("mEmail"));
				dto.setmBirth(rs.getString("mBirth"));
				dto.setmGender(rs.getString("mGender"));
				dto.setmZipcode(rs.getInt("mZipcode"));
				dto.setmAddr1(rs.getString("mAddr1"));
				dto.setMember_div(rs.getString("member_div"));
				dto.setmPhone(rs.getString("mPhone"));
				dto.setmTel(rs.getString("mTel"));
			}
		} catch (Exception e) {
			System.out.println(" getMember() 에러" + e.toString());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}

		} // finally
		return dto;
	} // getMember()

	// 훈련 정보

	public TrainingDTO getTraining(String memberId) {
		TrainingDTO tdto = null;
		String sql = "SELECT * FROM V_MTPINFO WHERE memberId = ? ";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();

			/*
			 * private String memberId; private String tpName; private Date tpoStartDt;
			 * private Date tpoEndDt; private String tpType; private String pName;
			 */

			if (rs.next()) {
				tdto = new TrainingDTO();
				tdto.setMemberId(rs.getString("memberId"));
				tdto.setSbmImgFile(rs.getString("sbmImgFile"));
				tdto.setTpoStartDt(rs.getDate("tpoStartDt"));
				tdto.setTpoEndDt(rs.getDate("tpoEndDt"));
				tdto.setTpName(rs.getString("tpName"));
				tdto.setTpType(rs.getString("tpType"));
				tdto.setTpGuideBook(rs.getString("tpGuideBook"));
				tdto.setpGuide(rs.getString("pGuide"));
				tdto.setpName(rs.getString("pName"));
			}
		} catch (Exception e) {

			System.out.println(" getTraining() 에러 " + e.toString());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		} // finally

		return tdto;
	} // getTraining()

	// 성적 수정

	public int updateTestScore(PreTestScoreDTO ptdto) {

		int result = -1;

		String sql = "	UPDATE PRETESTSCORE  " + " SET ANSWER1 = ?, ANSWER2 = ?, ANSWER3 = ?, ANSWER4 = ?, ANSWER5 = ?,"
				+ " ANSWER6 = ?, ANSWER7 = ?, ANSWER8 = ?, ANSWER9 = ?, ANSWER10 = ?, TOTALSCORE = ?, SECURR = ? "
				+ " WHERE SID = ( select s.SID " + " from MEMBER m, STUDENT s, SEVALUE se "
				+ " where m.MEMBERID = ?  AND m.MEMBERID = s.MEMBERID AND s.SID = se.SID) ";

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ptdto.getAnswer1());
			pstmt.setInt(2, ptdto.getAnswer2());
			pstmt.setInt(3, ptdto.getAnswer3());
			pstmt.setInt(4, ptdto.getAnswer4());
			pstmt.setInt(5, ptdto.getAnswer5());
			pstmt.setInt(6, ptdto.getAnswer6());
			pstmt.setInt(7, ptdto.getAnswer7());
			pstmt.setInt(8, ptdto.getAnswer8());
			pstmt.setInt(9, ptdto.getAnswer9());
			pstmt.setInt(10, ptdto.getAnswer10());
			pstmt.setInt(11, ptdto.getTotalScore());
			pstmt.setString(12, ptdto.getSeCurr());
			pstmt.setString(13, ptdto.getMemberId());

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(" updateTestScore() 에러 " + e.toString());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		} // finally
		return result;
	}

	
	//사후관리 정보
	public FollowUpdateDTO select(Connection conn, String memberId) throws SQLException {

		FollowUpdateDTO fudto = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			String sql = " select * from followup "
						+" where memberId = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memberId);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				fudto = new FollowUpdateDTO();
				fudto.setMemberId(rs.getString("memberId"));
				fudto.setRaeligibleck(rs.getString("raeligibleck"));
				fudto.setRafacility(rs.getString("rafacility"));
				fudto.setRatecha(rs.getString("ratecha"));
				fudto.setRatechb(rs.getString("ratechb"));
				fudto.setRaothers(rs.getString("raothers"));
				fudto.setRgida(rs.getString("rgida"));
				fudto.setRgidb(rs.getString("rgidb"));
				fudto.setRgidc(rs.getString("rgidc"));
				fudto.setWfield(rs.getString("wfield"));
				fudto.setHtype(rs.getString("htype"));
				fudto.setWtype(rs.getString("wtype"));
				fudto.setWtime(rs.getString("wtime"));
				fudto.setRadesiredsal(rs.getInt("radesiredsal"));
				fudto.setCname(rs.getString("cname"));
				fudto.setCpnum(rs.getInt("cpnum"));
				fudto.setEcheck(rs.getString("echeck"));
				fudto.setAddr(rs.getString("addr"));
				fudto.setPhone(rs.getString("phone"));
				fudto.setEfield(rs.getString("efield"));
				fudto.setInsuranceck(rs.getString("insuranceck"));
				fudto.setEdate(rs.getString("edate"));
			}
		
			
		} catch (SQLException e) {
			System.out.println("> 사후관리 select() : " + e.toString());	
		} finally {
			try { rs.close(); } catch (SQLException e) {	e.printStackTrace();}
			try { pstmt.close(); } catch (SQLException e) {	e.printStackTrace();}
			try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
		}
		
		return fudto;
	
	}

	//사후관리 정보 업데이트
	public int fuupdate(Connection conn, FollowUpdateDTO fudto) throws SQLException {

		int result = 0;

		PreparedStatement pstmt = null;

		try {
			String sql = " update followup "
					+" set raeligibleck=?, rafacility=?, ratecha=?, ratechb=?, raothers=?, "
					+" rgida=?, rgidb=?, rgidc=?, wfield=?, htype=?, wtype=?, wtime=?, radesiredsal=? "
					+" , cname=?, cpnum=?, echeck=?, addr=?, phone=?, efield=?, insuranceck=?, edate=? "
					+" where memberId = ? ";	


			pstmt = conn.prepareStatement(sql);
			
			
			pstmt.setString(1, fudto.getRaeligibleck());
			pstmt.setString(2, fudto.getRafacility());
			pstmt.setString(3, fudto.getRatecha());
			pstmt.setString(4, fudto.getRatechb());
			pstmt.setString(5, fudto.getRaothers());
			pstmt.setString(6, fudto.getRgida());
			pstmt.setString(7, fudto.getRgidb());
			pstmt.setString(8, fudto.getRgidc());
			pstmt.setString(9, fudto.getWfield());
			pstmt.setString(10, fudto.getHtype());
			pstmt.setString(11, fudto.getWtype());
			pstmt.setString(12, fudto.getWtime());
			pstmt.setInt(13, fudto.getRadesiredsal());
			pstmt.setString(14, fudto.getCname());
			pstmt.setInt(15, fudto.getCpnum());
			pstmt.setString(16, fudto.getEcheck());
			pstmt.setString(17, fudto.getAddr());
			pstmt.setString(18, fudto.getPhone());
			pstmt.setString(19, fudto.getEfield());
			pstmt.setString(20, fudto.getInsuranceck());
			pstmt.setString(21, fudto.getEdate());
			pstmt.setString(22, fudto.getMemberId());
			
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("> 사후관리 fuupdate() : " + e.toString());	
		} finally {
			try { pstmt.close(); } catch (SQLException e) {	e.printStackTrace();}
			try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
		}
		return result;
	}
	
	
	
}
