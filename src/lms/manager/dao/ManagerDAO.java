package lms.manager.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.util.ConnectionProvider;


public class ManagerDAO {

	private ManagerDAO() {
		
	}
	
	private static ManagerDAO instance;
	
	public static ManagerDAO getInstance() {
		if( instance == null ) {
			instance = new ManagerDAO();
		}
		return instance;
	}
	
	//로그인
	public int userCheck(String mgId, String mPwd) {
		int result = -1;
		String sql = "SELECT mgPwd FROM manager WHERE mgId = ? ";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mgId);
			rs = pstmt.executeQuery();
			
			if ( rs.next() ) {
				if ( rs.getString("mgPwd") != null && rs.getString("mgPwd").equals(mPwd)) {
					result = 1;
				} else {
					result = 0;
				}
			} else {
				result = -1;
			}
		} catch (Exception e) {
			System.out.println(" userCheck() ?뿉?윭" + e.toString());
		} finally {
			if ( rs != null) {
				try {
					rs.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			if ( pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			if ( conn != null) {
				try {
					conn.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			
		} //finally
		return result;
	}//userCheck()
	
	
	//매니저 1명 정보 가져오기.
/*		public ManagerDTO getMember(String mgId) {
			ManagerDTO dto = null;
			String sql = "SELECT * FROM manager WHERE mgId = ? ";
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				conn = ConnectionProvider.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mgId);
				rs = pstmt.executeQuery();
	
				if ( rs.next() ) {
					dto = new ManagerDTO();
									
					
					dto.setMgId(rs.getString("mgId"));
					dto.setmName(rs.getString("mName"));
					dto.setMgPwd(rs.getString("mgPwd"));
					dto.setMgPosition(rs.getString("mgPosition"));
					dto.setMgAddr(rs.getString("mgAddr"));
					dto.setMgEmail(rs.getString("meEmail"));
					dto.setMgPhone(rs.getString("mgPhone"));				
					
				}
			} catch (Exception e) {
				System.out.println(" getMember() �뿉�윭" + e.toString());
			} finally {
				if ( rs != null) {
					try {
						rs.close();
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
				if ( pstmt != null) {
					try {
						pstmt.close();
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
				if ( conn != null) {
					try {
						conn.close();
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
				
			} //finally
			return dto;
	
		}*/
}
