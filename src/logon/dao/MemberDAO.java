package logon.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.util.ConnectionProvider;
import com.util.DBConn;

import logon.model.ManagerDTO;
import net.sf.json.JSONObject;
import sist.mainHandler.MemberDTO;

public class MemberDAO {
	private static MemberDAO dao = null;
	private MemberDAO() {}
	public static MemberDAO getInstance() {
		if( dao == null ) {
			dao = new MemberDAO();
		}
		return dao;
	}



	public int loginCheck(MemberDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;


		int result = -1;

		try {
			// 荑쇰━ - 癒쇱� �엯�젰�맂 �븘�씠�뵒濡� DB�뿉�꽌 鍮꾨�踰덊샇瑜� 議고쉶�븳�떎.

			String sql= "SELECT mpwd FROM member WHERE memberid = ? ";

			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMemberid());
			rs = pstmt.executeQuery();

			if (rs.next()) // �엯�젮�맂 �븘�씠�뵒�뿉 �빐�떦�븯�뒗 鍮꾨쾲 �엳�쓣寃쎌슦
			{

				if (rs.getString("mpwd").equals(dto.getMpwd())) 

					result = 1 ; // �꽆寃⑤컺�� 鍮꾨쾲怨� 爰쇰궡�삩 諛곕쾲 鍮꾧탳. 媛숈쑝硫� �씤利앹꽦怨�
				else                  
					result = 0; // DB�쓽 鍮꾨�踰덊샇�� �엯�젰諛쏆� 鍮꾨�踰덊샇 �떎由�, �씤利앹떎�뙣

			} else {
				result = -1; // �빐�떦 �븘�씠�뵒媛� �뾾�쓣 寃쎌슦
			}

			return result;

		} catch (Exception sql) {
			throw new RuntimeException(sql.getMessage());
		} finally {
			try{
				if ( rs != null ){ rs.close(); rs=null; }
				if ( pstmt != null ){ pstmt.close(); pstmt=null; }                
				if ( conn != null ){ conn.close(); conn=null;    }
			}catch(Exception e){
				throw new RuntimeException(e.getMessage());
			}
		}
	} // end loginCheck()



	public JSONObject findId(String mname, String memail, String mphone) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JSONObject data = null;

		try {


			String sql= "SELECT memberid FROM member WHERE mname = ? and memail = ? and mphone = ? ";

			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mname);
			pstmt.setString(2, memail);
			pstmt.setString(3, mphone);
			rs = pstmt.executeQuery();


			if (rs.next()) // �엯�젮�맂 �븘�씠�뵒�뿉 �빐�떦�븯�뒗 鍮꾨쾲 �엳�쓣寃쎌슦
			{


				String mid = rs.getString("memberid");

				data = new JSONObject();
				data.put("mid", mid);



				return data;

			}
			// �빐�떦 �븘�씠�뵒媛� �뾾�쓣 寃쎌슦




		} catch (Exception e) {
			System.out.println(">> MemberDAO.findId() : " + e.toString());
		} finally {
			try{
				if ( rs != null ){ rs.close(); rs=null; }
				if ( pstmt != null ){ pstmt.close(); pstmt=null; }                
				if ( conn != null ){ conn.close(); conn=null;    }
			}catch(Exception e){
				System.out.println(">> MemberDAO.findId() : " + e.toString());
			}
		}


		return data;
	} // end findId()



	public String randomPwd() {
		char[] charset=new char[]{'0','1','2','3','4','5','6','7','8','9'
				,'a','b','c','d','e','f','g','h','i'
				,'j','k','l','m','n','o','p','q','r','s'
				,'t','u','v','w','x','y','z'};
		int idx;
		StringBuffer sb=new StringBuffer(); 
		for(int i=1; i<=10;i++) {  //諛섎났�슏�닔媛� �엫�떆鍮꾨�踰덊샇 湲몄씠媛� �맖
			idx=(int)(charset.length * (Math.random()));
			
			sb.append(charset[idx]);
		}
		return sb.toString();

	}


	public int UpdatePwd(String memberid, String sb) {


		String sql = " update member set mpwd = ? " 
				+" where memberid = ? ";


		Connection conn = null;
		PreparedStatement pstmt = null;	   
		int result = 0;


		try {
			conn = ConnectionProvider.getConnection();

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sb);
			pstmt.setString(2, memberid);
			result = pstmt.executeUpdate();

			/*	data = new JSONObject();
			data.put("result", result);
			data.put("memberid", memberid);
			data.put("sb", sb);*/
			/* System.out.println(data);*/
			return result;

		} catch (Exception e) {
			System.out.println(">> MemberDAO.UpdatePwd(): "+ e.toString());
		}finally {
			try{
				if ( pstmt != null ){ pstmt.close(); pstmt=null; }                
				if ( conn != null ){ conn.close(); conn=null;    }
			}catch(Exception e){
				System.out.println(">> MemberDAO.UpdatePwd() : " + e.toString());
			}
		}
		return result;


	}


	public int managerChk(String mgid, String mgpwd) {


		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ManagerDTO dto = null;
		
		
		try {
			// 荑쇰━ - 癒쇱� �엯�젰�맂 �븘�씠�뵒濡� DB�뿉�꽌 鍮꾨�踰덊샇瑜� 議고쉶�븳�떎.
			String sql= "SELECT mgpwd,mgid FROM manager WHERE mgid = ? ";

			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mgid);
			rs = pstmt.executeQuery();
			dto = new ManagerDTO();
			if (rs.next()) // �엯�젮�맂 �븘�씠�뵒�뿉 �빐�떦�븯�뒗 鍮꾨쾲 �엳�쓣寃쎌슦
			{

				if (rs.getString("mgpwd").equals(mgpwd)) {

					dto.setMgid(rs.getString("mgid")); // �꽆寃⑤컺�� 鍮꾨쾲怨� 爰쇰궡�삩 諛곕쾲 鍮꾧탳. 媛숈쑝硫� �씤利앹꽦怨�
					dto.setMgpwd(rs.getString("mgpwd"));
					return 7;
				}else {
					return 8;
				}
				 // DB�쓽 鍮꾨�踰덊샇�� �엯�젰諛쏆� 鍮꾨�踰덊샇 �떎由�, �씤利앹떎�뙣

			}else {
				// �빐�떦 �븘�씠�뵒媛� �뾾�쓣 寃쎌슦
				return 9;
			}

		} catch (Exception sql) {
			throw new RuntimeException(sql.getMessage());
		} finally {
			try{
				if ( rs != null ){ rs.close(); rs=null; }
				if ( pstmt != null ){ pstmt.close(); pstmt=null; }                
				if ( conn != null ){ conn.close(); conn=null;    }
			}catch(Exception e){
				throw new RuntimeException(e.getMessage());
			}
		}

		
	}
}
