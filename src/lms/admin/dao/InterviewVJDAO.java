package lms.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import lms.admin.model.InterviewVDTO;



public class InterviewVJDAO {

	private static InterviewVJDAO dao = null;
	
	private InterviewVJDAO() {}
	
	public static InterviewVJDAO getInstance() {
		if( dao == null ) {
			dao = new InterviewVJDAO();
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
		sql+=" select rownum rnum, 	memberid , mname, mbirth, iresult ";
		/*sql+= ", case       when ( sysdate - nwritedt ) < 0.041667  then  'true'      else 'false'      end  new ";*/
		sql+=" from ( ";
		sql+="          select  a.memberid memberid , mname, mbirth, iresult from japplication a inner join member b on a.memberid = b.memberid ";
	    sql+=" where tpid like ? ";
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
				dto = new InterviewVDTO();
				dto.setMemberid(rs.getString("memberid"));
				dto.setMname(rs.getString("mname"));
				dto.setMbirth(rs.getString("mbirth"));		
				dto.setIresult(rs.getString("iresult"));
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
		       sql +=" where tpid = ? " ;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			pstmt.setString(1, tpid);
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
			else paging +=String.format("<a href='interview2_view.do?page=%d'>%d</a>", i,i);
		}
		paging +="</div>";
		return paging; 
	}
	
	// 업데이트. 결과 정보 저장
	
			public int update(Connection conn, InterviewVDTO dto) {
				PreparedStatement pstmt = null;
				int result = 0;

				String sql = "update japplication "
						+" set iresult = ? "
						+" where memberid = ?";
				  
				  try {
					pstmt = conn.prepareStatement(sql);
					
					
					pstmt.setString(1, dto.getIresult());
					pstmt.setString(2, dto.getMemberid());
				
			
					result = pstmt.executeUpdate();
					
				                    
				                 } catch (SQLException e) {
				                    e.printStackTrace();
				                 }finally {
				                    try { pstmt.close(); } catch (SQLException e) {   e.printStackTrace();}		                    
				                    try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
				                 }      
			
				
				return result;
			}
		
	
	
}
   
   