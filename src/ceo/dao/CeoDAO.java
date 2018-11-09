package ceo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ceo.model.CeoDTO;




public class CeoDAO {

	private static CeoDAO dao = null;
	
	private CeoDAO() {}
	
	public static CeoDAO getInstance() {
		if( dao == null ) {
			dao = new CeoDAO();
		}
		return dao;
	}
	
	
	// ceoinsert
	
	public int insert(Connection conn, CeoDTO dto) {
		PreparedStatement pstmt = null;
		int result = 0;
		
	      if ( dto.getCeoid() != 0) {  //?떟湲?
	          // 1.
	          String sql = "update ceo_board "
	                +" set step=step+1 "
	                +" where ref=? and step > ?";
				
		   try {
			   
			   pstmt = conn.prepareStatement(sql);
	            pstmt.setInt(1, dto.getRef());
	            pstmt.setInt(2, dto.getStep());
	            
	            result = pstmt.executeUpdate();
		   
		   sql = "insert into ceo_board ( "+
					" ceoid, ceotitle,  ceoreadcnt, ceocontent, ceo,   ref, step, depth "
							+ ")"
					+" values "
					+" ( seq_ceo.nextval, ?,?,?,?,?,?,? "
					+" )";
		  
			
			pstmt.setString(1, dto.getCeotitle());			
			pstmt.setInt(2, dto.getCeoreadcnt());
			pstmt.setString(3, dto.getCeocontent());
			pstmt.setString(4, dto.getCeo());
			 pstmt.setInt(5, dto.getRef());
	         pstmt.setInt(6, dto.getStep()+1);
	         pstmt.setInt(7, dto.getDepth()+1);
			
			result = pstmt.executeUpdate();
			
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				try { pstmt.close(); } catch (SQLException e) {	e.printStackTrace();}				
				try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
			}
			}else { //?깉湲?
		         String sql = "insert into ceo_board ( "+
		        		 " ceoid, ceotitle,  ceoreadcnt, ceocontent, ceo,  ref, step, depth "
		                       +"  )"
		                 +" values "
		                 +" ( seq_ceo.nextval, ?,?,?,?"
		                 +" ,seq_ceo.currval,?,? )";
		         
		                 try {
		                	pstmt = conn.prepareStatement(sql);
		                	pstmt.setString(1, dto.getCeotitle());			
		         			pstmt.setInt(2, dto.getCeoreadcnt());
		         			pstmt.setString(3, dto.getCeocontent());
		         			pstmt.setString(4, dto.getCeo());
		         			 pstmt.setInt(5, dto.getStep());
		         	         pstmt.setInt(6, dto.getDepth());
		         	         
		         	        result = pstmt.executeUpdate();
		                    
		                 } catch (SQLException e) {
		                    e.printStackTrace();
		                 }finally {
		                    try { pstmt.close(); } catch (SQLException e) {   e.printStackTrace();}
		                    
		                    try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
		                 }
		        }
	
		
		return result;
	} 
	
	

	// selectList 검색조건 o
		public List<CeoDTO> selectList(
				Connection conn
				, int start, int end
				, String searchCondition
				, String searchWord ){
			
					
			String sql="select * from ";
			sql+="(";
			sql+=" select rownum rnum, ceoid,ceotitle,CEOWRITEDT,CEOREADCNT,CEOCONTENT, ceo, depth ";
			sql+= ", case       when ( sysdate - CEOWRITEDT ) < 0.041667  then  'true'      else 'false'      end  new ";
			sql+=" from ( ";
			sql+="          select * from ceo_board ";
			sql +=" where " + searchCondition +" like '%" + searchWord+"%'";
	        sql+=" order by ref desc, step asc  ";
			sql+="         ) ";
			sql+=")";
			sql+=" where rnum between ? and ?";	
			
			//System.out.println(sql);
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			ArrayList<CeoDTO> list = new ArrayList<>();
			try {
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
				
				rs = pstmt.executeQuery();
				
				CeoDTO dto = null;
				while( rs.next()) {
					dto = new CeoDTO();
					dto.setCeoid(rs.getInt("ceoid"));
					
					//?占쏙옙占?? 占???占쏙옙 議곌굔?占쏙옙 ?占쏙옙移섑븷 ?占쏙옙.
					String ceotitle = rs.getString("ceotitle");
					if( searchCondition.equals("ceotitle")) {
						ceotitle = ceotitle.replace(searchWord
							, String.format("<span style='color:red;background:yellow;'>%s</span>", searchWord) );
					}
					dto.setCeotitle(ceotitle);
					
					dto.setCeowritedt(rs.getDate("CEOWRITEDT"));
					dto.setCeoreadcnt(rs.getInt("CEOREADCNT"));
					dto.setCeocontent(rs.getString("CEOCONTENT"));
					dto.setCeo(rs.getString("ceo"));	
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
		}
	
		
		
	// selectList 검색조건 x
	public List<CeoDTO> selectList(
			Connection conn
			, int start, int end){
		
		String sql="select * from ";
		sql+="(";
		sql+=" select rownum rnum, ceoid,ceotitle,CEOWRITEDT,CEOREADCNT,CEOCONTENT, ceo, depth ";
		sql+= ", case       when ( sysdate - CEOWRITEDT ) < 0.041667  then  'true'      else 'false'      end  new ";
		sql+=" from ( ";
		sql+="          select * from ceo_board ";
	    sql+=" order by ref desc, step asc  ";
		sql+="         ) ";
		sql+=")";
		sql+=" where rnum between ? and ?";	
		
		
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<CeoDTO> list = new ArrayList<>();
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			CeoDTO dto = null;
			while( rs.next()) {
				dto = new CeoDTO();
				dto.setCeoid(rs.getInt("ceoid"));
				dto.setCeotitle(rs.getString("ceotitle"));
				dto.setCeowritedt(rs.getDate("CEOWRITEDT"));
				dto.setCeoreadcnt(rs.getInt("CEOREADCNT"));
				dto.setCeocontent(rs.getString("CEOCONTENT"));
				dto.setCeo(rs.getString("ceo"));	
				dto.setDepth(rs.getInt("depth"));
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
	
	
	//updateReadcount
	public int updateReadcount(Connection conn, int num) {
		String sql = "update ceo_board "
				+" set ceoreadcnt = ceoreadcnt +1 "
				+" where ceoid = ?";
		
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
	
	
	
	// selectOne
	public CeoDTO selectOne(Connection conn, int num) {
		String sql = "select * from ceo_board "
				+" where ceoid = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		CeoDTO dto = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if( rs.next()) {
				dto = new CeoDTO();
				dto.setCeoid(rs.getInt("ceoid"));
				dto.setCeotitle(rs.getString("ceotitle"));
				dto.setCeowritedt(rs.getDate("ceowritedt"));
				dto.setCeoreadcnt(rs.getInt("ceoreadcnt"));
				dto.setCeocontent(rs.getString("ceocontent"));
				dto.setCeo(rs.getString("ceo"));		
				dto.setStep(rs.getInt("step"));
				dto.setDepth(rs.getInt("depth"));				
				dto.setRef(rs.getInt("ref"));
			
				
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
	
	
	//getTotalRecords
	public int getTotalRecords(Connection conn
			,String searchCondition, String searchWord) {
		int cnt = 0;
		String sql = "select count(*) cnt from ceo_board";
		sql +=" where " + searchCondition +" like '%" + searchWord+"%'";
		
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
	
	
	
	public int getTotalRecords(Connection conn) {
		int cnt = 0;
		String sql = "select count(*) cnt from ceo_board";
		
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
			else paging +=String.format("<a href='ceo_list.do?page=%d&searchCondition=%s&searchWord=%s'>%d</a>", i,searchCondition,searchWord,i);
		}
		paging +="</div>";
		return paging; 
	}
	
	
	
	
	public int delete(Connection conn, int num) {
		
		PreparedStatement pstmt = null;
		int cnt = 0;
		
		
		String sql = " delete from ceo_board where ceoid = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			cnt = pstmt.executeUpdate();
			
			
				System.out.println("delete>>"+ cnt);
				return cnt;
			
		} catch (Exception e) {
			System.out.println("> DAO.delete : " + e.toString());
		}finally {
			try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			try {conn.close();} catch (SQLException e) {e.printStackTrace();}
		}
	
		return cnt;
}

	
	
//수정하기
 	public int edit(Connection conn, CeoDTO dto) {

		int result = 0 ;		 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql= " update ceo_board ";
		sql+=" set ceotitle=?,ceocontent=? ";
		sql+=" where ceoid = ?";
		
		try {
			pstmt =  conn.prepareStatement(sql);

			pstmt.setString(1, dto.getCeotitle());
			pstmt.setString(2, dto.getCeocontent());
			pstmt.setInt(3, dto.getCeoid());
			rs = pstmt.executeQuery();
			if( rs.next() ){
					
					result = pstmt.executeUpdate();  
					return 1;
				}else{
					result = -1; 
				}
			
		} catch (SQLException e) { 
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) { 
				e.printStackTrace();
			}
		}
		
		return result; 
	}
}
   
   