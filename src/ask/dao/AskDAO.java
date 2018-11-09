package ask.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ask.model.AskDTO;
import notice.model.NoticeDTO;

public class AskDAO {

private static AskDAO dao = null;
	
	private AskDAO() {}
	
	public static AskDAO getInstance() {
		if( dao == null ) {
			dao = new AskDAO();
		}
		return dao;
	}
	

	public int insert(Connection conn, AskDTO dto) {
		PreparedStatement pstmt = null;
		int result = 0;
		
	      if ( dto.getAnum() != 0) {  //¥‰±€
	          // 1.
	          String sql = "update ask "
	                +" set step=step+1 "
	                +" where ref=? and step > ?";
				
		   try {
			   
			   pstmt = conn.prepareStatement(sql);
	            pstmt.setInt(1, dto.getRef());
	            pstmt.setInt(2, dto.getStep());
	            
	            result = pstmt.executeUpdate();
		   
		   sql = "insert into ask ( "+
					" anum, atitle, writer, areaded,  acontent, pass, email, ref, step, depth, adid, afile, savefile "
							+ ")"
					+" values "
					+" ( seq_ask.nextval, ?,?,?,?,?,?,?,?,?,?,?,? "
					+" )";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getAtitle());	
			pstmt.setString(2, dto.getWriter());
			pstmt.setInt(3, dto.getAreaded());
			pstmt.setString(4, dto.getAcontent());
			pstmt.setString(5, dto.getPass());
			pstmt.setString(6, dto.getEmail());
	         pstmt.setInt(7, dto.getRef());
	         pstmt.setInt(8, dto.getStep()+1);
	         pstmt.setInt(9, dto.getDepth()+1);
	         pstmt.setString(10, dto.getAdid());
			pstmt.setString(11, dto.getAfile());
			pstmt.setString(12, dto.getSavefile());
	         
			result = pstmt.executeUpdate();
			
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				try { pstmt.close(); } catch (SQLException e) {	e.printStackTrace();}				
				try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
			}
			}else { //ªı±€
		         String sql = "insert into ask ( "+
		        		 " anum, atitle, writer, areaded,  acontent, pass, email, ref, step, depth, adid, afile, savefile "
		                       +"  )"
		                 +" values "
		                 +" ( seq_ask.nextval, ?,?,?,?,?,?"
		                 +" ,seq_ask.currval,?,?, ? ,?,? )";
		                 try {
		                	pstmt = conn.prepareStatement(sql);
		                	
		                	pstmt.setString(1, dto.getAtitle());	
		        			pstmt.setString(2, dto.getWriter());
		        			pstmt.setInt(3, dto.getAreaded());
		        			pstmt.setString(4, dto.getAcontent());
		        			pstmt.setString(5, dto.getPass());
		        			pstmt.setString(6, dto.getEmail());
		        	         pstmt.setInt(7, dto.getStep());
		        	         pstmt.setInt(8, dto.getDepth());
		        	         pstmt.setString(9, dto.getAdid());
		        		    pstmt.setString(10, dto.getAfile());
		        		    pstmt.setString(11, dto.getSavefile());
		        	         
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
	
		public List<AskDTO> selectList(
				Connection conn
				, int start, int end
				, String searchCondition
				, String searchWord ){
			
					
			String sql="select * from ";
			sql+="(";
			sql+=" select rownum rnum, anum,atitle,awritedt,areaded,afile, acontent, writer, adid,  depth, savefile ";
			sql+= ", case       when ( sysdate - awritedt ) < 0.041667  then  'true'      else 'false'      end  new ";
			sql+=" from ( ";
			sql+="          select * from ask ";
			sql +=" where " + searchCondition +" like '%" + searchWord+"%' and adid like 'adId0001' ";
	        sql+=" order by ref desc, step asc  ";
			sql+="         ) ";
			sql+=")";
			sql+=" where  rnum between ? and ?";						
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<AskDTO> list = new ArrayList<>();
			try {
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
				
				rs = pstmt.executeQuery();
				
				AskDTO dto = null;
				while( rs.next()) {
					dto = new AskDTO();
					dto.setAnum(rs.getInt("anum"));					
				
					String atitle = rs.getString("atitle");
					if( searchCondition.equals("atitle")) {
						atitle = atitle.replace(searchWord
							, String.format("<span style='color:red;background:yellow;'>%s</span>", searchWord) );
					}
					dto.setAtitle(atitle);
					
					dto.setAwritedt(rs.getDate("awritedt"));
					dto.setAreaded(rs.getInt("areaded"));
					dto.setAfile(rs.getString("afile"));
					dto.setAcontent(rs.getString("acontent"));					
					dto.setAdid(rs.getString("adid"));
					dto.setWriter(rs.getString("writer"));
					dto.setDepth(rs.getInt("depth"));
					dto.setSavefile(rs.getString("savefile"));
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
	
	
	public List<AskDTO> selectList(
			Connection conn
			, int start, int end){
		
		String sql="select * from ";
		sql+="(";
		sql+=" select rownum rnum, anum,atitle,awritedt,areaded,afile, acontent, writer, adid,  depth, savefile ";
		sql+= ", case       when ( sysdate - awritedt ) < 0.041667  then  'true'      else 'false'      end  new ";
		sql+=" from ( ";
		sql+="          select * from ask where adid like 'adId0001' ";
	    sql+=" order by ref desc, step asc  ";
		sql+="         ) ";
		sql+=")";
		sql+=" where  rnum between ? and ? ";		
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<AskDTO> list = new ArrayList<>();
		try {			
			pstmt = conn.prepareStatement(sql);			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);			
			rs = pstmt.executeQuery();
			
			AskDTO dto = null;
			while( rs.next()) {
				dto = new AskDTO();
				dto.setAnum(rs.getInt("anum"));
				dto.setAtitle(rs.getString("atitle"));
				dto.setAwritedt(rs.getDate("awritedt"));
				dto.setAreaded(rs.getInt("areaded"));
				dto.setAfile(rs.getString("afile"));
				dto.setAcontent(rs.getString("acontent"));
				dto.setWriter(rs.getString("writer"));
				dto.setAdid(rs.getString("adid"));
				dto.setDepth(rs.getInt("depth"));
				dto.setSavefile(rs.getString("savefile"));
				
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

	
	//Ï°∞Ìöå?ÔøΩÔøΩ Ï¶ùÔøΩ? ?ÔøΩÔøΩ?ÔøΩÔøΩÔø??.
	public int updateReadcount(Connection conn, int num) {
		String sql = "update ask "
				+" set areaded = areaded +1 "
				+" where anum = ?";
		
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
		
	
	
	// ?ÔøΩÔøΩ?ÔøΩÔøΩ ?ÔøΩÔøΩ?ÔøΩÔøΩ?ÔøΩÔøΩ Ôø?? Ï°∞Ìöå?ÔøΩÔøΩÔø??.
	public AskDTO selectOne(Connection conn, int num) {
		String sql = "select * from ask "
				+" where anum = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		AskDTO dto = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if( rs.next()) {
				dto = new AskDTO();
				
				dto.setAnum(rs.getInt("anum"));
				dto.setAtitle(rs.getString("atitle"));
				dto.setWriter(rs.getString("writer"));
				dto.setAwritedt(rs.getDate("awritedt"));
				dto.setAreaded(rs.getInt("areaded"));
				dto.setAfile(rs.getString("afile"));
				dto.setAcontent(rs.getString("acontent"));
				dto.setAdid(rs.getString("adid"));
				dto.setEmail(rs.getString("email"));				
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
	
	
	//Ôø?? Í≤åÏÇ¨?ÔøΩÔøΩ ?ÔøΩÔøΩ Ôø???ÔøΩÔøΩ?ÔøΩÔøΩÔø??(Ôø???ÔøΩÔøΩÏ°∞Í±¥ ?ÔøΩÔøΩ?ÔøΩÔøΩ?ÔøΩÔøΩ)
	public int getTotalRecords(Connection conn
			,String searchCondition, String searchWord) {
		int cnt = 0;
		String sql = "select count(*) cnt from ask";
		sql +=" where " + searchCondition +" like '%" + searchWord +"%' and adid like 'adId0001' ";
		
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
	
	
	//Ôø?? Í≤åÏÇ¨?ÔøΩÔøΩ ?ÔøΩÔøΩ Ôø???ÔøΩÔøΩ?ÔøΩÔøΩÔø??(Ôø???ÔøΩÔøΩÏ°∞Í±¥ ?ÔøΩÔøΩ?ÔøΩÔøΩ?ÔøΩÔøΩ)
	public int getTotalRecords(Connection conn) {
		int cnt = 0;
		String sql = "select count(*) cnt from ask where adid like 'adId0001' ";
		                         
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
			else paging +=String.format("<a href='ask_list.do?page=%d&searchCondition=%s&searchWord=%s'>%d</a>", i,searchCondition,searchWord,i);
		}
		paging +="</div>";
		return paging; 
	}
	
	
	
	
	
	// 
	public int delete(Connection conn, int num, String pass) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String original_pass = null;
		
		String sql = "select pass from ask "
					+" where anum = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			rs.next();
			original_pass = rs.getString(1);
			
			if( original_pass.equals(pass)) {
				sql = " delete from ask where anum = ? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				result = pstmt.executeUpdate();
			}else {
				return -1; 
			}
		} catch (Exception e) {
			System.out.println("> DAO.delete : " + e.toString());
		}finally {
			try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			try {conn.close();} catch (SQLException e) {e.printStackTrace();}
		}
	
		return result;
}
	
	
	// ?ÔøΩÔøΩ?ÔøΩÔøΩ?ÔøΩÔøΩ ?ÔøΩÔøΩ?ÔøΩÔøΩ?ÔøΩÔøΩÔø??.(?ÔøΩÔøΩÔø??)
	public int edit(Connection conn, AskDTO dto) {

		int result = 0 ;		 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String original_pass= null;
		String sql= "select pass from ask where anum = ?";
		try {
			pstmt =  conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getAnum());
			rs = pstmt.executeQuery();
			if( rs.next() ){
				original_pass = rs.getString("pass");
				System.out.println(original_pass); 
				
				if( original_pass.equals(dto.getPass())){
					
					sql=" update ask ";
					sql+=" set email=?,atitle=?,acontent=?, afile=? ";
					sql+=" where anum = ?";
					
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, dto.getEmail());
					pstmt.setString(2, dto.getAtitle());
					pstmt.setString(3, dto.getAcontent());
					pstmt.setString(4,  dto.getAfile());
					pstmt.setInt(5, dto.getAnum());
					
					result = pstmt.executeUpdate();  // result =1
				}else{
					result = -1; // ÎπÑÎ?Î≤àÌò∏ ??Î¶¨Îã§.
				}
			}else{
				// Í≤åÏãúÍ∏? ?Ç≠?†ú?êú Í≤ΩÏö∞
				result = -2;
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
		System.out.println(result);
		return result; 
	}
}
   
   
	
	
	
