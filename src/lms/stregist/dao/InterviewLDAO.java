package lms.stregist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import lms.stregist.model.InterviewDTO;


public class InterviewLDAO {

	private static InterviewLDAO dao = null;
	
	private InterviewLDAO() {}
	
	public static InterviewLDAO getInstance() {
		if( dao == null ) {
			dao = new InterviewLDAO();
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
	
	
	
	public ArrayList<InterviewDTO> selectList(
			Connection conn
			, int start, int end){
		
		String sql="select * from ";
		sql+="(";
		sql+=" select rownum rnum, tpname, tpdaily, tptype, adminstart, adminend, campusname, tpid ";
		/*sql+= ", case       when ( sysdate - nwritedt ) < 0.041667  then  'true'      else 'false'      end  new ";*/
		sql+=" from ( ";
		sql+="          select * from tp_name ";
	    sql+=" where menutype like 1 or menutype like 2 ";
	    sql+=" order by tpid desc ";
		sql+="         ) ";
		sql+=")";
		sql+=" where rnum between ? and ?";			
		
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<InterviewDTO> list = new ArrayList<>();
		try {
			
			pstmt = conn.prepareStatement(sql);			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);			
			rs = pstmt.executeQuery();
			
			InterviewDTO dto = null;
			while( rs.next()) {
				dto = new InterviewDTO();				
				dto.setTpname(rs.getString("tpname"));
				dto.setTpdaily(rs.getString("tpdaily"));
				dto.setTptype(rs.getString("tptype"));				
				dto.setAdminstart(rs.getString("adminstart"));
				dto.setAdminend(rs.getString("adminend"));	
				dto.setCampusname(rs.getString("campusname"));
				dto.setTpid(rs.getString("tpid"));
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
	
	public int getTotalRecords(Connection conn) {
		int cnt = 0;
		String sql = "select count(*) cnt from tp_name ";
		       sql+=" where menutype like 1 or menutype like 2 ";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
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
			else paging +=String.format("<a href='regist_list.do?page=%d'>%d</a>", i,i);
		}
		paging +="</div>";
		return paging; 
	}

	public int delete(Connection conn, String tpid) {
		
		int result = 0;
		PreparedStatement pstmt = null;		
		
		String sql = " delete from tp_name where tpid = ? ";
		
		try {
		
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, tpid);
				result = pstmt.executeUpdate();
			
		
	   } catch (Exception e) {
			System.out.println("> DAO.delete : " + e.toString());
			
		}finally {
			/*try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}			*/
			/*try {conn.close();} catch (SQLException e) {e.printStackTrace();}*/
		}
	
		return result;
	}
	
	
}
   
   