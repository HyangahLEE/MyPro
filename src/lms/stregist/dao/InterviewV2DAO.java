package lms.stregist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import lms.stregist.model.InterviewVDTO;





public class InterviewV2DAO {

	private static InterviewV2DAO dao = null;
	
	private InterviewV2DAO() {}
	
	public static InterviewV2DAO getInstance() {
		if( dao == null ) {
			dao = new InterviewV2DAO();
		}
		return dao;
	}		
	
	
	
	/*public List<ReplyBoardDTO> selectList(
			Connection conn){
		String sql = "select * from notice "
				+" order by ref desc, step asc";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ReplyBoardDTO> list = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			ReplyBoardDTO dto = null;
			while( rs.next()) {
				dto.setNnum(rs.getInt("nnum"));
				dto.setNtitle(rs.getString("ntitle"));
				dto.setNwritedt(rs.getDate("nwritedt"));
				dto.setNreaded(rs.getInt("nreaded"));
				dto.setNcontent(rs.getString("ncontent"));
				dto.setMgid(rs.getString("mgid"));
				dto.setRef(rs.getInt("ref"));
				dto.setStep(rs.getInt("step"));
				dto.setDepth(rs.getInt("depth"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try { pstmt.close(); } catch (SQLException e) {	e.printStackTrace();}
			try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
			try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
		}
		return list;
	}*/
	
	
	
	public List<InterviewVDTO> selectList(
			Connection conn, String tpid
			, int start, int end){
		
		String sql="select * from ";
		sql+="(";
		sql+=" select rownum rnum, memberid , mname, mbirth, sbmworkcerti, sbmbank, sbmaccount ";
		/*sql+= ", case       when ( sysdate - nwritedt ) < 0.041667  then  'true'      else 'false'      end  new ";*/
		sql+=" from ( ";
		sql+="          select  a.memberid memberid , mname, mbirth, sbmworkcerti, sbmbank, sbmaccount from iapplication a inner join member b on a.memberid = b.memberid ";
		sql+="           inner join student c on b.memberid = c.memberid inner join sbooking_m d on c.sid = d.sid ";
		sql+=" where tpid like ? and iresult = '합격' ";
		sql+=" order by jacid desc ";
		sql+="         ) ";
		sql+=")";
		sql+=" where rnum between ? and ?";			
		
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<InterviewVDTO> list = new ArrayList<>();
		try {
			
			pstmt = conn.prepareStatement(sql);		
			pstmt.setString(1, tpid);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);			
			
			rs = pstmt.executeQuery();
			
			InterviewVDTO dto = null;
			while( rs.next()) {
				dto.setMemberid(rs.getString("memberid"));
				dto.setMname(rs.getString("mname"));
				dto.setMbirth(rs.getString("mbirth"));		
			    dto.setSbmaccount(rs.getString("sbmaccount"));
			    dto.setSbmbank(rs.getString("sbmbank"));
			    dto.setSbmworkcerti(rs.getString("sbmworkcerti"));
				list.add(dto);
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try { pstmt.close(); } catch (SQLException e) {	e.printStackTrace();}
			try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
			//try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
		}
		return list;
	}
	
	public int getTotalRecords(Connection conn, String tpid) {
		int cnt = 0;
		String sql = "select count(*) cnt from japplication ";
		        sql +=" where tpid = ? and iresult = '합격' " ;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tpid);
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt("cnt");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try { pstmt.close(); } catch (SQLException e) {	e.printStackTrace();}
			//try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
			
		}
		return cnt;
	}
	
	
	
	//"1 2 3 4 5 6 7 8 9 10 >";
	public String pagingProc(int currentPage, int pageSize, int pageBlock	// 1 2 3... 10
			, int totalPages) { 
		
		int blockStart = ((currentPage-1)/pageBlock)*pageBlock+1;
		int blockEnd = blockStart + pageBlock -1;
		if( blockEnd > totalPages) blockEnd = totalPages;
		
		String paging = "<div style='width:100%;text-align:center'>";
		
		for( int i= blockStart; i<=blockEnd; i++) {
			if( i == currentPage ) paging += i;
			else paging +=String.format("<a href='regist2_view.do?page=%d'>%d</a>", i,i);
		}
		paging +="</div>";
		return paging; 
	}
	
	
}
   
   