package review2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import review.model.ReviewDTO;



public class Review2DAO {

private static Review2DAO dao = null;
	
	private Review2DAO() {}
	
	public static Review2DAO getInstance() {
		if( dao == null ) {
			dao = new Review2DAO();
		}
		return dao;
	}
	

	public int insert(Connection conn, ReviewDTO dto) {
		PreparedStatement pstmt = null;
		int result = 0;
		
	      
		   
		   String sql = "insert into review ( "+
					" rid, rtitle, writer, rreaded,  rcontent, rdid "
							+ ")"
					+" values "
					+" ( seq_review.nextval, ?,?,?,?,? "
					+" )";
		   
		   try{
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getRtitle());	
			pstmt.setString(2, dto.getWriter());
			pstmt.setInt(3, dto.getRreaded());
			pstmt.setString(4, dto.getRcontent());
			pstmt.setString(5, dto.getRdid());
		
	         
			result = pstmt.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				try { pstmt.close(); } catch (SQLException e) {	e.printStackTrace();}				
				try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
			}
	
		
		return result;
	}		
	
		public List<ReviewDTO> selectList(
				Connection conn
				, int start, int end
				, String searchCondition
				, String searchWord ){
			
					
			String sql="select * from ";
			sql+="(";
			sql+=" select rownum rnum, rid, rtitle, writer, rreaded,  rcontent, rdid ";
			sql+= ", case       when ( sysdate - rwritedt ) < 0.041667  then  'true'      else 'false'      end  new ";
			sql+=" from ( ";
			sql+="          select * from review ";
			sql +=" where " + searchCondition +" like '%" + searchWord+"%' and rdid like 'rdId0002' ";
	        /*sql+=" order by ref desc, step asc  ";*/
			sql+=" order by rid desc ";
			sql+="         ) ";
			sql+=")";
			sql+=" where  rnum between ? and ?";						
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<ReviewDTO> list = new ArrayList<>();
			try {
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
				
				rs = pstmt.executeQuery();
				
				ReviewDTO dto = null;
				while( rs.next()) {
					dto = new ReviewDTO();
					
					dto.setRid(rs.getInt("rid"));
					dto.setRtitle(rs.getString("rtitle"));
					dto.setRreaded(rs.getInt("rreaded"));
					dto.setRcontent(rs.getString("rcontent"));
					String writer = rs.getString("writer");
					if( searchCondition.equals("writer")) {
						writer = writer.replace(searchWord
							, String.format("<span style='color:red;background:yellow;'>%s</span>", searchWord) );
					}
					dto.setWriter(writer);
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
		}
	
	
	public List<ReviewDTO> selectList(
			Connection conn
			, int start, int end){
		
		String sql="select * from ";
		sql+="(";
		sql+=" select rownum rnum,  rid, rtitle, writer, rreaded,  rcontent, rdid ";
		sql+= ", case       when ( sysdate - rwritedt ) < 0.041667  then  'true'      else 'false'      end  new ";
		sql+=" from ( ";
		sql+="          select * from review where rdid like 'rdId0002' ";
	 /*   sql+=" order by ref desc, step asc  ";*/
		sql+=" order by rid desc ";
		sql+="         ) ";
		sql+=")";
		sql+=" where  rnum between ? and ? ";		
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ReviewDTO> list = new ArrayList<>();
		try {			
			pstmt = conn.prepareStatement(sql);			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);			
			rs = pstmt.executeQuery();
			
			ReviewDTO dto = null;
			while( rs.next()) {
				dto = new ReviewDTO();
				
				dto.setRid(rs.getInt("rid"));
				dto.setRtitle(rs.getString("rtitle"));
				dto.setRreaded(rs.getInt("rreaded"));
				dto.setRcontent(rs.getString("rcontent"));
				dto.setWriter(rs.getString("writer"));
				
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

	
	//ì¡°íšŒ?ï¿½ï¿½ ì¦ï¿½? ?ï¿½ï¿½?ï¿½ï¿½ï¿??.
	public int updateReadcount(Connection conn, int num) {
		String sql = "update review "
				+" set rreaded = rreaded +1 "
				+" where rid= ?";
		
		PreparedStatement pstmt = null;
		int result = 0;	
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try { pstmt.close(); } catch (SQLException e) {	e.printStackTrace();}
			//try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
		}
		return result;
	}
		
	
	
	// ?ï¿½ï¿½?ï¿½ï¿½ ?ï¿½ï¿½?ï¿½ï¿½?ï¿½ï¿½ ï¿?? ì¡°íšŒ?ï¿½ï¿½ï¿??.
	public ReviewDTO selectOne(Connection conn, int num) {
		String sql = "select * from review "
				+" where rid = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ReviewDTO dto = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if( rs.next()) {
				dto = new ReviewDTO();
				
				dto.setRid(rs.getInt("rid"));
				dto.setRtitle(rs.getString("rtitle"));
				dto.setRreaded(rs.getInt("rreaded"));
				dto.setRcontent(rs.getString("rcontent"));
				dto.setWriter(rs.getString("writer"));
			
			
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try { pstmt.close(); } catch (SQLException e) {	e.printStackTrace();}
			try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
			//try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
		}
		return dto;
	}
	
	
	//ï¿?? ê²Œì‚¬?ï¿½ï¿½ ?ï¿½ï¿½ ï¿???ï¿½ï¿½?ï¿½ï¿½ï¿??(ï¿???ï¿½ï¿½ì¡°ê±´ ?ï¿½ï¿½?ï¿½ï¿½?ï¿½ï¿½)
	public int getTotalRecords(Connection conn
			,String searchCondition, String searchWord) {
		int cnt = 0;
		String sql = "select count(*) cnt from review";
		sql +=" where " + searchCondition +" like '%" + searchWord +"%' and rdid like 'rdId0002' ";
		
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
	
	
	//ï¿?? ê²Œì‚¬?ï¿½ï¿½ ?ï¿½ï¿½ ï¿???ï¿½ï¿½?ï¿½ï¿½ï¿??(ï¿???ï¿½ï¿½ì¡°ê±´ ?ï¿½ï¿½?ï¿½ï¿½?ï¿½ï¿½)
	public int getTotalRecords(Connection conn) {
		int cnt = 0;
		String sql = "select count(*) cnt from review where rdid like 'rdId0002' ";
		                         
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
			, int totalPages, String searchCondition, String searchWord ) { 
		
		int blockStart = ((currentPage-1)/pageBlock)*pageBlock+1;
		int blockEnd = blockStart + pageBlock -1;
		if( blockEnd > totalPages) blockEnd = totalPages;
		
		String paging = "<div style='width:100%;text-align:center'>";
		
		for( int i= blockStart; i<=blockEnd; i++) {
			if( i == currentPage ) paging += i;
			else paging +=String.format("<a href='review2_list.do?page=%d&searchCondition=%s&searchWord=%s'>%d</a>", i,searchCondition,searchWord,i);
		}
		paging +="</div>";
		return paging; 
	}
	
	
	
	
	
	// 
	public int delete(Connection conn, int num) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		
				String sql = " delete from review where rid = ? ";
				
				try{
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				result = pstmt.executeUpdate();
			
		
		} catch (Exception e) {
			System.out.println("> DAO.delete : " + e.toString());
		}finally {
			try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}	
			try {conn.close();} catch (SQLException e) {e.printStackTrace();}
		}
	
		return result;
}
	
	
	// ?ï¿½ï¿½?ï¿½ï¿½?ï¿½ï¿½ ?ï¿½ï¿½?ï¿½ï¿½?ï¿½ï¿½ï¿??.(?ï¿½ï¿½ï¿??)
	public int edit(Connection conn, ReviewDTO dto) {

		int result = 0 ;		 
		PreparedStatement pstmt = null;

			
					
				String	sql=" update review ";
					sql+=" set rtitle=?,rcontent=? ";
					sql+=" where rid = ?";
		   
				try {
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setString(1, dto.getRtitle());
					pstmt.setString(2, dto.getRcontent());	
					pstmt.setInt(3, dto.getRid());
					
					result = pstmt.executeUpdate();  // result =1
			
		} catch (SQLException e) { 
			e.printStackTrace();
		}finally{
			try {
			
				pstmt.close();
			} catch (SQLException e) { 
				e.printStackTrace();
			}
		}
		
		return result; 
	}
}
   
   
	
	
	
